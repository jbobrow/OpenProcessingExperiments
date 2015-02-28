
//import processing.opengl.*;
import processing.video.*;
MovieMaker mm;


int d = 0;
int dim = 10;
 
 

void setup () {
   
  size(800, 600);
  mm = new MovieMaker(this, 800, 600, "drawingcircles.mov");

}
 
void draw() {
  background (0);
  if (mousePressed) {
    noFill();
    stroke(random(255),random(255),mouseX,100);
    ellipse(mouseX, mouseY, dim + d, dim + d);
  }
 
  if (mousePressed && (mouseButton == RIGHT)) {
    background(0);
  }
  
  mm.addFrame();

 
  if(keyPressed) {
    
      if (key == 'f') {
    // Finish the movie if space bar is pressed
    mm.finish();
    // Quit running the sketch once the file is written
    exit();
  }
 
    if (key == 'q' || key == 'Q') {
      d = d + 1;
    }
 
    if (key == 'a' || key == 'A') {
      d = d - 1;
    }
     
    d = constrain(d,0,300);
     
  }
  
}


