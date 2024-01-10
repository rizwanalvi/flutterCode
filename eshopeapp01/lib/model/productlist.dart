class ProductList{
  final String title;
  final double? price;
  final String description;
  final String img;
  final String category ;

  const ProductList({required this.title,
    required this.description,
    this.price,required this.category,required  this.img
  });

  Map<String,dynamic> toJson() =>{
    "title":this.title,
    "price":this.price,
    "description":this.description,
    "category":this.category,
    "img":this.img
  };

 factory ProductList.fromJson(Map<String,dynamic> json)=> ProductList(
   title : json['title'],
   description : json['description'],
   price : json['price'],
   category : json['category'],
  img:json['img']
 );

}