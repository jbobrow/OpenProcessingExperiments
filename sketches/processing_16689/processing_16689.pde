
PVector[] p = new PVector[3];
float shift = 1.0;
float fade = 0.5;
float fillCol = 0;
float rot = 1.0;
float spin = 0.0;
//float angle;
//float cosine;
//float ellipse;

int x;
int y;

float diam=100;

void setup() {
  size(600, 600);
  x=width/2;
  y=height/2;
}

void draw() {
  background(25,100,255);
  drawFlower();
}

void drawFlower() {
  pushMatrix();
translate(width/2, height/2);
  //rotate(radians(45));
   rotate(radians(frameCount * 0.5  % 360));

//cosine = cos(angle);
//rotate(cosine);
//ellipseMode(CENTER);

//rotate(rot+=radians(spin));
//rotateZ(radians(360));
  noStroke();
  fillCol=0;
  p[0] = new PVector(-diam, diam);
  p[1] = new PVector(diam, diam);
  p[2] = new PVector(0, -diam);
  triBlur();
  popMatrix();
}

void triBlur() {
  fill (255,0,150, fillCol);
  fillCol += fade;
  rotate(rot+=radians(spin));
  triangle(p[0].x, p[0].y, p[1].x, p[1].y, p[2].x, p[2].y); 

  p[0].x=p[0].x+shift;
  p[0].y=p[0].y-shift/2;
  p[1].x=p[1].x-shift;
  p[1].y=p[1].y-shift/2;
  p[2].x=p[2].x+32;
  p[2].y=p[2].y+shift;

  if (p[0].x < 0) {
    // recursive call
    triBlur();
  }
}


