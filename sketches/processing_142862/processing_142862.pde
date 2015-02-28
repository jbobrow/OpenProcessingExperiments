
float x;
float y;
float px;
float py;
float easing = 0.05;


void setup() {

  background(random(255), random(255), random(255));

  size(800, 800);
  noStroke();
  frameRate(60);
}

float radius = 10;

void draw() {
  
    

  if (mousePressed == true) {
    float targetX = mouseX;
    x += (targetX - x) * easing;
    float targetY = mouseY;
    y += (targetY - y) * easing;
    float weight = dist(x,y, px, py);
    py = y;
    px = x;
    
    noStroke();
    fill(random(255), random(255), random(255), 50);
    ellipse(mouseX, mouseY, radius, radius);
    radius++;
  }
  if (mousePressed == false) {
    // background(255);
    radius = 0;

    if (keyPressed && (key == CODED)) {

      if (keyCode == UP) {
        background(random(255), random(255), random(255));
      }
    }
  }
}

