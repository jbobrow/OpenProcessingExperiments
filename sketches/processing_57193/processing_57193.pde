
int x = 250;
int y = 250;
int disp = 25;

float triLength = (300);
float triWidth = (400);

void setup() {
  size(500, 500);
  noStroke();
  frameRate(30);
}

void draw() {
  background(100);

  int ay = y-disp;
  int bx = x+disp;
  int cy = y+disp;
  int dx = x-disp;

  float base = (triLength/2);
  float height = (triWidth/2);

  float mHeight = height+5;          // middle triangle height
  float mBase = base+12.5;           // middle triangle width
  float oBase = base+25;             // outer triangle width
  float oHeight = height+10;         // outer triangle height

  fill(125);
  triangle(x, ay+20, (x-oBase), (y-oHeight), (x+oBase), (y-oHeight));
  triangle(bx-20, y, (x+oHeight), (y-oBase), (x+oHeight), (y+oBase));
  triangle(x, cy-20, (x+oBase), (y+oHeight), (x-oBase), (y+oHeight));
  triangle(dx+20, y, (x-oHeight), (y+oBase), (x-oHeight), (y-oBase));

  fill(150);
  triangle(x, ay+10, (x-mBase), (y-mHeight), (x+mBase), (y-mHeight));
  triangle(bx-10, y, (x+mHeight), (y-mBase), (x+mHeight), (y+mBase));
  triangle(x, cy-10, (x+mBase), (y+mHeight), (x-mBase), (y+mHeight));
  triangle(dx+10, y, (x-mHeight), (y+mBase), (x-mHeight), (y-mBase));

  fill(200);
  triangle(x, ay, (x-base), (y-height), (x+base), (y-height));
  triangle(bx, y, (x+height), (y-base), (x+height), (y+base));
  triangle(x, cy, (x+base), (y+height), (x-base), (y+height));
  triangle(dx, y, (x-height), (y+base), (x-height), (y-base));
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      triLength = triLength+10;
    } 
    else if (keyCode == LEFT) {
      triLength = triLength-10;
    } 
    else if (keyCode == UP) {
      triWidth = triWidth+10;
    } 
    else if (keyCode == DOWN) {
      triWidth = triWidth-10;
    } 
    else if (keyCode == ALT) {
      disp = disp-10;
    } 
    else if (keyCode == SHIFT) {
      disp = disp+10;
    }}
    else if (key == 'x') {
      x = x+10;
    }
    else if (key == 'z') {
      x = x-10;
    }
    else if (key == 'y') {
      y = y+10;
    }
    else if (key == 't') {
      y = y-10;
    }
  }  
  


