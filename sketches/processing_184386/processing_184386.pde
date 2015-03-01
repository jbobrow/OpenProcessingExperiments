
//------------------------------------------------//
//Rectangles that appear by the move of a Mouse!//
//By Brandon Messner//
//------------------------------------------------//

void setup() {
  size(500,500);
}

void draw() {
  //float x=random(0,255);
  background(255);
  if (mouseX<width/2 && mouseX>100 && mouseY>100 && mouseY<400) {
    stroke(230,0,0);
    fill(230,0,0);
    rect(100,100,150,300);
  }
  if (mouseX>width/2 && mouseX<400 && mouseY>100 && mouseY<400) {
    stroke(175);
    fill(0);
    rect(width/2,100,150,300);
  }
}


