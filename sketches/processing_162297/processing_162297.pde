
float circleX;
float xspeed= 5;

void setup() {
  size(640, 360);
}

void draw() {  
  background(50);

  fill(255);
  ellipse(circleX, 180, 24, 24); 

  //Logic
  circleX = circleX + xspeed;

  if (circleX > width || circleX < 0) {
    //Turn around
    println("turn around");
    xspeed = xspeed * -1;
  }
}

