
void setup(){
size(400,400, P3D);
noStroke();
smooth();
}
void draw(){
  cursor(CROSS);
  float x=mouseX;
  float y=mouseY;
  float ix=width-mouseX;
  float iy=height-mouseY;
background(#433A4A);
pushMatrix();
  fill(#E6E1A3);
  translate(iy,width/2, 200);
  sphere(50);
  popMatrix();
  pushMatrix();
  fill(0,159);
  translate(ix,height/2,200);
  sphere(50);
  popMatrix();
  pushMatrix();
  fill(0, 50);
  translate(ix+50,height/2,200);
  sphere(50);
  popMatrix();
  
}



