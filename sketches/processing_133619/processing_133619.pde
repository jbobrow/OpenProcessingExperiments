
Flutter[] myOrigami;
Origami follower;

int flutterCount = 0;

void setup() {
  size(400,400);
  myOrigami = new Flutter[100];
  
  follower = new Origami(width/2,color(255,255,0));
  
  /*
  for (int i=0; i<myOrigami.length; i=i+1){
    float newX = map(i, 0, myOrigami.length, 0, width);
    float newRed = map(i, 0, myOrigami.length, 0, 255);
    color newColor = color( newRed, 255,255 );
    myOrigami[i] = new Origami(newX, newColor);
  }
  */
  noCursor();
}

void draw () {
  fill(220, 40);
  rect(0,0,width,height);
  follower.update();
  follower.display();
  
  for ( int i=0; i<flutterCount; i++) {
    myOrigami[i].update();
    myOrigami[i].display();
  }
  
}

void mousePressed() {

  float newRed = random(255);
  color newColor = color( newRed, random(0), random(255), 80 );
  
  if (flutterCount < myOrigami.length) {
    myOrigami[flutterCount] = new Flutter(mouseX, mouseY, newColor); 
    flutterCount ++;
  }
}
class Flutter {
  float x;
  float y;
  color fillColor;


Flutter( float theX, float theY, color theColor) {
  x = theX;
  y = theY;
  fillColor = theColor;
}

void update() {

}

void display() {
  
  int resolution = 12;
  float radius = 10;
  
  pushMatrix();
  translate(x,y);
  beginShape();
  noStroke();
  fill(fillColor);
  float myX = 0, myY = 0;
  
  for ( int i=0; i<resolution; i=i+1 ) {
    float angle = map( i, 0, resolution, 0, TWO_PI );   // 0 to TWO_PI is 0 to 360 degrees
    float circleOffX = cos(angle) * radius;             // x offset from circle center
    float circleOffY = sin(angle) * radius;             // y offset from circle center
    myX = circleOffX + random( -10, 10 );                     //
    myY = circleOffY + random( -10, 10 );

    vertex( myX, myY );
  }
  endShape(CLOSE);
  popMatrix();
}}

class Origami {
  float x;
  float y;
  color fillColor;


Origami( float theX, color theColor) {
  x = theX;
  y = height * 0.5;
  fillColor = theColor;
}

void update() {
  x = x + random(-5, 5);
  y = y + random(-5, 25);
}

void display() {
  
  int resolution = 12;
  float radius = 10;
  float circleX = mouseX;
  float circleY = mouseY;
  
  beginShape();
  noStroke();
  fill(fillColor);
  for ( int i=0; i<resolution; i=i+1 ) {
    float angle = map( i, 0, resolution, 0, TWO_PI );   // 0 to TWO_PI is 0 to 360 degrees
    float circleOffX = cos(angle) * radius;             // x offset from circle center
    float circleOffY = sin(angle) * radius;             // y offset from circle center
    float x = circleX + circleOffX + random( -10, 10 );                     //
    float y = circleY + circleOffY + random( -10, 10 );

    vertex( x, y );
  }
  endShape(CLOSE);
}}



