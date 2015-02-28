
int GREEN = 1;
int BLACK = 2;
int RED = 3;
int curColor;
void setup () {
  frameRate (120);
  size (400,400);
  strokeWeight (19);
  stroke (0, 255, 0);
  curColor = RED;
  clearScreen ();
}
void clearScreen (){
  background (255);
}
void draw () {
  if (curColor == GREEN) {
    curColor = BLACK;
    stroke (0);
  }else if (keyCode == DOWN) {
       curColor = RED;
      stroke (255, 0, 0);
      strokeWeight (25);
  }else if (keyCode == RIGHT){
        curColor = GREEN;
        stroke (0, 255, 0);
  }else if (keyCode == LEFT) {
    fill(0, 0, 255);
  float drip = int (random(5));
  ellipse(mouseX, mouseY, drip, drip);

 

  } else {
    curColor = GREEN;
    stroke (0, 255, 0);
  }
  
}
void keyPressed (){
if (key == CODED) {
    if (keyCode == UP) {
    clearScreen ();
    }
      }
       }
      
                  
                  

float x,y;
void mousePressed() {
  x = mouseX;
  y = mouseY;
}
void mouseDragged () {
  line (mouseX, mouseY, x, y);
  x = mouseX;
  y = mouseY;
}



