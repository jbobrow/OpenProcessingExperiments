
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: PARK Jeungeun
// ID: 201420080
 
 void setup() {
  size(600, 600);
  smooth();
  background(255);
}
void draw() {

  
   if (mousePressed) {
     stroke(10,mouseX, mouseY,50);
    strokeWeight(30);
   line(mouseX, mouseY, pmouseX, pmouseY);
   
    title();
  }
 
  if (keyPressed) {
    setup();
  }
}

void title() {
  fill(120);
  textAlign(RIGHT);
  text("PARK Jeungeun, DRW, Dynamic Media, 2014", width-50, height-20);
}

