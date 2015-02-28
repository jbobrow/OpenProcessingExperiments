
//the mouse position determines the bottom right corner of the
//rotating squares.  Because the squares are both rotating 
//around a center and themselves while increasing, it is easy to 
//exponentially grow the rotation.

int num = 30; // number of rectangles per rotation
int[] x = new int[num];//x value of rotation center
int[] y = new int[num];//y value of rotation center

void setup() {
  background(0);
  size(500, 500);
  noStroke();
  smooth();
  fill(255,100);
}
void mousePressed() {//resets drawing
  background(0);
  x[0] = mouseX;
  y[0] = mouseY;
  }
void draw(){

  for (int i = 0; i < num; i++) {
    translate(mouseX,mouseY); //make mouse possition center of roatation
    rotate(frameCount * radians(5) * 0.05);//rotation speed around center
    translate(x[0],y[0]);//variably changing center
    rotate(radians(i));//rotation of rect around itself
    
    rectMode(CENTER);
    rect(x[0], y[0], i/3, i/3);//rectangle with variable center 
                               // and 1/3 the integer size
  }
}




