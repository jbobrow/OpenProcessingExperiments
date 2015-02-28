
int diam = 30;  // the diameter of our ellipse
int diam2 = 15;
int x = 0;    //center the ellipse
int y = 0;    //center the ellipse
int speed = 5;

void setup() {
  size(300, 300);
  smooth();
}

void draw() {
  background(255);
  drawBall();
}

void drawBall() {
 ellipse(x, 150, diam, diam);
   x = x + speed;

 if((x + 10 >= width) || (x <= 0)){
    speed = speed * -1;
    
    
}
}
//http://forum.processing.org/topic/bouncing-ball-10-10-2011

