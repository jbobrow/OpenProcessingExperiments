
void setup() {
  size(400, 400);
  background (132, 32, 77);
  frameRate (50);
  x=random(width);
  y=random(height);
  w = random(10);
  h = random(10);
  smooth();
 
}


float x, y, w, h;
float x2=75;
float y2=75;
float x3=30;
float y3=30;


//direction

void ballMovement () {

  stroke(255);
  strokeWeight(2);
  if (x>=width-x2) {
    w=-w;
    noFill();
  }

  if (x<=0+x2) {
    w=-w;
    fill(200, 200, 200, 50);
  }

  if (y>=height-y2 ) {
    h=-h;
    fill(200, 200, 200, 50);
  }

  if (y<=0+y2 ) {
    h=-h;
    fill(200, 200, 200, 50);
  }

  fill(200, 200, 200, 50);
  x=x+w;
  y=y+h;

  ellipse(x, y, x2, y2);
}

void ballPositioning () {

  stroke(255);
  strokeWeight(1);
  if (x>=width-x3) {
    w=-w;
    noFill();
  }

  if (x<=0+x3) {
    w=-w;
    fill(200, 200, 200, 50);
  }

  if (y>=height-y3 ) {
    h=-h;
    fill(200, 200, 200, 50);
  }

  if (y<=0+y3 ) {
    h=-h;
    fill(200, 200, 200, 50);
  }

  fill(200, 200, 200, 50);
  x=x+w;
  y=y+h;

  ellipse(x, y, x3, y3);
}



void draw() {
  smooth();
  background(132, 32, 77);
  ballMovement ();
  ballPositioning ();
}


void keyPressed() {
  saveFrame("illusionist-###.jpg");
}


