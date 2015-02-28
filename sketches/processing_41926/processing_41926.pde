
void setup() {
  size(400, 680);
  fill(#FFFECE);
  smooth();
  rect(0, 0, width, height);
}

void draw() {

  
  ///////////////////////////bloc-notes
  noStroke();
  fill(#834A24);
  rect(0, 0, width, 40);
  stroke(0, 80);
  for (int i = 40; i < 800; i = i+20) {
    line(0, 2*i, width, 2*i);
  }
  stroke(255, 0, 0);
  line(40, 40, 40, height);
  
  
  
  /////////////////////////////line

  {
    if (mousePressed) {
      cursor(CROSS);
      stroke(0);
      {

        line(mouseX, mouseY, pmouseX, pmouseY);
      }
    }
    else {
      cursor (ARROW);
    }
  }
}


