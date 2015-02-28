
//ever-growing ellipse, C6 symmetry
//ethan dale
//CCA SP2011 math, programming & art

void setup(){
  size(500,500);
  smooth();
  strokeWeight(.5);
  colorMode(HSB,360,100,100,100);
}

void draw(){
  background(160);
  translate(width/2, height/2);
  for(int i = 0; i < 6; i++){
//  pushMatrix();
      rotate(radians(60));
      fill(120,100,100);
      ellipse(mouseX,mouseX,25,mouseX);
      noFill();
      fill(0,0,30);
      ellipse(mouseX,0,25,mouseX);
      noFill();
//  popMatrix();
  }
}

