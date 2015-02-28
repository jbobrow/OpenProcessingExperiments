
class Bulletin {
  
  //instance variables
  String material;
  String size;
  
  //"outbound" relations
  Bulletin[] bulletin;
  Photos[] photos;
  Memorabilia[] memorabilia;
  
  // constructor
  Bulletin(String material_, String size_, Bulletin[] bulletin_, Photos[] photos_, Memorabilia[] memorabilia_) {
    material = material_;
    size = size_;
    bulletin = bulletin_;
    photos = photos_;
    memorabilia = memorabilia_;
  }
}
  

