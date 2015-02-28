
int x = 50;
int y = 50;
int w = 100;
int h = 75;

float r;
float g;
float b;

void setup() {
  size(200,200);
}

void draw() {
  background(255);
  stroke(0);
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    r=random(255);
    g=random(255);
    b=random(255);
    fill(r,g,b);
  } else {
    fill(175);
  }
  rect(x,y,w,h);
}


