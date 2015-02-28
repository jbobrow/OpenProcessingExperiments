
void setup() {
  size(700,700);

}

void draw() {
  
 if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    stroke(mouseX,mouseY,98);
    strokeWeight(abs(mouseX-pmouseX));
                  } 
}



void keyPressed() {
   saveFrame("farbigenes.png");
  
}

