--
-- File generated with SQLiteStudio v3.3.3 on Ср сен 14 11:32:19 2022
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: categories
CREATE TABLE categories (
    cat_id   INTEGER UNIQUE,
    cat_name VARCHAR,
    priority INTEGER
);

INSERT INTO categories (
                           cat_id,
                           cat_name,
                           priority
                       )
                       VALUES (
                           11,
                           'k',
                           1
                       );

INSERT INTO categories (
                           cat_id,
                           cat_name,
                           priority
                       )
                       VALUES (
                           10,
                           'j',
                           1
                       );

INSERT INTO categories (
                           cat_id,
                           cat_name,
                           priority
                       )
                       VALUES (
                           9,
                           'i',
                           1
                       );

INSERT INTO categories (
                           cat_id,
                           cat_name,
                           priority
                       )
                       VALUES (
                           8,
                           'h',
                           1
                       );

INSERT INTO categories (
                           cat_id,
                           cat_name,
                           priority
                       )
                       VALUES (
                           7,
                           'g',
                           1
                       );

INSERT INTO categories (
                           cat_id,
                           cat_name,
                           priority
                       )
                       VALUES (
                           6,
                           'f',
                           1
                       );

INSERT INTO categories (
                           cat_id,
                           cat_name,
                           priority
                       )
                       VALUES (
                           5,
                           'e',
                           1
                       );

INSERT INTO categories (
                           cat_id,
                           cat_name,
                           priority
                       )
                       VALUES (
                           4,
                           'd',
                           1
                       );

INSERT INTO categories (
                           cat_id,
                           cat_name,
                           priority
                       )
                       VALUES (
                           3,
                           'c',
                           1
                       );

INSERT INTO categories (
                           cat_id,
                           cat_name,
                           priority
                       )
                       VALUES (
                           2,
                           'b',
                           1
                       );

INSERT INTO categories (
                           cat_id,
                           cat_name,
                           priority
                       )
                       VALUES (
                           1,
                           'a',
                           1
                       );


-- Table: items
CREATE TABLE items (
    id     INTEGER UNIQUE,
    name   CHAR,
    photo  INTEGER,
    cat_id INTEGER,
    price  VARCHAR
);

INSERT INTO items (
                      id,
                      name,
                      photo,
                      cat_id,
                      price
                  )
                  VALUES (
                      1,
                      'aa',
                      1,
                      1,
                      '100 000'
                  );

INSERT INTO items (
                      id,
                      name,
                      photo,
                      cat_id,
                      price
                  )
                  VALUES (
                      2,
                      'ab',
                      2,
                      1,
                      '75 000'
                  );

INSERT INTO items (
                      id,
                      name,
                      photo,
                      cat_id,
                      price
                  )
                  VALUES (
                      4,
                      'da',
                      4,
                      4,
                      '150 000'
                  );

INSERT INTO items (
                      id,
                      name,
                      photo,
                      cat_id,
                      price
                  )
                  VALUES (
                      3,
                      'ca',
                      3,
                      3,
                      '250 000'
                  );

INSERT INTO items (
                      id,
                      name,
                      photo,
                      cat_id,
                      price
                  )
                  VALUES (
                      5,
                      'ga',
                      5,
                      7,
                      '175 000'
                  );


-- Table: orders
CREATE TABLE orders (
    id      INTEGER,
    item_id INTEGER,
    count   INTEGER,
    user_id INTEGER,
    comment VARCHAR
);


-- Table: users
CREATE TABLE users (
    id       INTEGER,
    username CHAR,
    surname  VARCHAR,
    nickname VARCHAR,
    state    INTEGER,
    phonenum VARCHAR
);

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );

INSERT INTO users (
                      id,
                      username,
                      surname,
                      nickname,
                      state,
                      phonenum
                  )
                  VALUES (
                      116264208,
                      'Jamshid',
                      'Toshboev',
                      'Evilwill',
                      NULL,
                      NULL
                  );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
