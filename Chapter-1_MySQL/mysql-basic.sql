-- NODE 46
-- MySQL sẽ không phân biệt chữ HOA hay chữ thường: "select" = "SELECT"
-- Nhưng mình nên sử dụng chữ hoa
-- Dấu chấm phẩy ";" kết thúc dòng
-- Đặt tên cho table nên tránh những từ trùng với lệnh MySQL
	-- Nếu vẫn muốn sử dụng để đặt tên mình sẽ kẹp với (``)
	-- Hoặc thêm chữ "s" ngay sau
	
---------------------------------------------------------

-- Lệnh tạo CSDL(DATABASE)
-- CREATE DATABASE demo_database;

-- IF NOT EXISTS => Sẽ thực hiện lệnh tạo nếu không tồn database này (Thường sử dụng này hơn)
CREATE DATABASE IF NOT EXISTS demo_database;

-- Lệnh gọi DATABASE
USE demo_database;

---------------------------------------------------------

-- Lệnh tạo TABLE
CREATE TABLE users (
	-- Khai báo cột và kiểu dữ liệu
	
	-- INT => Kiểu dữ liệu số
	user_id INT,
	-- VARCHAR => Kiểu dữ liệu string có thể giới hạn ký tự (thường giới hạn 255 ký tự)
	full_name VARCHAR(255),
	email VARCHAR(255),
	age INT,
	-- DATE => Kiểu dữ liệu ngày
	birth_day DATE,
	-- DOUBLE => Kiểu dữ liệu số thực
	money DOUBLE,
	-- BOOLEAN => Kiểu dữ liệu luận lý nó sẽ lưu dạng 0 và 1 (0 = false, 1 = true) 
	is_active BOOLEAN
)

---------------------------------------------------------

-- Lệnh đổi tên TABLE
-- TO => từ tên cũ sang(TO) tên mới 
RENAME TABLE users TO users_rename;

---------------------------------------------------------

-- Lệnh xóa TABLE
-- DROP TABLE users_rename;
DROP TABLE IF EXISTS users_rename;

---------------------------------------------------------

-- Các Lệnh RÀNG BUỘC DỮ LIỆU
CREATE TABLE not_null (
	-- NOT NULL => ràng buộc dữ liệu không được để trống
	id INT NOT NULL,
	age INT
);

CREATE TABLE `unique`(
	-- UNIQUE => ràng buộc dữ liệu độc nhất không được trùng
	id INT UNIQUE
);


CREATE TABLE `default`(
	id INT NOT NULL UNIQUE,
	-- DEFAULT => ràng buộc dữ liệu mặc định mà bạn mong muốn tự động điền
	role VARCHAR(255) DEFAULT 'ROLE_USER',
	email VARCHAR(255),
	-- TIMESTAMP => là một kiểu dữ liệu dùng để lưu ngày và giờ 
	-- Có thể kết hợp DEFAULT CURRENT_TIMESTAMP để tự động điền ngày và giờ theo múi giờ của máy tính
	create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE primary_key (
	-- BIGINT => là kiểu dữ liệu số và lớn hơn INT
	-- PRIMARY KEY => (khóa chính) là một ràng buộc dùng để xác định duy nhất mỗi dòng dữ liệu trong một bảng.
		-- Nói đơn giản: Nó giống như CCCD của mỗi người. Mỗi người có một số CCCD riêng, không được trùng nhau và không được để trống.
		-- Nó có sự kết hợp của UNIQUE và NOT NULL
	-- AUTO_INCREMENT => là thuộc tính giúp tự động tăng giá trị của một cột mỗi khi bạn thêm một dòng dữ liệu mới
	id BIGINT PRIMARY KEY AUTO_INCREMENT
)

CREATE TABLE foreign_key(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	foreign_key BIGINT,
	-- FOREIGN KEY => (khóa ngoại) là một ràng buộc dùng để tạo mối liên kết giữa hai bảng, đồng thời đảm bảo dữ liệu tham chiếu phải hợp lệ.
		-- Nói đơn giản: Nếu PRIMARY KEY giống như mã định danh của mỗi người, thì FOREIGN KEY giống như cách bạn ghi lại mã định danh đó ở một bảng khác để biết dữ liệu thuộc về ai.
		-- Khi bạn muốn tham chiếu tới bản khác thì 2 kiểu dữ liệu của khóa chính và khóa ngoại phải giống nhau
	-- REFERENCES => là từ khóa dùng để chỉ định một cột sẽ tham chiếu đến cột nào của một bảng khác khi khai báo FOREIGN KEY. 
		-- Cần khai báo tên_bảng(cột_cần_tham_chiếu)
	FOREIGN KEY(foreign_key) REFERENCES primary_key(id)
)

---------------------------------------------------------

-- Lệnh thêm dữ liệu vào TABLE
-- VALUES => là từ khóa dùng để chỉ định giá trị cụ thể mà bạn muốn thêm vào các cột của một bảng, thường được sử dụng cùng với INSERT INTO.
INSERT INTO users ( user_id, full_name, email, age, birth_day, money, is_active) VALUES
	(1,'Long 1','long@gmail.com',18,'1999-01-01',150000,TRUE),
	(2,'Long 2','long@gmail.com',18,'1999-01-01',50000,TRUE),
	(3,'Long 3','long@gmail.com',18,'1999-01-01',20000,TRUE)

---------------------------------------------------------

-- Lệnh cập nhật dữ liệu
UPDATE users 
-- SET => dùng để gán giá trị cho một biến hoặc cập nhật một giá trị trong SQL.
SET money = 999999
-- WHERE => dùng để lọc dữ liệu theo điều kiện. SQL chỉ lấy hoặc thao tác với những dòng thỏa mãn điều kiện mà bạn đưa ra.
WHERE user_id = 1

---------------------------------------------------------

-- Lệnh xóa dữ liệu
-- FROM => dùng để chỉ định bảng mà SQL sẽ lấy dữ liệu hoặc thực hiện truy vấn.
DELETE FROM users
WHERE user_id = 2

-- TRUNCATE => Xóa hết dữ liệu nhưng không xóa bảng giống DELETE FROM users 
TRUNCATE users

---------------------------------------------------------

-- Lệnh truy vấn dữ liệu
SELECT * FROM users


CREATE DATABASE IF NOT EXISTS db_app_food
CREATE TABLE users (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	full_name VARCHAR(255),
	email VARCHAR(255),
	pass_word VARCHAR(255)
)

INSERT INTO users(full_name, email, pass_word) VALUES 
	('Nguyễn Văn A', 'a@gmail.com', '1234'),
	('Nguyễn Văn B', 'b@gmail.com', '1234'),
	('Nguyễn Văn C', 'c@gmail.com', '1234'),
	('Nguyễn Văn D', 'd@gmail.com', '1234'),
	('Nguyễn Văn E', 'e@gmail.com', '1234')

SELECT * FROM users
-- AS => dùng để đặt tên tạm thời (bí danh – Alias) cho cột hoặc bảng trong câu truy vấn SQL.
SELECT full_name AS 'Họ và tên', email FROM users

-- Không cần AS cũng có thể đổi tên 
SELECT full_name 'Họ và tên', email 'Email người dùng' FROM users

-- LIMIT => dùng để giới hạn số lượng dòng dữ liệu được trả về trong kết quả truy vấn. (Mặc định bắt đầu từ vị trí index = 0)
-- OFFSET => dùng để thay đổi vị trí bắt đầu index
SELECT * FROM users
LIMIT 2 OFFSET 2

CREATE TABLE foods (
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	description VARCHAR(255)
)

INSERT INTO foods(food_name, description) VALUES
	('Su kem', 'Bánh được làm từ kem'),
	('Gỏi gà', 'Được làm từ gà'),
	('Gỏi vịt', 'Được làm từ vịt'),
	('Gỏi cá', 'Được làm từ cá'),
	("Gỏi heo's", 'Được làm từ heo')
	
SELECT * FROM foods

CREATE TABLE orders (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	food_id INT,
	
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (food_id) REFERENCES foods(food_id)
)

INSERT INTO orders(user_id, food_id) VALUES
	(1,2),
	(3,1),
	(2,5),
	(1,3),
	(3,2)
	
SELECT * FROM orders

---------------------------------------------------------

-- Mối quan hệ
-- One-to-One (1:1) là mối quan hệ một - một giữa hai bảng trong database.
-- Nghĩa là:
	-- Một bản ghi ở bảng A chỉ liên kết với tối đa một bản ghi ở bảng B.
	-- Một bản ghi ở bảng B cũng chỉ liên kết với tối đa một bản ghi ở bảng A.
-- Bạn có thể hình dung: Một người dùng có một hồ sơ cá nhân riêng và hồ sơ đó chỉ thuộc về một người dùng.

-- One-to-Many (1:N) là mối quan hệ một - nhiều giữa hai bảng trong database.
-- Nghĩa là:
	-- Một bản ghi ở bảng A có thể liên kết với nhiều bản ghi ở bảng B.
	-- Nhưng mỗi bản ghi ở bảng B chỉ liên kết với tối đa một bản ghi ở bảng A.
-- Bạn có thể hình dung: Một khách hàng có thể đặt nhiều đơn hàng, nhưng mỗi đơn hàng chỉ thuộc về một khách hàng.

-- Many-to-Many (N:N) là mối quan hệ nhiều - nhiều giữa hai bảng trong database.
-- Nghĩa là:
	-- Một bản ghi ở bảng A có thể liên kết với nhiều bản ghi ở bảng B.
	-- Một bản ghi ở bảng B cũng có thể liên kết với nhiều bản ghi ở bảng A.
-- Bạn có thể hình dung: Một học sinh có thể đăng ký nhiều môn học, và một môn học cũng có thể có nhiều học sinh đăng ký.

---------------------------------------------------------
-- Các kiểu JOIN 
-- INNER JOIN dùng để kết hợp dữ liệu từ hai hoặc nhiều bảng, chỉ lấy những dòng có dữ liệu khớp nhau theo điều kiện JOIN.
-- Bạn có thể hiểu đơn giản: Hai bảng có liên kết với nhau, INNER JOIN chỉ lấy những bản ghi tìm được dữ liệu tương ứng ở cả hai bảng.
SELECT * -- orders.order_id,full_name 
FROM orders
-- ON => dùng để xác định điều kiện liên kết giữa hai bảng khi sử dụng JOIN.
INNER JOIN users ON orders.user_id = users.user_id


-- LEFT JOIN dùng để kết hợp dữ liệu từ hai bảng, giữ lại toàn bộ dữ liệu của bảng bên trái (bảng đứng trước LEFT JOIN), kể cả khi không tìm thấy dữ liệu tương ứng ở bảng bên phải.
-- Nếu không tìm thấy dữ liệu khớp, các cột thuộc bảng bên phải sẽ có giá trị NULL.
-- Bạn có thể hiểu đơn giản: Lấy tất cả dữ liệu ở bảng A, sau đó tìm dữ liệu tương ứng ở bảng B. Có thì ghép vào, không có thì để NULL.
SELECT * 
FROM users
LEFT JOIN orders ON orders.user_id = users.user_id


-- RIGHT JOIN dùng để kết hợp dữ liệu từ hai bảng, giữ lại toàn bộ dữ liệu của bảng bên phải (bảng đứng sau RIGHT JOIN), kể cả khi không tìm thấy dữ liệu tương ứng ở bảng bên trái.
-- Nếu không tìm thấy dữ liệu khớp, các cột thuộc bảng bên trái sẽ có giá trị NULL.
-- Bạn có thể hiểu đơn giản:
	-- LEFT JOIN: Luôn giữ toàn bộ bảng bên trái.
	-- RIGHT JOIN: Luôn giữ toàn bộ bảng bên phải.
SELECT * 
FROM orders
RIGHT JOIN users ON orders.user_id = users.user_id

-- CROSS JOIN dùng để kết hợp mỗi dòng của bảng thứ nhất với tất cả các dòng của bảng thứ hai.
-- Khác với INNER JOIN, LEFT JOIN, RIGHT JOIN, CROSS JOIN không cần điều kiện ON để ghép hai bảng.
SELECT * 
FROM orders
CROSS JOIN users 

---------------------------------------------------------

-- GROUP BY dùng để gom các dòng có cùng giá trị thành từng nhóm, thường kết hợp với các hàm tính toán như:
	-- COUNT() – Đếm số lượng.
	-- SUM() – Tính tổng.
	-- AVG() – Tính trung bình.
	-- MAX() – Tìm giá trị lớn nhất.
	-- MIN() – Tìm giá trị nhỏ nhất.
-- Hãy tưởng tượng bạn có một danh sách đơn hàng và muốn biết mỗi khách hàng đã đặt bao nhiêu đơn. Thay vì xem từng đơn hàng riêng lẻ, bạn gom các đơn hàng theo từng khách hàng.
-- GROUP BY gom nhóm theo điều kiện của table nên khi SELECT chỉ chọn những table đang được gom nhóm 
SELECT users.user_id, users.full_name, users.email, COUNT(users.user_id) AS 'Số lần user đã order'
FROM orders
INNER JOIN users ON orders.user_id = users.user_id
GROUP BY users.user_id

-- ORDER BY dùng để sắp xếp dữ liệu theo một hoặc nhiều cột, theo thứ tự tăng dần hoặc giảm dần.
-- Ví dụ thực tế: Bạn có danh sách đơn hàng và muốn hiển thị đơn hàng có giá trị cao nhất lên đầu.
-- Lệnh để kết hợp
	-- ASC (Ascending): Sắp xếp tăng dần.
	-- DESC (Descending): Sắp xếp giảm dần.
SELECT users.user_id, users.full_name, users.email, COUNT(users.user_id) AS 'Số lần user đã order'
FROM orders
INNER JOIN users ON orders.user_id = users.user_id
GROUP BY users.user_id
ORDER BY users.user_id DESC

-- Tìm 5 người đã like nhà hàng nhiều nhất.
SELECT orders.user_id, users.user_id, users.full_name, users.email, COUNT(users.user_id) AS 'Số lần user đã order'
FROM orders
INNER JOIN users ON orders.user_id = users.user_id
GROUP BY users.user_id
ORDER BY `Số lần user đã order` DESC
LIMIT 5

-- Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT orders.food_id, foods.food_id, foods.food_name, COUNT(orders.food_id) AS 'Số món được order'
FROM orders
INNER JOIN foods ON foods.food_id = orders.food_id
GROUP BY foods.food_id
ORDER BY `Số món được order` DESC
LIMIT 2

-- Tìm người dùng không hoạt động
-- (Không đặt hàng, không like, không đánh giá)
SELECT users.full_name AS 'Những người không hoạt động' 
FROM orders
RIGHT JOIN users ON users.user_id = orders.user_id
WHERE orders.user_id IS NULL 