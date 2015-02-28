
Panda panda1,panda2;
Tear tear;
boolean isADancer = true;

void setup() {
size(400,400);
smooth();
panda1 = new Panda(200,120,100,115,68,2,true);
panda2 = new Panda(200,320,105,120,275,1,false);
tear   = new Tear(215,247,5);
}

void draw() {
  if (mouseX > width/2 && mouseY> height/2) {
  background(138,240,234);
} else if (mouseX > width/2 && mouseY < height/2) {
  background(3,173,255);
} else if (mouseX < width/2 && mouseY < height/2) {
  background(40,222,205);
} else if (mouseX < width/2 && mouseY > height/2) {
  background(3,88,255);
}
  panda1.display(); 
  panda1.growAndShrinkBody();
  panda2.display(); 
  panda2.growAndShrinkBody();
  tear.display();
}



  




