
String s = "Draw with Mouse, Delete: z, change background: r";
 
 
void setup() {
  size(600, 200);
  background(255);
  text(s, 0, 0, 0, 0);
   // Text wraps within text box
}

float strokeSize = 2;

void draw() {
  if (mousePressed) {
    stroke(1);
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
    background(86,75,50);
    text(s, 0, 0, 0, 0);
    
  }
 
  
  if (key=='r') {
      
    background(0, 0, 0);
    stroke(0, 0, 0);
    strokeWeight(strokeSize);
    text(s, 10, 10, 75, 100);
  }

}



