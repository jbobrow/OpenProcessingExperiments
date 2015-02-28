
void setup() {  //setup function called initially, only once
  size(300, 300);
  smooth();
  background(0);  //set background white
}

float x, y, targetX, targetY;
float easing = 0.05;

void draw()
{  //draw function loops
  background(0);
  stroke(255);
  strokeWeight(5);
  targetX = mouseX;
  float dx = targetX - x;
  if (abs(dx) > 1) {
    x += dx * easing;
  }

  targetY = mouseY;
  float dy = targetY - y;
  if (abs(dy) > 1) {
    y += dy * easing;
  }
  
  //Linie
  stroke(255);
  strokeWeight(dist(mouseX, mouseY, x, y)/150);
  line(mouseX, mouseY, x, y);
  
  //Raster
  stroke(255,  127);
  strokeWeight(0.25);
  line(0, y, width, y);
  line(x, 0, x, height);
  ellipse(0, y, 5, 5);
  ellipse(width, y, 5, 5);
  ellipse(x, 0, 5, 5);
  ellipse(x, height, 5, 5);
  
  //Ellipse
  noStroke();
  fill(255);
  ellipse(x, y, 20, 20);
  
  //Punkt
  stroke(0);
  strokeWeight(3);
  point(x, y);
}
