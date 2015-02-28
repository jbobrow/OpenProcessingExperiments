
int rad = 400;
int i = 1;
int ballSize = 100;
void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotate(i);
  i+=10;

  for ( int inc=0; inc < 360; inc +=10) {
    //we use the increment to add to the angle
    //every frame it will be incremented by 10
    float angle = radians(inc); //converting radians to degrees
    float x = cos(angle) * rad;
    float y = sin (angle) * rad;
 
    for ( int inc1=0; inc1 < 360; inc1 +=10) {
    float angle1 = radians(inc1); 
    float x1 = cos(angle1) * rad;
    float y1 = sin (angle1) * rad;
      
    noStroke();
    ellipse (x, y, ballSize, ballSize);
    stroke(255, 255, 5);
    line(x,y,x1,y1) ;
      }
}
}

