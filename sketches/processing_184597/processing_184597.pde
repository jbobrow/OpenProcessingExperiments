
int radius=40;
int direction = 1;
float angle = 0.0;
float offset = 20;
float scalar = 20;
float speed = 0.05;

void setup() {
size(320, 320);
background(255);
fill(240);
smooth();
} 

//Pressed mouse change background color
void mousePressed() {
  if (mouseButton==LEFT) {
     background(255);
  }
    else {
    background (0);
  
    if(mouseButton==RIGHT) {
      background(200);
    }
}
}


void draw() {
  float x = (offset + cos(angle) * scalar)*direction;
  float y = (offset + sin(angle) * scalar)*direction;
    translate (mouseX,mouseY);
    rotate(angle);
    rect(-x, -y, 30, 30);
      angle += 0.1;
      scalar += speed;
}


