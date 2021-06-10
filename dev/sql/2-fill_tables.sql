INSERT INTO users(pseudo) VALUES
    ('Paul'), ('René'), ('Jules'), ('Yves-Albert');

INSERT INTO friends(user1_id, user2_id) VALUES
    ((SELECT id FROM users WHERE pseudo = 'Paul'), (SELECT id FROM users WHERE pseudo = 'René')),
    ((SELECT id FROM users WHERE pseudo = 'Paul'), (SELECT id FROM users WHERE pseudo = 'Jules')),
    ((SELECT id FROM users WHERE pseudo = 'René'), (SELECT id FROM users WHERE pseudo = 'Jules')),
    ((SELECT id FROM users WHERE pseudo = 'René'), (SELECT id FROM users WHERE pseudo = 'Yves-Albert'));

INSERT INTO groups(name) VALUES
    ('Les rats'), ('');

INSERT INTO user_group(group_id, user_id, role_id) VALUES
    ((SELECT id FROM groups WHERE name = 'Les rats'), (SELECT id FROM users WHERE pseudo = 'Paul'), 1),
    ((SELECT id FROM groups WHERE name = 'Les rats'), (SELECT id FROM users WHERE pseudo = 'René'), 0),
    ((SELECT id FROM groups WHERE name = 'Les rats'), (SELECT id FROM users WHERE pseudo = 'Jules'), 0),
    ((SELECT id FROM groups WHERE name = ''), (SELECT id FROM users WHERE pseudo = 'René'), 1),
    ((SELECT id FROM groups WHERE name = ''), (SELECT id FROM users WHERE pseudo = 'Yves-Albert'), 1);
