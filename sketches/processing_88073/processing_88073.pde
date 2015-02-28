
float x;
float y;
float px;
float py;
float easing=0.05;
PFont font;
int a=20;
int b=40;
int radius =10;

void setup() {
  size(480,480);
  background(181,175,142);
  smooth();
  font = loadFont("Aharoni-Bold-32.vlw");
  textFont(font, 32);
  ellipseMode(RADIUS);
}
 
void draw() {
  float targetX = mouseX;
  x += (targetX - x) *easing;
  float targetY = mouseY;
  y += (targetY - y) *easing;
  float weight = dist(x,y,px,py);
  stroke(130,217,137,75);
  strokeWeight(weight);
  fill(219,232,159,25);
  ellipse(mouseX, mouseY, 10, 10);
  line(x,y,px,py);
  py = y;
  px = x;
  
  if (mousePressed == true) {
  textFont(font, 32);
  text("Enter the Void", 100, 100);
  } else {
  fill(255,105,255);
  textFont(font, 32);
  text("Enter the Void", 100, 100);
}
  textFont(font, 18);
  text("Before It Enters You", 100, 125);

float d = dist(x, y, mouseX, mouseY);
  if (d <= radius) {
    radius++;
    fill(0);
  } else {
    fill(219,232,159,25);
  }
  noStroke();
  ellipse(100, 100, radius, radius);
 
}



