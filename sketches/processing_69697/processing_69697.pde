
float angle = 0;
float speed=.05;
int x;

void setup()
{
  background(255);
  size(500, 500);
  frameRate(7);
}

void draw()
{
  background(150);
  translate(width/2, height/2);  //placing drawing in center of screen 

  // circle2
  float radius =100;
  for (int deg= 0; deg<360*3; deg +=3) {
    float angle = radians(deg);
    float x = cos(angle)*radius;  //makes the circle
    float y = sin(angle)*radius;  //makes the circle
    noStroke();
    fill(random(170, 210));
    ellipse (x, y, random(0, 25), random(0, 25));
    radius = radius + .24;
  }


  //circle3 (or innermost)
  float radius2 =100;
  for (int deg= 0; deg<360*4; deg +=3) {
    float angle = radians(deg);
    float x = cos(angle)*radius2;  //makes the circle
    float y = sin(angle)*radius2;  //makes the circle
    noStroke();
    fill(random(170, 210));
    ellipse (-x, -y, random(0, 50), random(0, 5));
    radius2 = radius2 - .14;
  }

  //outer circle
  float radius4 =200;
  float radius3=200;
  for (int deg= 0; deg<360*4; deg +=3) {
    float angle = radians(deg);
    float x = cos(angle)*radius3;  //makes the circle
    float y = sin(angle)*radius3;  //makes the circle
    noStroke();
    fill(random(170, 210));
    ellipse (-x, -y, random(0, 5), random(0, 50));
    radius4 = radius4 - .14;
  }


  // circle2
  float radius5 =210;
  for (int deg= 0; deg<360*3; deg +=3) {
    float angle = radians(deg);
    float x = cos(angle)*radius5;  //makes the circle
    float y = sin(angle)*radius5;  //makes the circle
    noStroke();
    fill(random(170, 210));
    ellipse (x, y, random(0, 25), random(0, 25));
    radius5 = radius5 + .24;
  }

  //center circle
  circlePhase(0);
//  circlePhase(PI/4);
  circlePhase(QUARTER_PI);
  circlePhase(HALF_PI);
  circlePhase(TWO_PI);
  angle+= speed;
}

void circlePhase(float phase)
{
  float diameter = 27 + (sin(angle+phase)*45);
  fill(random(150, 200), random(150, 200), random(150, 200));
  strokeWeight(random(0,2));
  // stroke(180);
  ellipse(0, 0, diameter, diameter);
}



