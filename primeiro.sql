-- Meu primeiro arquivo DUMP para MySQL

-- Apaga o banco de dados caso ele exista
-- !!!!!!!!!!!!!!!!!!!!!! ATENÇÃO !!!!!!!!!!!!!!!!!!!
-- Remova este comando após a publicação da versão de produção
DROP DATABASE IF EXISTS primeiro;

-- Cria o banco de dados
-- Define a tabela de caracters UTF-8(utf8mb4)
-- Define as buscas para UTF-8 case-insensitive
-- !!!!!!!!!!!!!!!!!!!!!! ATENÇÃO !!!!!!!!!!!!!!!!!!!
-- Remova este comando após a publicação da versão de produção
CREATE DATABASE primeiro CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Definir o banco de dados com qual vamos trabalhar
USE primeiro;

-- Modelar a tabela "employee"
CREATE TABLE employee (
    user_id  INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(127)  NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    user_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_status ENUM('on','off','del') DEFAULT 'on'
);

-- Modelar a tabela "contact"
CREATE TABLE contact (
    cont_id INT PRIMARY KEY AUTO_INCREMENT, 
    cont_name VARCHAR(127) NOT NULL, 
    cont_email VARCHAR(255) NOT NULL, 
    cont_subject VARCHAR(63),
    cont_message LONGTEXT,
    user_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_status ENUM('recebido','lido','respondido','apagado') DEFAULT 'recebido'
);

-- Modelar a tabela "article"
CREATE TABLE article(
    art_id INT PRIMARY KEY AUTO_INCREMENT,
    art_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    art_title VARCHAR(127),
    art_intro VARCHAR(255),
    art_content LONGTEXT,
    art_author INT, -- Chave estrangeira para 'employee'
    art_status ENUM('on','off','del') DEFAULT 'on',
    -- Especifica a chave estrangeira
    FOREIGN KEY (art_author) REFERENCES employee(user_id)
);

-- Inserindo alguns "employee" para testes
INSERT INTO employee (
    user_name,
    user_email,
    user_password
) VALUES (
    "Diana XYZ",
    "diana@email.com",
    SHA1("eumeamoS2") -- SHA1 realizada a criptografia no BD(DB)
), (
    "Jean ZYX",
    "jean@email.com",
    SHA1("a1b2c3d4")
), (
    "Matheus ABC",
    "math@email.com",
    SHA1("xyz123")
);

-- Inserindo dados na tabela "contact" para testes
INSERT INTO contact (
    cont_name,
    cont_email,
    cont_subject,
    cont_message
) VALUES (
    "Cosme Bispo",
    "bispo@email.net",
    "Lorem ipsum",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla fermentum scelerisque erat, id facilisis ligula. Morbi eu eros auctor, varius odio sit amet, tristique nunc. Phasellus interdum viverra justo, a cursus lacus tempus sed. Vivamus ultrices, quam nec scelerisque efficitur, turpis justo tincidunt arcu, sed laoreet turpis sapien non lectus. Donec eget suscipit justo. Nullam auctor purus sit amet sem tincidunt, id fringilla odio scelerisque.

    Vestibulum vulputate sagittis sapien, nec bibendum ipsum euismod at. Praesent lacinia eros quis velit fermentum, et pharetra purus blandit. Donec nec massa a nisi eleifend tempor. Aliquam euismod libero a velit vehicula fringilla. Suspendisse potenti. Fusce tempor libero eu lorem pellentesque dapibus. Cras sagittis ante non enim dictum, vel consequat quam aliquet.

    Mauris convallis urna non urna aliquam varius. Phasellus sit amet ligula sit amet nulla tempor aliquam. Nullam euismod, elit eget consequat fringilla, ligula purus cursus risus, ac vehicula turpis erat in ipsum. Curabitur varius sapien at suscipit consequat. Suspendisse condimentum urna at quam convallis, et congue ante dictum. Integer vel viverra lacus. Nullam lacinia turpis non neque tincidunt, a varius dolor aliquet."
), (
    "Luciano Pereira",
    "pereira@mail.com",
    "Lorem ipsum Lorem ipsum Lorem ipsum",
    "Lorem ipsum odor amet, consectetuer adipiscing elit. Fames senectus viverra phasellus, egestas eros maecenas. Sagittis sociosqu nam massa orci, proin sagittis himenaeos finibus. Taciti proin per urna ad rhoncus nullam lacinia. Platea enim elit habitasse eu diam montes nunc. Habitasse tristique nunc turpis venenatis tempus ornare sodales. Non elit vulputate augue scelerisque commodo mattis curae habitant. Facilisis molestie nunc tortor mauris; montes est lacinia. Tristique taciti class blandit vestibulum ridiculus aptent.

    Dictumst blandit pellentesque nulla vestibulum hendrerit dui turpis. Ligula at pellentesque suscipit diam ac dolor eu libero. Adipiscing vehicula ex potenti potenti bibendum, porta rhoncus. Laoreet blandit habitasse sed, fermentum nunc quisque neque. Acongue lacus convallis ex potenti eget mauris porta elementum. Class tristique suscipit auctor conubia pellentesque orci integer. Vel sociosqu egestas auctor lacus eros duis risus.

    Elit imperdiet molestie finibus praesent lacus ante facilisi. Eleifend torquent adipiscing ad sociosqu eu et dis porttitor. Aenean bibendum leo ullamcorper blandit ipsum magnis semper fusce. At imperdiet mattis porta sem phasellus. Tempus interdum tempus finibus at dolor odio. Commodo quisque vulputate metus a fames finibus finibus bibendum? Cubilia nisl faucibus a condimentum lacinia eros?

    Penatibus curae eget, ultricies class condimentum fusce euismod aenean. Ad taciti porta aptent tempus varius pretium nulla. Pharetra lectus nulla facilisis consectetur non? Nisl at et inceptos cubilia; urna laoreet. Tempor rhoncus gravida congue viverra sagittis nullam blandit. Sollicitudin porttitor pharetra nullam fringilla lobortis sagittis porta. Hac phasellus nisi phasellus; eu taciti dignissim.

    Vulputate rhoncus lorem dolor vulputate donec pulvinar primis malesuada. Fringilla blandit id nibh ad ante ipsum tristique dictum metus. Eu hac maximus est maecenas interdum. Conubia vulputate finibus non aenean nunc mattis magnis non leo. Aliquam parturient feugiat conubia per enim sapien lacinia aliquam senectus. Massa cras sagittis laoreet dignissim ipsum vel turpis. Placerat primis penatibus litora lobortis non. Euismod venenatis ridiculus phasellus tristique cras. Risus platea natoque suscipit ligula enim mollis."
);

-- Inserindo dados na tabela "article" para testes
INSERT INTO article(
    art_title,
    art_intro,
    art_content,
    art_author
) VALUES (
    "Era uma vez....",
    "AS AS AS AS AS AS AS AS AS AS AS AS AS",
    "MUITAS LETRAS QUE DEVERIA ESTÁ AQUI",
    1
);

