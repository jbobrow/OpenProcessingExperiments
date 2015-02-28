
float trivar;
float bgvar;
float c1;
float c2;
float c3;

void setup(){
  size(500,500);
  frameRate(24);
}

void draw(){
  
  background(bgvar);
  
  noStroke();
  fill(trivar);
  triangle(250,c1,c2,250,c3,300);
  
  bgvar = random(mouseY);
  trivar = random(mouseX);
  
  c1 = random(1,500);
  c2 = random(1,500);
  c3 = random(1,500);
}
