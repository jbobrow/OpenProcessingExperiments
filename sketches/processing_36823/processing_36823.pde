
// kaleidoscope effect

void setup() {
  size(600, 600);
}

int circleRadius = 300;
int circleSpeed = 100;

void draw() {
  background(0);
  fill(200);
  ellipse(width/2, height/2, random(1,100), random(100,1));
  noFill();
  stroke(150);
  strokeWeight(1);
  rect(10, 10, 580, 580);


  // circleSpeed changes direction
  if (circleRadius > 3*width) {
    circleSpeed =-1;
  }
  if (circleRadius < -300) {
    circleSpeed = 1;
  }

  //circles with centre on centre of composition and centre of each side
  noFill();
  strokeWeight(150);
  stroke(255);
  ellipse(width/2, height/2, circleRadius, circleRadius);
  circleRadius = circleRadius + circleSpeed;
  ellipse(width/2, height, circleRadius, circleRadius);
  circleRadius = circleRadius + circleSpeed;
  ellipse(width, height/2, circleRadius, circleRadius);
  circleRadius = circleRadius + circleSpeed;
  ellipse(0, height/2, circleRadius, circleRadius);
  circleRadius = circleRadius + circleSpeed;
  ellipse(width/2, 0, circleRadius, circleRadius);
  circleRadius = circleRadius + circleSpeed;

}


