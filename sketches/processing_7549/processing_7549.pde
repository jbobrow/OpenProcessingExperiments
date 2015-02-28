
float xmag, ymag = 0;
float newXmag, newYmag = 0; 
PGraphics pg;
void setup()
{ 
  smooth();
  colorMode(RGB,600,600,600);
  size(600, 600, P3D); 
  pg=createGraphics(600,600,P3D);
  noCursor();
  stroke(600,600,600);
} 
void draw() 
{ 
  pushMatrix(); 
  translate(width/2, height/2, -30);
   if (mousePressed){
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
 }
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { xmag -= diff/4.0; }
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { ymag -= diff/4.0; }
  rotateX(-ymag); 
  rotateY(-xmag); 
  scale(150);
  beginShape(QUADS);
  fill(600-mouseX, 600-mouseY, mouseX); vertex(-1,  1,  1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex( 1,  1,  1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex( 1, -1,  1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex(-1, -1,  1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex( 1,  1,  1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex( 1,  1, -1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex( 1, -1, -1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex( 1, -1,  1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex( 1,  1, -1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex(-1,  1, -1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex(-1, -1, -1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex( 1, -1, -1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex(-1,  1, -1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex(-1,  1,  1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex(-1, -1,  1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex(-1, -1, -1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex(-1,  1, -1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex( 1,  1, -1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex( 1,  1,  1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex(-1,  1,  1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex(-1, -1, -1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex( 1, -1, -1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex( 1, -1,  1);
  fill(600-mouseX, 600-mouseY, mouseX); vertex(-1, -1,  1);
  endShape();
  popMatrix();
  pg.beginDraw();
  pg.background(600-mouseX, 600-mouseY, mouseX);
  pg.endDraw();
} 

