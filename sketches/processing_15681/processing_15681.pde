
import processing.pdf.*;


void setup() {
  size(400,400);
}

void draw() {
  background(100);
 
  
  //this is the loop that changes the ypos
  for(int ypos = 0; ypos < 400; ypos = ypos + 60) {
    
  //this is the loop that change xpos
  for(int xpos = 0; xpos < 400; xpos = xpos + 30) {
    fill(0,55,300);
    ellipse(xpos,ypos,10,50);
    fill(800,mouseX,100,300);
    textSize(80);
    text("<<<",xpos,ypos);
  }
  }
}

                
                
