
int r = 0;
int g = 255;
int b = 0;
int w = 0;

void setup() {
  size(400, 400);
  }
  
void draw() {
  fill(r, g, b, 40);
  ellipse(width/2, width/2, w, 300);
  g--;
  b++;
  w++;
  }             
