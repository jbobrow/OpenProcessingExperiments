
void setup() {
  size(300, 300);
  smooth();
}

void draw() {

  //blue rectangular underlay
  fill(50, 125, 225);
  noStroke();
  rect(0, 0, width, height/2);

  //green rectangular underlay
  fill(85, 211, 83);
  rect(width/2, 0, width/2, height);

  //yellow rectangular underlay
  fill(250, 230, 30);
  rect(0, height/2, width, height/2);

  //red rectangular underlay
  fill(250, 30, 30);
  rect(0, 0, width/2, height);

  //yellow rectangular Overlay
  if (mouseX<width/2) {
    fill(250, 230, 30);
    rect(0, height/2, width/2, height/2);
  }

  //green rectangular Overlay
  else {
    fill(85, 211, 83);
    rect(width/2, height/2, width/2, height/2);
  }

  //blue rectangular overlay
  if (mouseY>height/2) {
    fill (50, 125, 225);
    rect (0, 0, width/2, height/2);
  }

  if (mousePressed) { //When the mouse is pressed, the composition changes
    background(0, 255);

    //white rectangle underlay
    fill(255);
    rect(0, 0, width, height/2);

    //light gray rectangular Overlay
    if (mouseX<width/2) {
      fill(211);
      rect(0, 0, width/2, height);
    }

    //dark gray rectangular Overlay
    else {
      fill(200);
      rect(width/2, height/2, width/2, height/2);
    }

    //Black rectangular Underlay
    if (mouseY>height/2) {
      fill(0, 255);
      rect(0, height/2, width, height/2);
    }

    //light gray square overlay
    else {
      fill(100);
      rect(width/2, 0, width/2, height/2);
    }
  }
}


