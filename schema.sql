 CREATE TABLE bin (
	id		VARCHAR(64) NOT NULL PRIMARY KEY,
	readonly	BOOLEAN NOT NULL,
	status		INT NOT NULL,
	updated		TIMESTAMP NOT NULL,
	created		TIMESTAMP NOT NULL,
	expiration	TIMESTAMP NOT NULL,
	deleted		TIMESTAMP NOT NULL,
	downloads	BIGINT NOT NULL
);

CREATE TABLE file (
	id		BIGSERIAL NOT NULL PRIMARY KEY,
	bin_id		VARCHAR(64) REFERENCES bin(id) ON DELETE CASCADE,
	filename	VARCHAR(128) NOT NULL,
	status		INT NOT NULL,
	mime		VARCHAR(128) NOT NULL,
	bytes		BIGINT NOT NULL,
	md5		VARCHAR(128) NOT NULL,
	sha256		VARCHAR(128) NOT NULL,
	downloads	BIGINT NOT NULL,
	updates 	BIGINT NOT NULL,
	ip		VARCHAR(128) NOT NULL,
	trace		TEXT NOT NULL,
	nonce		VARCHAR(128) NOT NULL,
	updated		TIMESTAMP NOT NULL,
	created		TIMESTAMP NOT NULL,
	deleted		TIMESTAMP NOT NULL,
	UNIQUE(bin_id, filename)
);

/*
CREATE TABLE transaction (
	id		BIGSERIAL NOT NULL PRIMARY KEY,
	bin_id		VARCHAR(64) REFERENCES bin(id) ON DELETE CASCADE,
	file_id		BIGINT REFERENCES file(id) ON DELETE CASCADE,
	action		INT NOT NULL,
	ip		VARCHAR(128) NOT NULL,
	trace		TEXT NOT NULL,
	duration	BIGINT NOT NULL,
	started		TIMESTAMP NOT NULL,
	finished	TIMESTAMP NOT NULL,
	UNIQUE(id)
);
*/
