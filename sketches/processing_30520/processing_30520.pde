
float xmag, ymag = 0;
float newXmag, newYmag = 0; 

void setup(){
  size(1000, 800, P3D); 
  
}
  
  
  void draw(){
    background(0,25,61);
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
  
  scale(90);
  beginShape(QUADS);
    fill(random(0,20),random(0,60),random(mouseY),10);
    stroke(random(0,100),random(0,90),random(mouseY));
    translate(500,400);
    sphere(150);
    
  endShape();
  
  popMatrix(); 
  }

