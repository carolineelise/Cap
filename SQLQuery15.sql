create table RequestLines(
Id int primary key identity (1,1),
RequestId int not null foreign key references Requests(Id),
ProductId int not null foreign key references Products(Id),
Quantity int not null Default 1)