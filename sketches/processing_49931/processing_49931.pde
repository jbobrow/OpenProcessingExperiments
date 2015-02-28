
class Bracelet {
   
  // Instance variables
  String designer;
  String yearMade;
  String material;
  String style;
   
  // "Outbound" relations
  Jewelry[] jewelry;
   
  // Constructor
  Bracelet (String designer_, String yearMade_, String material_, String style_, Jewelry[] jewelry_) {
    designer = designer_;
    yearMade = yearMade_;
    material = material_;
    style = style_;
    jewelry = jewelry_;
    
  }
}

