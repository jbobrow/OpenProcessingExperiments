
int x = 150;
int y = 174;
int radius = 12;

void setup() {
  size(500,350);
  smooth();
  ellipseMode(RADIUS);
}

void draw() {
  
//------------------------------------CIRCLE
  background (255,207,59);
  float d = dist(mouseX, mouseY, x, y);
  noStroke();
  if (d<radius) {
    radius++;
    fill(255);
  } 
  else {
    fill(0);
  }
  ellipse(x, y, radius, radius);
  
  if (mousePressed == true) {
    radius = 12;
  }
  
//------------------------------------RECT

int a = x+170;
int b = y-13;
int w = 50;
int h = 30;
noStroke();
  if ((mouseX > a) && (mouseX < a+w) &&
      (mouseY > b) && (mouseY < b+h)) {
    fill (0);
  } else {
    fill(255);
  }
  rect(a,b,w,h);
  
//------------------------------------END
}


