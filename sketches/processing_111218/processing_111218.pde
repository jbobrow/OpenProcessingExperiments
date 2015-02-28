
float radius=50;
float distanceH=radius/2;
float distanceW=radius/2;
float speed=10;
float direction=1;
float directionX=-1;
void setup() {
  size(600, 1000);
  background(0);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  frameRate(35);
}
void draw() {
  if (distanceW<=mouseX+50&&distanceW;>=mouseX-50&&distanceH;<=800&&distanceH;>=780||distanceH<=-.005)
  {
    direction=-direction;
    directionX=-directionX;
  }

  if (distanceW>=width-radius/2||distanceW<=0+radius/2)
  {
    directionX=-directionX;
  }
  else if (distanceH>=height){
    distanceH=radius/2;
  }

  background(188, 99, 81);
  fill(310, 50, 100);
  ellipse(distanceW, distanceH, radius, radius);

  distanceH +=speed*direction;
  distanceW+=speed*directionX;

  rectMode(CENTER);
  rect(mouseX, 800, 100, 20);
  //
}

//implement 1 player pong
