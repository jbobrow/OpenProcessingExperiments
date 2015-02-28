
int x = 200;
int y = 150;
int radio = 150;
int xx = 200;
int yy = 300;
int radio2 = 75;

void setup() {
  size (400, 400);
 }

void draw() {
  background(200);
  float d = dist(mouseX, mouseY, x, y);
  if(d < radio/2) {
   
    fill(0);
  } else {
    fill(255);
  }
  ellipse(x, y, radio, radio);
  
    float dd = dist(mouseX, mouseY, xx, yy);
  if(dd < radio2/2) {
   
    fill(255);
  } else {
    fill(0);
  }
  ellipse(xx, yy, radio2, radio2);
}
