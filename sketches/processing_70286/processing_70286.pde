
int rad = 250;

void setup() {
  size(600, 600);
  smooth();
  
  //stroke(random(255), random(255), random(255));
  //strokeWeight(1);

}

void draw() {
  background(0);
  
  translate(width/2, height/2);

  for ( int inc=0; inc < 360; inc +=1) {
    //we use the increment to add to the angle
    //every frame it will be incremented by 10
    
    float angle = random(PI * 2); //converting radians to degrees
    float angle2 = random(PI * 2);
    float x = cos(angle) * rad;
    float y = sin (angle) * rad;
    float x2 = cos (angle2) * rad;
    float y2 = sin (angle2) * rad;
    
    stroke(random(255), random(255), random(255));
    strokeWeight(1);
    line (x, y, x2, y2);
  }
}


