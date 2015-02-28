
int xPos1 = 200;
int yPos1 = 200;
int xPos2 = 310;
int yPos2 = 200;

PFont font;
String txt1 = "something borrow something blue, every me and every you";
String txt2 = "paul newman jeff bridges bob deniro";

void setup(){
  size(600, 400);

}

void draw() {
  background(0);
  
  fill(155);
  textLeading(18);
  textAlign(RIGHT);
  text(txt1, xPos1, yPos1, 80, 100);
  
  textAlign(LEFT);
  text(txt2, xPos2, yPos2, 80, 100);
  
  if(yPos1 < -80 || yPos2 < -80){
    yPos1 = 400;
    yPos2 = 400;
  }
 
  yPos1 = yPos1 - 1;
  yPos2 = yPos2 -1;
  
  }
