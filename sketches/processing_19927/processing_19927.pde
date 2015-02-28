
void setup() {
  size(600, 600);
  colorMode(HSB, 200);
  background(200);
  smooth();

  
}

void draw(){
  
  float sw = dist(pmouseX, pmouseY, mouseX, mouseY);
  stroke(HSB,sw*2);
  
  println(mouseX + " " + mouseY);
  fill(pmouseY, pmouseX);  
  line(mouseX, mouseY, sw, 55);
  ellipse(mouseX, mouseY, sw*2, 55);
 
}
  

void mousePressed() {  
background(200);
}




