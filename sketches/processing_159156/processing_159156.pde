

boolean savePDF = false;


void setup() {
  size(720, 720);
  noCursor();
}


void draw() {
  


  colorMode(RGB, 360, 80, 108);
  rectMode(CENTER); 
  noStroke();
  background(mouseY/2, 100, 100);

  fill(360-mouseY/2, 100, 100);
  rect(360, 360, mouseX+1, mouseX+1);

 
}
