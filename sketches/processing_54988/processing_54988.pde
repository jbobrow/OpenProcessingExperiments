
import processing.pdf.*;

float k1 = random(255);
float k2 = random(255);
float k3 = random(255);
int value=0;
//variable for the random line placements

void setup(){
 size(500,500);
 //sets size of screen
 background(249,246,210);
 //set background colour
 smooth();
 //smoothes lines & shapes edges
 stroke(200,56,162);
 //sets colour of stroke for line & shape
 frameRate(10);
 //number of frames drawn per second
   beginRecord(PDF, "everything.pdf");
   //starts to record for pdf export file
 }
 
void draw () {
 line(mouseX, mouseY, pmouseX, 500);
 //follows mouse and draws lines where it was located
  println(mouseX);
    fill (k1,k2,k3);
  line(mouseX,mouseY,random(500),random(500));
   //draws lines from where ever the mouse is located randomly from (0-500)
  fill (k1,k2,k3);
  line(mouseX,mouseY,random(500),random(500));
   
   }

void mousePressed() {
  if (mouseButton == RIGHT) {
    background(random(250),random(250),random(250));
      //right clicked will change the background to set background colour
      }
  else if (mouseButton == LEFT) {
    stroke(random(100),random(100),random(100));
      //left clicked the colour will change to dark strokes/lines
  }
}

void keyPressed() {
  if (key == 'q'){ //quit sketch 
    endRecord();
    exit();
  }
}
