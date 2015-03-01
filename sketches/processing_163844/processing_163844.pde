
// egg position
int x = 400;
int y = 300;
float radius = 20; // radius of egg
float angle = 0.0;
float anglevel = 0.1;//velocity of the tail
float amplitude = 10; // amplitud of the tail sine wave
// heads of the sperms
Float headRadius = amplitude*1.8;
float headx= 200; 

int a=10;
void setup() {
  size(800, 600);
  smooth();
  ellipseMode(RADIUS);
}
void draw() {
  background(216, 80, 132);
  tail(200,255,200); // three numbers to control color
  spermHead();
  egg();
  mouseInEgg(200); // you can tell maximum radius of the egg.
}

void egg() {
  noStroke();
  fill(193, 30, 90);
  ellipse(x, y, radius, radius);
}

void mouseInEgg(float maxEggSize) { 
  float d = dist(mouseX, mouseY, x, y);
  if ((d < radius) && (radius <= maxEggSize)) {
    fill(213, 49, 100);
    text("GET OUT!!", 300, 300);
    radius = radius * 1.09;
    textSize(40);
    headx = 100;
  }
  // conditional to grow till maxEggSize radius
  if (radius >= maxEggSize) {
    radius = maxEggSize;
  }
  // if mouse out from ovary return to normal
  if (d > radius && radius > 20) {
    radius = radius - 5;
    headx = 200;
  }
}


void tail(int red, int green, int blue) {
  for ( int x = 100; x<=200; x +=4) {//the length of the sperm tail
    fill(red, green, blue);
    // 3 tails
    float y4 = amplitude *sin(angle);
    angle += anglevel;
    ellipse(x, y4+height/4, 2, 2);
    ellipse(x+100, y4+height/2, 2, 2);
    ellipse(x, y4+height*3/4, 2, 2);
  }
}
void spermHead() {
  ellipse(headx, height/4, headRadius, headRadius);
  ellipse(headx + 100, height/2, headRadius, headRadius);
  ellipse(headx, height*3/4, headRadius, headRadius);
}


