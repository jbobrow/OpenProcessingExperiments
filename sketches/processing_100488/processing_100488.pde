
PFont font;

float angle = 0.5;
float offset = 90;
float scalar = 50;
float speed = 0.8;
int radius = 40;
float x = 110;
int direction = 1;

void setup() {
  size(450, 150);
  fill(0);
  smooth();
  ellipseMode(RADIUS);
  font = loadFont("LithosPro-Regular-40.vlw");
  textFont(font);
  background(105);
}

void draw() {
  fill(random(255),10,200,40);
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  ellipse( x, y, 100, 100);
  angle += speed;
  scalar += speed;
  
  if (x > direction == 1) 
    arc(x, 60, radius, radius, 0.52, 5.76);
  
  

  fill(250);
  textSize(50);
  text("My Name is Zach", 40, 80);
}


