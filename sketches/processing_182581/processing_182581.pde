

/*////////////////////////////////////////////////
 
 By David Steele Overholt
 Kansas City Art Institute
 Simple Mouse Interactivity Sketch
 January 2015
 
 ////////////////////////////////////////////////*/

float lastMouseX;
float lastMouseY;

void setup() {
  size(900, 600);
  background(255);
  noStroke();

}

void draw() {

  if (mousePressed == true) {
    fill(255, 255, 255, 25); 
    ellipseMode(CORNER);
  } else if(mousePressed == false) {
    fill(255, 255, 255, 2);
    ellipseMode(RADIUS);
  }

  rect(0, 0, 900, 600);


  if (mouseX > lastMouseX && mouseY > lastMouseY) {
    for (int i = 0; i < 100; i = i+1) {
      fill(0, i*3, 0, (100 - i)/3);
      ellipse(mouseX - i*2, mouseY - i*2, 2, 2);
    }
  } else if (mouseX > lastMouseX && mouseY < lastMouseY) {
    for (int i = 0; i < 100; i = i+1) {
      fill(i*3, i*3, 0, (100 - i)/3);
      ellipse(mouseX - i*2, mouseY + i*2, 2, 2);
    }
  } else if (mouseX < lastMouseX && mouseY < lastMouseY) {
    for (int i = 0; i < 100; i = i+1) {
      fill(i*3, 0, i*3, (100 - i)/3);
      ellipse(mouseX + i*2, mouseY + i*2, 2, 2);
    }
  } else if (mouseX < lastMouseX && mouseY > lastMouseY) {
    for (int i = 0; i < 100; i = i+1) {
      fill(0, i*3, i*3, (100 - i)/3);
      ellipse(mouseX + i*2, mouseY - i*2, 2, 2);
    }
  } else {
    delay(10);
  }

  lastMouseX = mouseX;
  lastMouseY = mouseY;
  
}


