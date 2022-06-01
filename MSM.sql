CREATE TABLE S_Company (
                sc_id CHAR(4) NOT NULL,
                name VARCHAR(12) NOT NULL,
                telephone VARCHAR(15),
                address VARCHAR(30),
                CONSTRAINT S_Company_pk PRIMARY KEY (sc_id)
)

CREATE TABLE Singer (
                s_id CHAR(5) NOT NULL,
				sc_id CHAR(4) NOT NULL,
                name VARCHAR(12),
                language VARCHAR(10),
				status VARCHAR(5),
                CONSTRAINT Singer_pk PRIMARY KEY (s_id),
				FOREIGN KEY (sc_id) REFERENCES S_Company (sc_id) 
)

CREATE TABLE A_Company (
                c_id CHAR(4) NOT NULL,
                name VARCHAR(12) NOT NULL,
                telephone VARCHAR(15),
                address VARCHAR(30),
                CONSTRAINT A_Company_pk PRIMARY KEY (c_id)

)


CREATE TABLE Album (
                a_id CHAR(4) NOT NULL,
				s_id CHAR(5) NOT NULL,
				c_id CHAR(4) NOT NULL,
                name VARCHAR(12) NOT NULL,
                date DATETIME,
                price INT,
                CONSTRAINT Album_pk PRIMARY KEY (a_id),
				FOREIGN KEY (c_id) REFERENCES A_Company (c_id), 
				FOREIGN KEY (s_id) REFERENCES Singer (s_id) 
)

CREATE TABLE Streaming_Media (
                SM_id CHAR(4) NOT NULL,
                name VARCHAR(12) NOT NULL,
                company VARCHAR(15),
                URL  TEXT,
                CONSTRAINT Streaming_Media_pk PRIMARY KEY (SM_id)
)

CREATE TABLE User_Data(
                u_id CHAR(4) NOT NULL,
                name VARCHAR(12) NOT NULL,
                birthday DATETIME,
                telephone VARCHAR(15),
				sex	VARCHAR(6)
                CONSTRAINT User_Data_pk PRIMARY KEY (u_id)
)
CREATE TABLE Pay_method (
                p_id CHAR(4) NOT NULL,
                method VARCHAR(12) NOT NULL,
                CONSTRAINT Pay_method_pk PRIMARY KEY (p_id)
)


CREATE TABLE Order_List (
                a_id CHAR(4) NOT NULL,
				u_id CHAR(4) NOT NULL,
                p_id CHAR(4) NOT NULL,
				SM_id CHAR(4) NOT NULL,
                total_price INT,
                rating INT,
                sell_date DATETIME,
                CONSTRAINT Order_List_pk PRIMARY KEY (a_id, u_id, p_id,SM_id),
				FOREIGN KEY (a_id) REFERENCES Album (a_id), 
				FOREIGN KEY (u_id) REFERENCES User_Data(u_id), 
				FOREIGN KEY (p_id) REFERENCES Pay_method (p_id), 
				FOREIGN KEY (SM_id) REFERENCES Streaming_Media(SM_id) 
)
