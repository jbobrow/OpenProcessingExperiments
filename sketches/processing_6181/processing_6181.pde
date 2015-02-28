
float xmag, ymag = 0;
float newXmag, newYmag = 0; 
void setup()
{ 
  size(255, 255, P3D); 
  noCursor();
  stroke(255,255,255);
} 
void draw() 
{ 
  background(255);
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
  scale(40);
  beginShape(QUADS);
  fill(255-mouseX, 255-mouseY, mouseX); vertex(-1,  1,  1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex( 1,  1,  1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex( 1, -1,  1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex(-1, -1,  1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex( 1,  1,  1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex( 1,  1, -1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex( 1, -1, -1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex( 1, -1,  1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex( 1,  1, -1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex(-1,  1, -1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex(-1, -1, -1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex( 1, -1, -1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex(-1,  1, -1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex(-1,  1,  1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex(-1, -1,  1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex(-1, -1, -1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex(-1,  1, -1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex( 1,  1, -1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex( 1,  1,  1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex(-1,  1,  1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex(-1, -1, -1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex( 1, -1, -1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex( 1, -1,  1);
  fill(255-mouseX, 255-mouseY, mouseX); vertex(-1, -1,  1);
  endShape();
  popMatrix(); 
} 

