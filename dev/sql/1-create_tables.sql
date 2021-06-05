CREATE TABLE users (
    id SERIAL,
    pseudo TEXT,
    last_time_online TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE friends (
    user1_id INTEGER REFERENCES users(id),
    user2_id INTEGER REFERENCES users(id),
    PRIMARY KEY (user1_id, user2_id)
);

CREATE TABLE groups (
    id SERIAL,
    name TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE binary_content (
    id SERIAL,
    type TEXT,
    content BYTEA,
    PRIMARY KEY(id)
);

CREATE TABLE messages (
    id SERIAL,
    group_id INTEGER REFERENCES groups(id),
    sender INTEGER REFERENCES users(id),
    when_sent TIMESTAMP,
    text TEXT,
    binary_id INTEGER REFERENCES binary_content(id),
    PRIMARY KEY(id)
);

CREATE TABLE roles (
    id SERIAL,
    name text,
    PRIMARY KEY(id)
);

CREATE TABLE user_group (
    group_id INTEGER REFERENCES groups(id),
    user_id INTEGER REFERENCES users(id),
    role_id INTEGER REFERENCES roles(id),
    last_received_id INTEGER REFERENCES messages(id),
    last_read_id INTEGER REFERENCES messages(id),
    PRIMARY KEY (group_id, user_id)
);
