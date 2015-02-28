
void setup () {
  size(600, 600);
  background (240, 240, 240);
}
void draw () {
  fill(24,79,30);
}

void mouseDragged() {
  if (key== 'q') {
    line(mouseX, mouseY, pmouseX, pmouseY);
    line(mouseX-4, mouseY+10, pmouseX+4, pmouseY-5);
    triangle(mouseX,mouseY,pmouseX,pmouseY,pmouseY,mouseX);
  }
     else  if (key== 'w') {
              ellipse(mouseX,mouseY,0.2*pmouseX,0.2*pmouseY);
            } 
              else { 
                     line(mouseX,mouseY,pmouseX+2,pmouseY-3);
                     line(mouseX,mouseY-3,pmouseX-4,pmouseY+1);
               }
}

void keyPressed () {
  if (key== 'r') {                //for red Press r
    stroke(255, 0, 0);
  }
  if (key=='b') {                //for black Press b
    stroke(0);
  }
  if (key== 'x') {
    stroke(random(256), random(256), random(256));    //for a random color Press x
  }
  if (key== 'c') {
    background(240, 240, 240);                    //to clear the screen Press c
  }

  
} 




