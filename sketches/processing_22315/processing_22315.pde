


void setup() {
  size(450, 450);
  colorMode(HSB,100);
  background(100);
  smooth();
  noFill();
   
}
 
void draw() {
  // noFill();
  // stroke(60,50,80,10);
  
  noStroke();
  //int distance = int (pmouseX-mouseX)-(pmouseY-mouseY);
  
 int cLocation = mouseX + mouseY;
 int pLocation = pmouseX + pmouseY;
  
  fill(cLocation-pLocation, 50, 200, 30);
  rect(mouseX, mouseY, cLocation-pLocation, cLocation-pLocation);
   
  fill(pLocation-cLocation, 50, 200, 30);
  rect(mouseX, mouseY, pLocation-cLocation, pLocation-cLocation);
   
 
 // ellipse(mouseX, mouseY, mouseX-pmouseX, mouseY-pmouseY);
  
    noStroke();
  fill(random(200),random(255),random(100),30);
  float diam = random(500);
  ellipse(mouseX, mouseY,diam,diam);
}

