

void setup() {
  size(500,500);
  noStroke();
}

void draw() {
  
  float b=dist(width,height/2,mouseX,mouseY); //b=mouse distance from (500,250)
  float m=map(b,0,width,0,255); //stretches range from 255 to the width (500)
  background(m,255-m,150); //Background changes based on 'm'
  float f= map(mouseX,0,width,0,width/2); //stretches range of mouseX
  fill(f,255-f,150); //ellipse fill changes based on 'f'
  ellipse(mouseX,mouseY,200,200); //ellipse goes where you go
}


