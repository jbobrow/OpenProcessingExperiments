
void setup() {
 
  size (500, 500);
  background(19, 36, 44);
  smooth();
  noStroke();
}

int num = 24;
float count = 6;
float a;

void draw() {

  //sets up the "random" aspect where each x will have a 
  //number from 0 to 30 added to it, and it will move 
  //a number from 70 to 100 from left to right
  
  for (a=random(0,30); a<width; a+=random(70, 100)) {

    if ((num>=18) && (num<=24)) {
      fill(41, 66, 106); // blue rhombus- origial shape, 6 will be drawn
      quad(5+a, 50, 70+a, 100, 70+a, 365, 10+a, 395);
    }
    if ((num>12) && (num<18)) {
      fill(0, 0, 0 ); //gray rhombus- origial shape, 6 will be drawn
      quad(5+a, 140, 60+a, 180, 60+a, 380, 10+a, 300);
    }
    if ((num>6) && (num<=12)) {
      fill(247, 247, 53, 98);  //yellow rhombus- origial shape, 6 will be drawn
      quad(5+a, 125, 45+a, 80, 60+a, 355, 10+a, 320);
    }

    if ((num>=0) && (num<=6)) {
      fill(5, 108, 91, 200); //green rhombus- origial shape, 6 will be drawn
      quad(5+a, 200, 35+a, 180, 40+a, 440, 10+a, 415);
    }
    num--;
  }
}
void mousePressed(){
  //this re-sets the background, the number, and the variable for a new set
  background (19, 36, 44);
    num=24;
  a=random(0,30);
}


