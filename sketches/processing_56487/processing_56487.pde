
PImage backg;
PImage gus;
PImage sam;
PImage georgia;
PImage gusturn;
PImage samturn;
PImage georgiaturn;
float x; 
float easing = 0.01;

void setup() {
  size(1200, 800); 
  smooth(); 
  strokeWeight(2); 
  background(#02142C); 
  ellipseMode(RADIUS);
  backg =loadImage ("planetbackground.jpg");
  gus = loadImage("gusleft.png");
  sam = loadImage("samright.png");
  georgia = loadImage("georgiaright.png");
  gusturn = loadImage("gusright.png");
  samturn = loadImage("samleft.png");
  georgiaturn = loadImage("georgialeft.png");
}
void draw () {
  image(backg, 0, 0, 1200, 800);
  if (mousePressed) {
    image (gus, 800, 400, mouseX /1.2, mouseY /1.2);
  } 
  else {
    image (gusturn, 800, 400, mouseX /1.2, mouseY /1.2);
  }
  if (mousePressed) {
    image (georgia, mouseX, mouseY, 100, 100);
  } 
  else {
    image (georgiaturn, mouseX, mouseY, 100, 100);
  }
  if (mousePressed) {
    float targetX = mouseX; 
    x += (targetX - x) * easing; 
    image(sam, x, 300, 200, 200); 
    println(targetX + " : " + x);
  }
  else {

    float targetX = mouseX; 
    x += (targetX - x) * easing; 
    image(samturn, x, 300, 200, 200); 
    println(targetX + " : " + x);
  }
}


