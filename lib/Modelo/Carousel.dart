class Carousel{
  int index;
  String title;
  String image;
  bool isSelected;

  Carousel({this.index,this.title,this.image,this.isSelected,});

}

List<Carousel>carousel=[
  Carousel(index:0,title: 'CAFES',image: 'assets/images/image1.jpg',isSelected: true),
  Carousel(index:1,title: 'POSTRES',image: 'assets/images/image2.jpg',isSelected: false),
  Carousel(index:2,title: 'FRAPPES',image: 'assets/images/image3.jpg',isSelected: false),
  Carousel(index:3,title: 'SMOOTHIES',image: 'assets/images/image4.jpg',isSelected: false),
  Carousel(index:4,title: 'TES',image: 'assets/images/image5.jpg',isSelected: false),
  Carousel(index:5,title: 'TISANA',image:  'assets/images/image6.jpg',isSelected: false),
];