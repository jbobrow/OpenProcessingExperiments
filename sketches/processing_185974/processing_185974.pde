
 float x;
  float ix;
void setup(){
  size(400,400);
  noStroke();
  smooth();
    frameRate(30);
}
void draw(){
  if (mousePressed==true)
  {
  mousePressed();
  }
  else
  {
  mouseReleased();
  }
}

void mouseDragged(){
  x=mouseX;}
  void mouseMoved(){
    ix=width-mouseX;}
 
void mousePressed(){
      background(255);

fill(0,0,255,100);
  ellipse(pmouseX,pmouseY,ix,ix);
fill(0,255,0,100);
  ellipse(width-pmouseX,height-pmouseY,ix,ix);
 filter(BLUR,10);
  
 fill(255,0,0);
      ellipse(200,200,mouseX,mouseX);
      fill(255,100);
      ellipse(200,200,mouseX,mouseX);
fill(0,255,0,100);
  ellipse(ix,height-mouseY,x,x);
fill(0,0,255,100);
    ellipse(mouseX,mouseY,x,x);}
    
void mouseReleased()
{mousePressed();
  filter(INVERT);
}

