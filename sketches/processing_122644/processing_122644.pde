
void setup() {
  size(600, 600);
  background(255, 255, 0);
  noStroke();
  smooth();
  fill(0,0,250,14); 
}  
void draw() { 
} 
void mouseDragged(){
   ellipse(mouseX, mouseY, 40, 80);
 }
void keyPressed() {
    switch(key) {
    case 'z':
      background(255, 255, 0);   
      break; case 'k':
    fill(255, 255, 0,12);   
      break;   
      case 'q':
      fill(0, 255, 0,12);
      break;
    case 'r':
      fill(255,12);   
      break;
    case 'w':
      fill(0, 0, 255,12);
      break;
    case 'e':
      fill(255, 0, 0,12);
      break;

    case 't':
      fill(0,12);
      break;
  }
  }
