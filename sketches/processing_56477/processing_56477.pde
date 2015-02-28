
/** draw a square that breaks up into 16 different
 triangles. These triangles will then move apart.
 */

int x = 250;
int y = 250;
int disp = 25;

int ay = y-disp;
int bx = x+disp;
int cy = y+disp;
int dx = x-disp;


void setup() {
  size(500, 500);
  noStroke();
  fill(200);
}

void draw() {
  background(100);

  float triLength = (50+mouseX);
  float triWidth = (50+mouseY);

  float base = (triLength/2);
  float height = (triWidth/2);
  
  if (mouseY < 250){
    disp = disp+1;
  } else if(mouseY > 250){
    disp = disp-1;
  }

  triangle(x, ay, (x-base), (y-height), (x+base), (y-height));
  triangle(bx, y, (x+height), (y-base), (x+height), (y+base));
  triangle(x, cy, (x+base), (y+height), (x-base), (y+height));
  triangle(dx, y, (x-height), (y+base), (x-height), (y-base));
}


