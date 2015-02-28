
void setup() {
  size(800,800);
  ellipseMode(CENTER);
  rectMode(CENTER);
  smooth();
}

void draw() {
  float arms = int((float(mouseY)/width)*16);
  int eSize = mouseX; 
  background(0);

  pushMatrix();
  translate(width/2,height/2);
  for (int i = 0; i < arms; i++) {
    fill(255,255,255,100);
    rotate((2*PI)/arms);
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipse(0,height/8, eSize/4, eSize/4);
    ellipse(0,height/4, eSize/8,eSize/8);
    ellipse(0,height/2, eSize, eSize);
    rect(0,0,width/2,height/2);
  }  
  popMatrix();
  filter(BLUR,3);
}



