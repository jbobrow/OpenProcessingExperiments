
PShape figura, figura2, figura3;

void setup(){
  size (500 , 500);
  background (255);
  figura = loadShape ("rabisco.svg");
  figura2 = loadShape ("rabisco2.svg");
  figura3 = loadShape ("rabisco3.svg");
  //figura2.rotate(radians(15));
  smooth();
}

void draw(){
  background (120);
  //shape (figura, 255, 255);
  
  //figura2.rotate(radians(15));
  float zoom = map(mouseX, 0, width, 0.1, 4.5);
  scale (zoom);
  shape (figura2, 0, 0);
  
  //shape (figura3, 50, 50, 70, 70);
}

