
//setup
float x;
float y;
PImage bg;
PImage img;
float easing = 0.20;

void setup() {
 size(1024, 679); 
 bg = loadImage("appt.jpg");
 img = loadImage("woman2.png"); 
}

void draw() { 
  //background(0);
  background(bg);
  image(img, x, 250);
  imageMode(CENTER);
  
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
  }
  
  
}


