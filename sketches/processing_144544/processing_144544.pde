


float rect_length = 0;
boolean clicked = false;

void setup() {
  size(400, 400);
}


void draw() {
  fill(30, 30, 255);
  rect(10, 10, 20, 20);

  if (clicked == true) {
    rect(40, 10, rect_length, 20);
    rect_length = rect_length+1.5;
    if (rect_length > 100) {
      rect_length = 100;
    }
  }
  
}

void mouseReleased() {
  if (mouseX >= 10 && mouseX <= 30 && mouseY >=10 && mouseY <= 30) {
  clicked = true;
  }
}



