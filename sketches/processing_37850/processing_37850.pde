
void setup() {
  size(500, 500);
  smooth();
  background(0);
  noFill();
}

int x = 10;

void draw() {
  frameRate(10);
  for (int i=0; i< 360; i +=20) {
      pushMatrix();
    translate(width/2, height/2); //moves to center
    rotate(radians(i));
    translate(75, 0); //moves rectangles equal distance from center
    stroke(random(50), random(100), random(100)); //rectangle changing colors
    rect(0, 0, random(150), random(50));
    stroke(random(100), random(50), random(200));
    popMatrix();
    
    pushMatrix();
    stroke(150);
    rotate(radians(i));
    line(0,0,x,x);
    x++;
    popMatrix();
  }
}


