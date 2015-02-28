
void setup() {
  size(500,500);
  background(144,198,193);         //blue-green
  smooth();
}

void draw() {
  ellipse(mouseX, mouseY, 50, 20);
  if (mouseX > 300) {              //test
    fill(0);                       //statement black
  } else if (mouseX > 200) {       //test
    fill(100);                     //statement gray
  } else {
    fill(255);                     //statement white
  }
  if (mousePressed == true) {     //test
    fill(255,245,134);            //statement yellow
  }
}


