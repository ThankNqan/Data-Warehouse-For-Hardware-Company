# Xây Dựng Kho Dữ Liệu Bán Hàng Cho Công Ty Thiết Bị Phần Cứng
--------------------------------------
![image](https://gurussolutions.com/sites/default/files/finder/data-warehouse-img.jpg)
## 1. Lý do chọn đề tài
- Trong kỷ nguyên công nghệ ngày nay, hầu như ở bất cứ đâu, bất cứ khi nào cũng có sự xuất hiện và hoạt động của các thiết bị công nghệ. Vì nhu cầu cao về sử dụng thiết bị công nghệ, việc cung cấp, sửa chữa và bảo trì kịp thời đóng một vai trò rất quan trọng. Để những quá trình từ các khâu sản xuất, vận chuyển lưu trữ, phân phối sản phẩm được diễn ra một cách mượt mà, tự động, cần có một hệ thống quản lý tốt tất cả các khâu. Thông thường ở mỗi giai đoạn như vậy, dữ liệu lưu trữ cũng khác nhau, các doanh nghiệp nếu chuẩn bị kỹ càng từ bước kết hợp dữ liệu này thì sẽ có khả năng cao hơn trong việc đưa ra những quyết định. Chính vì lý do đó, nhóm sinh viên chúng em chọn đề tài "Xây dựng Kho dữ liệu bán hàng cho công ty thiết bị phần cứng" với mong muốn tạo ra một Kho dữ liệu giúp công ty dễ dàng quản lý, thao tác và từ đó đưa ra những quyết định đúng đắn.

## 2.Tổng quan về tập dữ liệu
- Nhóm sử dụng Tập dữ liệu OT Database được lấy từ trang web Oracle Tutorial (oracletutorial.com), trang web này cung cấp cơ sở dữ liệu mẫu theo chuẩn của Oracle để phục vụ cho việc luyện tập thao tác của người học Oracle.
- Đường dẫn tải tập dữ liệu: https://www.oracletutorial.com/getting-started/oracle-sample-database/?fbclid=IwAR0KNWE2O_FV5r9WHBBiiGMCM8c3n7-klmfuj9MQ02rTzxPBObwG_DfWOM0
- Tập dữ liệu ‘OT’ bao gồm thông tin về một công ty toàn cầu ảo chuyên kinh doanh các mặt hàng linh kiện điện tử.Dataset gồm có tổng cộng 12 bảng được mô tả bởi lược đồ quan hệ sau 
![image](https://www.oracletutorial.com/wp-content/uploads/2017/07/Oracle-Sample-Database.png)

## 3. Nội dung chính của dự án
### 3.1 Xác định các Business Process và bảng Fact
- ̵Xây dựng Detailed Bus Matrix xác định các Business Process, bảng Fact, bảng Dim cần thiết.
+ Business Process: Sales Analysis để theo dõi doanh số bán hàng theo khách hàng (customer), nhân viên (employee), sản phẩm (product) để có thể biết được sản phẩm nào bán chạy nhất, nhân viên nào đặt nhiều hóa (order) đơn nhất, nhà cung cấp nào tốt nhất.
+ Business Process: FactProductInventory để quản lý số lượng sản phẩm phân bổ trong các kho.
- Lược đồ sao (Star schema)
![alt text](Diagram-Image/images/Screenshot%202023-06-10%20172505.png)
### 3.2 Xây dựng kho dữ liệu bằng công cụ SSIS
- Tạo các bảng stage để lưu trữ dữ liệu trước khi import vào Dim - Fact
- Đổ dữ liệu vào các bảng stage
- Đổ dữ liệu từ stage vào các bảng Dim và Fact
### 3.3 Xây dựng cube và truy vấn bằng công cụ SSAS
- Tạo Data Source từ kho dữ liệu database 
- Tạo Data Source View
- Tạo cube, thêm measure và các dim cần thiết,tạo các phân cấp Hierarchy 
- Truy vấn các câu hỏi mà nhóm đưa ra bằng công cụ SSAS, Pivot Table, PowerBI
#### 3.4. Xây dựng Dashboard với PowerBI
- Thống kê doanh thu theo sản phẩm
 
- Thống kê doanh thu theo khách hàng 
- Thống kê lượng sản phẩm tồn đọng ở các kho