
PImage ace;
int x;
int y;
int directionx;
int directiony;

void setup() {
  size(800,800);
  background(40, 123, 60);
  ace = loadImage("ace.png");
  x=100;
  y=250;
  directionx=1;
 
}

  void draw(){
  fill(70);
  rect (x, y, 20, 40);
  x+= directionx;
  y+= directiony;
  
  for(int i = 0; i < 800; i +=50){
    rotate(radians(1));
     image (ace, i, 400);
     triangle(30, 175, 158, 120, 100, 75);
  }
  
}
void mousePressed(){
  fill (mouseX, mouseY, mouseX);
  ellipse (mouseX, mouseY, 50, 100);
}


