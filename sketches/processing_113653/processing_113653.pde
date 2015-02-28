
class Shape {
 
  int posX = width/2; 
  int posY = height/2;
   
  color fillColor = color(255);
   
  Shape() {
     posX = int(random(width, width/2));
     posY = int(random(height, height/2));
  }
 
  void checkPos() {
    if( dist(mouseX, mouseY, posX, posY) < width/2) {
      fillColor = color(255);
    }
  }
 
  void display() {
  translate(mouseX, mouseY);
  stroke(255);
  strokeWeight(2);
  beginShape();
  vertex(10, -85);
  vertex(80, -140);
  vertex(120, -10);
  endShape(CLOSE);
}
}
Shape[] shapeArray;
 
int numShape = 6;
 
void setup(){
  size(800, 800);
  background(0);
   
  shapeArray = new Shape[numShape];
   
  for(int i=0; i<shapeArray.length; i++){
     shapeArray[i] = new Shape();
  }
}
 
void draw(){
  background(0);
  for(int i=0; i < shapeArray.length; i++){
     shapeArray[i].checkPos();
     shapeArray[i].display();
  }
}
 
 
void mouseClicked(){
  for(int i=0; i<shapeArray.length; i++){
     shapeArray[i] = new Shape();
  }
}
