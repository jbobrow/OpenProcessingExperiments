
PFont font;
Boolean bounceDown = false;
Boolean bounceUp = false;
float easing = 0.1;

float x;
float y;


void setup() {
  font = loadFont("IntramuralJL-48.vlw");
  textFont(font);
  textAlign(CENTER, BOTTOM);
  size(500, 500);
  x = width/2;
  y = height/2;
}


void draw() {
  background(255);
  fill(63, 113, 32);
  rect(0, height-20, width, height);
  
  
  if (bounceDown) {
    println("bounceDown!");
    y += 25;
    if(y >= height) {
      println("switching!");
      y = height;
      bounceDown = false;
      bounceUp = true;
    }
  }
  if (bounceUp) {
    println("bounceUp!");
    float targetX = mouseX;
    float distX = targetX - x;
    x += distX * easing;
    
    float targetY = mouseY;
    float distY = targetY - y;
    y += distY * easing;
    
    if (dist(x, y, targetX, targetY) < 1) {
      bounceUp = false;
    }
  }
  if (!bounceDown && !bounceUp) {
    x = mouseX;
    y = mouseY;
  }
  
  fill(78, 38, 20);
  text("TOUCHDOWN", x, y);
}

void mousePressed() {
  if (!bounceUp) bounceDown = true;  
}

