
boolean firstIsSet = false;
int xOne;
int yOne;
int xTwo;
int yTwo;


void setup () {
  size (400, 400);
  background(27);
  text("the distance between 2 points", 100, 20);
  text("click to set the first point", 112, 40);
}

void draw() {
}

void mousePressed() {

  if (firstIsSet == false) {
    background(27);
    xOne = mouseX;
    yOne = mouseY;
    firstIsSet = true;
    ellipse(xOne, yOne, 5, 5);
    text("the distance between 2 points", 100, 20);
    text("click to set the second point", 104, 40);
  }
  else {
    int xTwo=mouseX;
    int yTwo=mouseY;
    firstIsSet = false;
    float disTance = sqrt((sq(xOne-xTwo) + sq(yOne-yTwo)));
    background(27);
    ellipse(xTwo, yTwo, 5, 5);
    ellipse(xOne, yOne, 5, 5);
    text("the distance between 2 points", 100, 20);
    text("distance =", 130, 365);
    text(disTance, 200, 365);
    text("click to set a new first point", 106, 40);
  }
}
           
