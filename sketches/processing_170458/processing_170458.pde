
//remove markouts where indicated with !! to see

Line[] aLine = new Line[3];


void setup(){
  size(800,600);
  aLine[0] = new Line (width/2, 100.0);
  aLine[1] = new Line (width/2, 300.0);
  aLine[2] = new Line (width/2, 500.0);
  frameRate(20);
}
void draw(){
  background (255);
 
   for (int i=0; i<3; i++) {
     if (aLine[i].grow == true){
     aLine[i].move();
 }
 }
 
  for (int i=0; i<3; i++) {
  aLine[i].display();
 }
 for (int i=0; i<aLine.length; i++) {
    for (int j=0; j<aLine.length; j++) {
      if (i != j) { //!= is "does not equal" syntax 
        twoApart(i, j);
      }
    }
  }
 }
 void twoApart(int num1, int num2) {
  int difference = int(abs(aLine[num1].sizeX - aLine[num2].sizeX));
  if (difference <2) {
     aLine[num1].grow = false;
     aLine[num2].grow = false;
  }

}

//class//
  class Line {
  float sizeX;
  float sizeY;
  float posX;
  float posY;
  boolean grow;
  
  Line(float tPosX, float tPosY) {
    posX=tPosX;
    posY=tPosY;
    grow = true;
  }
  void move(){
    sizeX=random(100, 400);
    sizeY=10;
  }
  void display() { // Function.
    rectMode(CENTER);
    fill(0);
    rect(posX,posY,sizeX,sizeY);

  }
  }
 


