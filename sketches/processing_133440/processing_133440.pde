
String s = "Draw with Mouse, Delete: z, change background: r";
 
 
void setup() {
  size(500, 500);
  background(0, 0, 0);
  text(s, 10, 10, 75, 100);
   // Text wraps within text box
}

float strokeSize = 1;

void draw() {
  if (mousePressed) {
    stroke(#ffffff);
    strokeWeight(strokeSize);
    strokeSize = (strokeSize +0.1);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  else {
    strokeSize = 1;
  }
  
}

void keyPressed() {
  
  if (key=='z') {
    background(0);
    text(s, 10, 10, 75, 100);
    
  }
 
  
  if (key=='r') {
      
    background(255, 0, 0);
    stroke(0, 0, 0);
    strokeWeight(strokeSize);
    text(s, 10, 10, 75, 100);
  }

}



