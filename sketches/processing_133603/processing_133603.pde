

float mySize = 1;
boolean crazyColor = true;

void setup () {
  size( 600, 600);
  background( 255, 255, 255); 
}


void draw() {

  noStroke(); 
  fill(0);
  rect(0, 560, 600, 40);

  textSize(12);

  fill(255);
  ellipse(280, 580, 20, 20);
  text("Press  Q", 300, 584);
  stroke(0);
  strokeWeight(3.5);
  line(260, 580, 290, 580);
  line(280, 570, 280, 590);

  ellipse(380, 580, 20, 20);
  text("Press  W", 400, 584);
  line(360, 580, 390, 580);

  frameRate(3);
  fill(random(255), random(255), random(255));
  ellipse(480, 580, 20, 20);
  text("Press  E", 500, 584);
}

void mouseDragged()
{
  if ( crazyColor) {
    float r=random(255);
    float g=random(255);
    float b=random(255);
    stroke(r, g, b, 150);
  } 
  else {
    stroke(255);
  }
  frameRate(30);
  strokeCap(SQUARE);
  strokeWeight(mySize);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed() {
  if (key == 'e') {
    crazyColor = !crazyColor;
  }
  if (key == 'q') {
    mySize = mySize+5;
  }

  if (key == 'w') {
    mySize = mySize-5;
  }
}



