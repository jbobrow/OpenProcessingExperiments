
void setup(){
  size(1200,800);
}
void draw(){
  float r=random(255);
  float g=random(255);
  float b=random(255);
  float a=random(255);
  ellipse(mouseX,mouseY,pmouseX-pmouseY,200);
  fill(r+mouseX,g,b,a);
  if(mousePressed){
    fill(r-mouseX,g,b,a);
  }
}


