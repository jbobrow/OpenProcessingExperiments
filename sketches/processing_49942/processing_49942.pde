
class Animal {
  
  // instance variables
  String animalType; // ex. "fish"
  String species; // ex. "trout"
 
  // "outbound" relations
  People[] people; 
  
  // constructor
  Animal(String animalType_, String species_, People[] people_) {
    animalType = animalType_;
    species = species_;
    people = people_;
  }
}

