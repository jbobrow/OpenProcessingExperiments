
float a;
float b;
float c;
float i = 0.1;
int rectX = 80;
int rectY = 80;
int N = 2;
void setup() {
  size(400,400);
  smooth();
}

void draw() {
  translate(mouseX,mouseY);
if (mousePressed) {
    a = random(0,255);
    b = random(0,255);
    c = random(0,255);
    fill(a,b,c);
  } else {
    fill(255);
  }
  rotate(i++);
  strokeWeight(0);
rect(-rectX/2, -rectY/2, rectX, rectY);
}


