
PImage a;

void setup (){
  size (400,400);
  a = loadImage ("8.jpg");

}

void draw (){
  image (a,0,0,400,400);
  copy (mouseX, mouseY, 30, 30, mouseX, mouseY, 120, 120);
  noFill();
}









