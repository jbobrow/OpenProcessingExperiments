
void setup(){
  size(600,600);
  background(0);
  fill(20);
  stroke(400);
fill(122);
smooth();
}
  
void draw(){
  colorMode(HSB);
  frameRate(10000);
ellipse(mouseX,1,2,mouseY);
noFill();
stroke(255/2);
ellipse(mouseY/69,mouseX/12);
stroke(167);
}

