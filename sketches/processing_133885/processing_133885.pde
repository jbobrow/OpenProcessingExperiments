

Hair[] myHairs;
Nose[] myNose;
color newColor;
int count =0;

void setup() {
  size(800, 800);
  myHairs = new Hair[ 100 ];
  myNose = new Nose[ 1000];

  for ( int i=0; i<myHairs.length; i=i+1) {
    float newX = map(i, 0, myHairs.length, 0, width);
    float newRed = map(i, 0, random(255), 0, 255);
    float newGreen = map(i, 0, random(255), 0, 255);
    float newBlue = map(i, 0, random(255), 0, 255);
    newColor = color( newRed, newGreen, newBlue);
    myHairs[ i ] = new Hair( newX, newColor);
  }
}

void draw() {
  fill( 0, 10);
  rect( 0, 0, width, height);

  for ( int i=0; i<myHairs.length; i=i+1) {
    myHairs[i].update();
    myHairs[i].display();
  }

  if (mousePressed == true) {
    float newX = mouseX;
    float newY = mouseY;
    if ( count<myNose.length) {
      float newRed = random(255);
      float newGreen = random(255);
      float newBlue = random(255);
      newColor = color( newRed, newGreen, newBlue);
      myNose[count] = new Nose( newX, newY, newColor);
    }
    count++;
  }
  for ( int i=0; i<count; i=i+1) {
    myNose[i].update();
    myNose[i].display();
  }
}

class Hair {
  float x;
  float y;
  color fillColor;

  Hair( float theX, color theColor) {
    x = theX;
    y = height * 0.5;
    fillColor = theColor;
  }

  void update() {
    x = x + random(-2, 2);
    y = y + random(-2, 2);
  }

  void display() {
    noStroke();
    fill(fillColor);
    rect( x, y, 10, 10);
  }
}
class Nose {
  float x;
  float y;
  color fillColor;
  Nose( float theX, float theY, color theColor) {
    x = theX;
    y = theY;
    fillColor = theColor;
  }
  void update() {
    x = x + random(-10, 10);
    y = y + random(-10, 10);
  }
  void display() {
    noStroke();
    fill(fillColor);
    rect( x, y, 5, 5);
  }
}


