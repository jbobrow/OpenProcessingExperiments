
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala
  
float sW;
  
void setup(){
  size(600,600);
  background(0);
  smooth();
  frameRate(10); // set the speed of the frameRate
}
  
void draw(){
  fill(#325A7D,50);
  noStroke();
  rect(0,0,width,height);
    
  // generator for c color range (0 to 255)
  sW = random(25);
  float c = random(255);
   
  colorMode(RGB, 255, width, height);
  stroke(255,width,height);
  strokeWeight(sW);
  fill(c,mouseX,mouseY);
  quad(random(width),random(height),random(width),random(height),random(width),random(height),random(width),random(height));
    
}
