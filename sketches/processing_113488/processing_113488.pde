
//variables
float x;
float y;

int r;
int g;
int b;

boolean colorchange;

void setup () {
  size(900, 900);
  background(240);
  stroke(1);
  r=(255);
  g=(255);
  b=(255);
  colorchange=false;
}

void draw () {
  stroke(r, g, b);
  noFill();
  x= mouseX;
  y= mouseY;

  if (mousePressed) {
    ellipse(x, y, 250, 200);
    if (!colorchange) {
      r--;
      g--;
      b--;
    } 
    else if (colorchange) {
      r++;
      g++;
      b++;
    }
    if (b <=100 || b>=255) {
      colorchange = !colorchange;
    }
  }
}
void keyReleased() {
  if (key == ' ') {
    background(random(255), random(255), random(255));
  }
}


