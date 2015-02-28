
void setup() {
  size(500, 500);
}


void draw() {
  background(255);
  for (int i=mouseX; i<width; i = i+90 ) {
    for (int j=5; j<500; j = j+20     ) {
      stroke(#E5C900);
      noFill();
    
      quad(mouseX,j, j, mouseY,i,i,i,i); 
      //ellipse(250, j, i, 100);
    }
  }
}


