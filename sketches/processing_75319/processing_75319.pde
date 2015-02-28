
float colours = 0;

void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  
  stroke(colours, 0, 0);
  strokeWeight(5);
  
  if(pmouseX > 0 && mousePressed)
  line(pmouseX, pmouseY, mouseX, mouseY);

}

void keyPressed() {
  if (colours == 0) {
    colours = 255;
  } else {
    colours = 0;
  }
  
 }
