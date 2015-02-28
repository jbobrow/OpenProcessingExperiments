
int brushSize = 9;

void setup() { 
  size(400, 400); 
  smooth(); 
  noStroke();
  fill(0,0,0, 32); 
}


void draw() { 
    if ( mousePressed ) {
      ellipse(mouseX, mouseY, brushSize, brushSize);
    } 
}          


void keyPressed() {
    if ( key == '1' ) {
        brushSize = 9;
    } else if ( key == '2' ) {
        brushSize = 18;
    } else if ( key == '3' ) {
        brushSize = 36;
    }

}     
