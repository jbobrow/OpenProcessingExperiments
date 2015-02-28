
// Bouncing line

int borderThickness;
int marginLeft, marginRight, marginTop, marginBottom;
int positionX, positionY;
int bouncedX, bouncedY;           // toggles between 1 and -1 when bouncing
int angleRotation;
int speed;
int lineLength;

void setup() {
  size(800,600);
  background(0);
  borderThickness = 10;
  marginLeft = borderThickness;
  marginTop = borderThickness;
  marginRight = width - borderThickness;
  marginBottom = height - borderThickness;
  positionX = borderThickness;
  positionY = borderThickness;
  bouncedX = 1;
  bouncedY = 1;    
  angleRotation = 0;
  angleRotation = int(random(1, 360));                   //problem with random in Javascript - see below
  speed = 6;
  lineLength = 200;
  positionX = int(random(marginLeft, marginRight));      //problem with random in Javascript - see below  
  positionY = int(random(marginTop, marginLeft));        //problem with random in Javascript - see below
  noStroke();
  colorMode(HSB);
  frameRate(30);
}

void draw() {
  pushStyle();                      //fading the line
    fill(0, 1);
    rect(0, 0, width, height);
  popStyle();
  if ((positionX < marginLeft) || (positionX > marginRight)) bouncedX = bouncedX * (-1);
  if ((positionY < marginTop) || (positionY > marginBottom)) bouncedY = bouncedY * (-1);
  positionX = positionX + speed * bouncedX;
  positionY = positionY + speed * bouncedY;
  pushMatrix();
    translate(positionX, positionY);
    angleRotation = angleRotation%360;
    rotate(radians(angleRotation));
    pushStyle();
      rectMode(CENTER);
      fill(map(positionX, marginLeft, marginRight, 10, 255), 255, 255);   //in map - Javascript stops if 0 or 1 is usend instead of 2
      rect(0, 0, 1, lineLength);              //if random() is used, Javascript draws double instances of rect(), ellipse() and line()
    popStyle();
  popMatrix();
  angleRotation ++;
}


void mouseClicked() {
  //if (mouseEvent.getClickCount()==2) {        //double click to exit, but only works in Java
    exit();
  //}
}



