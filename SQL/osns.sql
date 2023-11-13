

create table user (
	id int auto_increment primary key not null,						
	name varchar(100) not null,							
	email varchar(50) not null,							
	password varchar(20) not null,								
	user_name datetime(20) not null,								
	adding_time datetime(20) not null,								
	deleting_time datetime(20) not null,							
	update_time datetime(20) not null,								
	flag TINYINT(1) NOT NULL DEFAULT 0						
);

CREATE TABLE address (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id),
    address VARCHAR(20) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    admin_name VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL,
    adding_time DATETIME NOT NULL,
    deleting_time DATETIME NOT NULL,
    update_time DATETIME NOT NULL,
    flag TINYINT(1) NOT NULL DEFAULT 0
);

CREATE TABLE company (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,								
company_name VARCHAR(20) NOT NULL,								
address VARCHAR(30) NOT NULL,								
password VARCHAR(20) NOT NULL,								
company_image VARCHAR(20) NOT NULL,
email VARCHAR(20) NOT NULL,							
name VARCHAR(20) NOT NULL,								
phone_number VARCHAR(20) NOT NULL,		
adding_time datetime(20) not null,								
deleting_time datetime(20) not null,							
update_time datetime(20) not null,								
flag TINYINT(1) NOT NULL DEFAULT 0		

);

CREATE TABLE product (
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,									
company_id int,
FOREIGN KEY (company_id) REFERENCES company(id),								
original_products_id int(1000000) not null,							
product_category_id int(100) not null,								
product_name varchar(100) not null,								
unit_price int(10000000) not null,								
adding_time datetime(20) not null,								
deleting_time datetime(20) not null,								
update_time datetime(20) not null,								
product_description varchar(1000) not null,						
category varchar(20)  not null,				
regiinvqua int(10000) not null,					
product_overview varchar not null,								
flag TINYINT(1) NOT NULL DEFAULT 0	
);

CREATE TABLE pro_image (
pro_image_id int(10000) AUTO_INCREMENT PRIMARY KEY NOT NULL,						
product_id int(1000000) not null,
FOREIGN KEY (product_id) REFERENCES product(id),									
image_filename varchar(1000)  not null,								
flag TINYINT(1) NOT NULL DEFAULT 0								

);

CREATE TABLE product_category (
product_category_id int(1000) AUTO_INCREMENT PRIMARY KEY NOT NULL,									
product_id int(1000000) not null,
FOREIGN KEY (product_id) REFERENCES product(id),						
name varchar(100) not null,								
icon_image varchar(100)								
);

CREATE TABLE product_cart (
id int(100000000) AUTO_INCREMENT PRIMARY KEY NOT NULL,							
user_id int(100000000) not null,
FOREIGN KEY (user_id) REFERENCES user(id),						
product_id int(100000) not null,
FOREIGN KEY (product_id ) REFERENCES user(id),								
company_id int(100000) not null,
FOREIGN KEY (company_id ) REFERENCES company(id),									
order_count int(1000) not null,															
adding_time datetime(20) not null,								
deleting_time datetime(20) not null,								
update_time datetime(20) not null,								
deletion_flag TINYINT(1) NOT NULL DEFAULT 0
);

CREATE TABLE purchase_history (
id int(100000000) AUTO_INCREMENT PRIMARY KEY NOT NULL,
company_id int(100000000) not null,
FOREIGN KEY (company_id ) REFERENCES company(id),
user_id int(100000000) not null,
FOREIGN KEY (user_id) REFERENCES user(id),
coupon_id int(100000000) not null,
phone_number int(10000) not null,	
purchase_price int(1000000) not null, 
purchase_time datetime(20) not null,
paymentmethod varchar(100) not null,							
deladdress varchar(100) not null,
cancel_time datetime(20) not null,					
cancel_flag TINYINT(1) NOT NULL DEFAULT 0
);

CREATE TABLE purchase_history_pro (
pur_his_pro_id int(100000000) AUTO_INCREMENT PRIMARY KEY NOT NULL,
purchase_id int(100000000) not null,
FOREIGN KEY (purchase_id) REFERENCES purchase_history(id),
item_id int(100000000) not null,
FOREIGN KEY (item_id) REFERENCES product(id),
count int(100000) not null,
)


CREATE TABLE coupon (
coupon_id int(1000) AUTO_INCREMENT PRIMARY KEY NOT NULL, 								
product_id int(1000000) not null,
FOREIGN KEY (product_id) REFERENCES product(id),								
effect int(100)	not null,							
coupon_name varchar(100) not null,								
image varchar(100) not null,								
coupon_code varchar(100) not null,							
flag TINYINT(1) NOT NULL DEFAULT 0				
)

CREATE TABLE have_coupon (
id int(10000) AUTO_INCREMENT PRIMARY KEY NOT NULL, 							
coupon_id int(1000) not null,
FOREIGN KEY (coupon_id) REFERENCES coupon(coupon_id),			
user_id int(10000000) not null,							
coupon_code varchar(100) not null,								
used_flag TINYINT(1) NOT NULL DEFAULT 0								
)

CREATE TABLE review (
review_id int(10000000) AUTO_INCREMENT PRIMARY KEY NOT NULL, 							
product_id int(1000000) not null,
FOREIGN KEY (product_id) REFERENCES product(id),		
user_id int(10000000) not null,	
FOREIGN KEY (user_id) REFERENCES user(id),							
rating int(5) not null,								
review_title varchar(100) not null,							
reviewbody varchar(10000) not null,				
submissiondate datetime(20) not null,
deleting_time datetime(20) not null,								
flag TINYINT(1) NOT NULL DEFAULT 0
)

CREATE TABLE review_video (
id int(1000000) AUTO_INCREMENT PRIMARY KEY NOT NULL, 							
review_id int(10000000) not null,
FOREIGN KEY (review_id) REFERENCES review(review_id),						
video_filename varchar(100) not null,							
flag TINYINT(1) NOT NULL DEFAULT 0								
)

CREATE TABLE review_image (
id int(1000000) AUTO_INCREMENT PRIMARY KEY NOT NULL,							
review_id int(1000000) not null,								
image_filename varchar(100) not null,							
flag TINYINT(1) NOT NULL DEFAULT 0								
)

CREATE TABLE email (
email_id int(10000) AUTO_INCREMENT PRIMARY KEY NOT NULL,							
review_id int(1000000) not null,											
sender int(10000000) not null,
FOREIGN KEY(sender) REFERENCES user(id),								
recipient int(10000000) not null,
FOREIGN KEY(recipient) REFERENCES user(id),								
subject varchar(10000) not null,							
body varchar(100000) not null,
status varchar(100) not null,
sending_time datetime(20) not null,								
deleting_time datetime(20) not null,					
flag TINYINT(1) NOT NULL DEFAULT 0
)

CREATE TABLE login_history (
id int(10000000) AUTO_INCREMENT PRIMARY KEY NOT NULL, 
user_id int(10000000) not null,
FOREIGN KEY(user_id) REFERENCES user(id),
login_date datetime(20) not null
)


CREATE TABLE company_review(
id int(1000000) AUTO_INCREMENT PRIMARY KEY NOT NULL, 								
company_id int(1000) not null,
FOREIGN KEY(company_id) REFERENCES company(id),		
review_title varchar(100) not null,							
review_body varchar(10000) not null,					
image varchar(100) not null,				
submissiondate datetime(20) not null,						
deleting_time datetime(20) not null,				
flag TINYINT(1) NOT NULL DEFAULT 0							

)

CREATE TABLE creview_video(
id int(100000) AUTO_INCREMENT PRIMARY KEY NOT NULL,	
company_id int(10000) not null,
FOREIGN KEY(company_id) REFERENCES company(id),
video_filename varchar(100) not null,				
flag TINYINT(1) NOT NULL DEFAULT 0			

)

CREATE TABLE favorite(
id int(10000000) AUTO_INCREMENT PRIMARY KEY NOT NULL,
user_id int(10000000) not null,
FOREIGN KEY(user_id) REFERENCES user(id),	
product_id int(10000000) not null,
FOREIGN KEY(product_id) REFERENCES product(id),							
flag TINYINT(1) NOT NULL DEFAULT 0								
)
CREATE TABLE creview_image(
id int(100000) AUTO_INCREMENT PRIMARY KEY NOT NULL,							
company_id int(10000) not null,	
FOREIGN KEY(company_id) REFERENCES company(id),							
image_filename varchar(100) not null,							
flag
)

