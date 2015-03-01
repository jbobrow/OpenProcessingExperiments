
int PenSize;
int R=255;
int G=255;
int B=255;

 
 //---------SET UP--------//
void setup() {
  size(500,500);
  background(110,125,118);
  
  smooth();
  PenSize = 5;
}
 
 //-----draw comand---------//
void draw() {
}
 
void mouseDragged() {
  strokeWeight(PenSize);
  stroke(R,G,B);
  line(mouseX,mouseY, pmouseX,pmouseY);
}
 
void keyPressed() {
 if(keyCode == RIGHT) {
    PenSize += 5;
    if(PenSize >= 10) {
      PenSize = 10;
      }
  } else if(keyCode == LEFT) {
    PenSize -= 5;
    if(PenSize <= 10) {
      PenSize = 10; 
    }
  }
  switch(key) {
    case 'r': //RED
      R=237;
      G=179;
      B=175;
      break;
    case 'b': //BLUE
      R=172;
      G=177;
      B=245;
      break;
    case 'y': //YELLOW
      R=239;
      G=243;
      B=167;
      break;
    case 'w': //WHITE
      R=255;
      G=255;
      B=255;
      break;
    case 'd': //ALL CLEAR
      background(110,125,118);
      break;
    }
}


