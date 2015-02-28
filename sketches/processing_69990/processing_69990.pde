
int rad = 200;
int ballSize = 20;

void setup() {
  size(600, 600);
  smooth();
  background(0);
}

void draw() {

  translate(width/2, height/2);

//  for ( int inc=0; inc < 360; inc +=10) {
    //we use the increment to add to the angle
    //every frame it will be incremented by 10
    float angle = radians(random(360)); //converting radians to degrees
    float x = cos(angle) * rad;
    float y = sin (angle) * rad;
 
//    for ( int inc1=0; inc1 < 360; inc1 +=10) {
    float angle1 = radians(random(360)); 
    float x1 = cos(angle1) * rad;
    float y1 = sin (angle1) * rad;
      
    noStroke();

    stroke(random(255), random(255), random(255));
    line(x,y, x1,y1) ;
      }



