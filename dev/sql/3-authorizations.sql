-- crée un rôle (utilisateur) pour l'application
CREATE USER secure_messenger_app WITH PASSWORD 'a_changer';

-- donne les droits nécessaires au rôle secure_messenger_app
GRANT USAGE ON SCHEMA public TO secure_messenger_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES  IN SCHEMA public TO secure_messenger_app;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO secure_messenger_app;
