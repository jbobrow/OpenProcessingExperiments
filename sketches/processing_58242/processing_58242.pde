
int speed = 1;

//top side
float j = -20;
float m = 80;

float ftw = 100; //full top width
float htw = 50; //half top width
float hth = 30; //half top height

//right and left sides
float sh = 60; //side height

//space
float js = 70; //x space
float ks = 44; //y space

float y = 600;
float yy = -100;

void setup() {
  size(700, 600);
}

void draw() {
  background(0);
  smooth();

  
  for(int k = height; k > 0; k -= 85) {
    for(int j = -20; j < width; j += 160) {
  cube(j,k);
    }
  }
    
  moveup();
  rowup(y);
  resetup();
  
  movedown();
  rowdown(yy);
  resetdown();
}

void moveup() {
  y = y - 2;
}

void resetup() {
  if(y < -100) {
    y = 700;
  }
}

void rowup(float y) {
  for(float x = 220; x < width; x += 320) {
    cube(x,y);
  }
}

void movedown() {
  yy = yy + 2;
}

void resetdown() {
  if(yy > 660) {
    yy = -100;
  }
}

void rowdown(float yy) {
  for(float x = 60; x < width; x += 320) {
    cube(x,yy);
  }
}

void cube(float x,float y) {
  sidetop(x,y);
  sideleft(x,y);
  sideright(x,y);
}

void sidetop(float x, float y) {
  noStroke();
  fill(#009ebe);
  beginShape();
  vertex(x, y);
  vertex(x+htw, y-hth);
  vertex(x+ftw, y);
  vertex(x+htw, y+hth);
  endShape(CLOSE);
}

void sideleft(float x, float y) {
  noStroke();
  fill(#00bfcb);
  beginShape();
  vertex(x, y);
  vertex(x, y+sh);
  vertex(x+htw, y+hth+sh);
  vertex(x+htw, y+hth);
  endShape(CLOSE);
}

void sideright(float x, float y) {
  noStroke();
  fill(#816ad7);
  beginShape();
  vertex(x+htw, y+hth);
  vertex(x+htw, y+hth+sh);
  vertex(x+ftw, y+sh);
  vertex(x+ftw, y);
  endShape(CLOSE);
}


