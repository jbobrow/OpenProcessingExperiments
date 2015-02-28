
void setup(){
  size(400,400);
  noStroke();
  smooth();
  noCursor();
}

void draw(){
  float x=mouseX;
  float y=mouseY;
  float ix=width-mouseX;
  float iy=height-mouseY;
  float r=random(255);
  float g=random(255);
  float b=random(255);
  background(#66CCFF);
  if(mousePressed==true){
  fill(r,g,b);}
  else{
    fill(#ffff00);
  }
  ellipse(200,200,mouseX,mouseY);
  fill(0);
    ellipse(ix,iy/3,50,50);
  fill(0);
    ellipse(ix,y/3,50,50);
      fill(0);
    ellipse(ix,y,50,50);
  if(x>200){
    fill(255);
    triangle(x,y,x+25,y-25,x+25,y+25);
  }
  else{
    fill(255);
    triangle(x,y,x-25,y-25,x-25,y+25);
  }
}

