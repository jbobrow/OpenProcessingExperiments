

void setup() {
  size(700, 300);
   
  colorMode(HSB, 100);
  background(89, 42, 100);
  smooth();
  noFill();
  frameRate(10);
   
}
 
void draw() {
  
  //strokeWeight(mouseX);
  strokeWeight(random(5)); 
  stroke(random(100), random(100), random(100), 30);
  line(700, mouseY-(random(300)), 0, mouseY);
  
  
  /*
  stroke(20);
  fill(random(50), random(50), random(100), 10);
  rect(mouseX, mouseY, random(40), random(40));
  //rect(mouseX, mouseY+100, random(40), random(40));
  */
}
 


void mousePressed() {
  background(random(100), random(100), random(100));
   
}

void keyPressed() {
  saveFrame("Drawing tool_r.tiff");
  
}

