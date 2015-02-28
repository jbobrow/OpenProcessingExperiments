
void setup() {
  size(120, 300);
  background(204);
  smooth();
  ellipse(60, 50, 80, 80);
  ellipse(60, 150, 80, 80);
  ellipse(60, 250, 80, 80);
}

void draw() {
  //background(204) to refresh the screen after lights
  //red light
  if (keyPressed) {
    if ((key == '1')) {
      fill(255, 0, 0);
    }
    else {
      fill(255);
    }
    ellipse(60, 50, 80, 80);
  }
  //orange light
  if ((key == '2')) {
    fill(255, 129, 26);
  }
  else {
    fill(255);
  }
  ellipse(60, 150, 80, 80);
  //green light
  if ((key == '3')) {
    fill(0, 255, 0);
  }
  else {
    fill(255);
  }
  ellipse(60, 250, 80, 80);
}


