

void setup() {
  size(500,400);
  smooth();
  background(178,168,153);
  ellipseMode(CENTER);
  
}

void draw () {
  
  if(mousePressed){
    noStroke();
    fill(0,54,64,220);
    ellipse(mouseX,mouseY,mouseX,mouseX);
    
    }else{

  frameRate(2);
  stroke(255);
  strokeWeight(2);
  noFill();
  ellipse(mouseX,mouseX,mouseX,mouseY); }
  
  
  
  
}

