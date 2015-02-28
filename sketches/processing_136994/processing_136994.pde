

void setup() {
  size(600, 600);
}

void draw() {
 
  if(keyPressed && mousePressed) {
    if(key="c") {
      ellipse(mouseX, mouseY, 200, 200);
    }
  }
}

//the commented out code below is an alternative that also works

/*
void keyPressed(){
 if(key="c" && mousePressed){
  ellipse(mouseX, mouseY, 200, 200);
 } 
}

*/


