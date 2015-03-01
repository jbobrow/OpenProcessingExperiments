
void setup(){
  size(400,400);
  noStroke();
  smooth();
}
void draw(){
  float x;
  float ix;
    x=mouseX;
  ix=width-mouseX;
  frameRate(30);

      background(0);
fill(255,255,0,100);
  ellipse(pmouseX,pmouseY,ix,ix);
fill(255,100);
  ellipse(width-pmouseX,height-pmouseY,ix,ix);
 filter(BLUR,10);
 
 fill(32,175,170,100);
      ellipse(200,200,mouseX,mouseX);
      fill(255,100);
      ellipse(200,200,mouseX,mouseX);
fill(255,100);
  ellipse(ix,height-mouseY,x,x);
fill(255,215,0,100);
    ellipse(mouseX,mouseY,x,x);
}

