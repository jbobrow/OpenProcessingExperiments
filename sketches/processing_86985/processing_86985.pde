
int rot = 0;
int tri = 256;
int prismatic = 0;

void setup(){
  size(512,512);
  background(128,128,128);
  colorMode(HSB);
  noStroke();
  smooth();
  frameRate(30);
}

void draw(){
  translate(256,256);
  
  fill(prismatic%256,256,256);
  ellipse(0,0,512,512);
  
  rotate(radians(rot*3));
  fill(256,0,128);
  triangle(0,0,tri*sqrt(3)/3,tri,-tri*sqrt(3)/3,tri);
  rotate(radians(120));
  triangle(0,0,tri*sqrt(3)/3,tri,-tri*sqrt(3)/3,tri);
  rotate(radians(120));
  triangle(0,0,tri*sqrt(3)/3,tri,-tri*sqrt(3)/3,tri);
  
  ellipse(0,0,128,128);
  
  fill(prismatic%256,256,256);
  ellipse(0,0,64,64);
  
  rot++;
  prismatic++;
}


