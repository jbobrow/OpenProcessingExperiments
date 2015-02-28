
int x = 200;
int y = 200;
int radio = 100;
int xx = 100;
int yy = 100;
int radios = 50;

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
  if(dd < radios/2) {
   
    fill(255);
  } else {
    fill(0);
  }
  ellipse(xx, yy, radios, radios);
}
