
Furniture object1, object2, object3;

void setup(){
  size(500,500);
  smooth();
  object1 = new Furniture();
  object2 = new Furniture();
  object3 = new Furniture();
}

void draw(){
  
  background(255);
  
  object1.display();
  object2.display();
  object3.display();
  
   object1.update();
   object2.update();
   object3.update();
}

