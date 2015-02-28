
float xmag, ymag = 0;
float newXmag, newYmag = 0;
  
void setup()
{
  // setting up 3D-friendly environment
  size(250, 250, P3D);
  noStroke();
}
  
void draw()
{
  background(0);
  stroke(0);
  strokeWeight(3);
    
  pushMatrix();
  
  translate(width/2, height/2, -30);
   
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
   
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { xmag -= diff/4.0; }
   
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { ymag -= diff/4.0; }
   
  rotateX(-ymag);
  rotateY(-xmag);
   
  scale(35);
  beginShape(QUADS); // 4 corners
  
  // draw shape - side 1
  fill(255); vertex(-1,  1,  1);
  fill(255); vertex( 1,  1,  1);
  fill(255); vertex( 1, -1,  1);
  fill(255); vertex(-1, -1,  1);
  // side 2
  fill(255); vertex( 1,  1,  1);
  fill(255); vertex( 1,  1, -1);
  fill(255); vertex( 1, -1, -1);
  fill(255); vertex( 1, -1,  1);
  // side 3
  fill(255); vertex( 1,  1, -1);
  fill(255); vertex(-1,  1, -1);
  fill(255); vertex(-1, -1, -1);
  fill(255); vertex( 1, -1, -1);
  //side 4
  fill(255); vertex(-1,  1, -1);
  fill(255); vertex(-1,  1,  1);
  fill(255); vertex(-1, -1,  1);
  fill(255); vertex(-1, -1, -1);
  // side 5
  fill(255); vertex(-1,  1, -1);
  fill(255); vertex( 1,  1, -1);
  fill(255); vertex( 1,  1,  1);
  fill(255); vertex(-1,  1,  1);
  // side 6
  fill(255); vertex(-1, -1, -1);
  fill(255); vertex( 1, -1, -1);
  fill(255); vertex( 1, -1,  1);
  fill(255); vertex(-1, -1,  1);
 
  endShape(); 
  popMatrix();
 
 // small red circle
 fill(255,0,0);
 ellipse(width-mouseX-25, height-mouseY-25, 25, 25);
} 

