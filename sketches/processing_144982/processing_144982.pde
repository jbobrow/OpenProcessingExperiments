
// Konkuk University 
 // Department of Dynamic Media
 // SOS iDesign 
// Name: LEE hyeri
 // ID: 201420101 

int x = 0; 
int y = 0; 
int xSpeed = 3; 
int ySpeed = 2; 

float r= 0;
float r2=PI;
float s = 40;
int sz=80;
boolean saveAnim = false;
float frm;

void setup() {
  size(600, 600);
  background(#202020);
  fill(#202020, 100);
  stroke(255);
}

void draw() {
  x = x+xSpeed;
  y = y+ySpeed;
  if ((x<-100) || (x>100)) {
    xSpeed = xSpeed*-1;
  }
  if ((y<-100) || (y>100)) {
    ySpeed = ySpeed*-1;
  }

  pushMatrix();
  translate(width/2, height/2);
  fill(0);
  ellipse(0, 0, 160, 160);
  fill(random(255),random(255),random(255));
  ellipse(x, y, 10, 10);
  popMatrix();

  fill(0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(r2);  
  rect(s+sz/2, 0, sz*1.25, sz*1.25, 10);

  popMatrix();

  r += TAU/90;
  r2 -= TAU/90;

  if (saveAnim) {
    if (frameCount % 3 == 0 && frameCount < frm+91) saveFrame("image-###.gif");
  }
}

void keyPressed() {
  saveAnim = true;
  frm = frameCount;
}

