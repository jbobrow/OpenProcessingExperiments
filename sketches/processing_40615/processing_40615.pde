
boolean ogpattern = false;
void setup() {
  size(500, 500);
  background(20, 20, 20);
  smooth();
  frameRate(50);
  noStroke();
}

void makethingy(float x, float y) {
  if (ogpattern) {
    stroke(0, 0, 0);
    //fill(0, 0, 0);
    rect(x, y, 45, 45);
    //fill(70, 255, 244);
    rect(x, y, 35, 35);
    fill(#270E9B);
    ellipse(x, y, 20, 20);
  }
}

void draw() {
  if (mousePressed) {
    makethingy(mouseX, mouseY);
    ogpattern = true;
  }
  if (keyPressed) {

    switch(key) {
    case ' ':
      background(200);
      break;
      //case '1':
      //fill(25, 218, mouseX);
      //break;
    }

    if (key == 'n' || key == 'N') {
      background(255);
    }
    if (key == '1') {
      //background(136, 21, mouseY);
      filter(BLUR, 2);
    }
    if (key == '2') {
      stroke(#1Aff1B);
      fill(mouseX, 245, mouseY);
      triangle(random(width), random(height), 0, 0, 10, 10);
    }
    if (key == '3') {
      ogpattern = false;
      background(255);
      fill(0, 0, 0);
      textFont(createFont("SansSerif", 40));
      textAlign(CENTER);
      text("Are we having fun yet?", width/2, height/2);
    }
    if (key == '4') {
      fill(mouseY, mouseX, 82, 100);
    }
    if (key == '5') {
      if (mousePressed) {
        ogpattern = false;
        fill(#FF1A2D, 75);
        ellipse(mouseX, mouseY, 100, 100);
      }
    }
    if (key == '6') {
      if (mousePressed) {
        ogpattern = false;
        strokeWeight(random(1, 3));
        fill(255, mouseY, mouseX);
        beginShape();
        vertex(mouseX, mouseY);
        vertex(mouseX, mouseY+50);
        vertex(mouseX+20, mouseY);
        vertex(mouseX+40, mouseY+50);
        vertex(mouseX+90, mouseY+50);
        vertex(mouseX-90, mouseY-50);
        vertex(mouseX+20, mouseY-40);
        vertex(mouseX, mouseY);
        endShape();
        frameRate(60);//be warned this dilates fast
        filter(DILATE);
      }
    }
    if (key == '7') {
      if (mousePressed) {
        ogpattern = false;
        noStroke();
        for (int j = 0; j<=500; j = j + 50) {
          for (int i = 0; i<=500; i = i + 50) {
            for (int k = 0; k<=25; k = k+3) {
              ellipse(mouseX+i, mouseY+j, 45, 45);
              fill(70, 255, 244);
              fill(#270E9B-j/3);
            }
          }
        }
      }
    }
    if (key == '8') {
      if (mousePressed) {
        ogpattern = false;
        frameRate(60);//For some reason this part runs really slowly unless you press it first
        for (int j = 0; j<=100; j = j + 10) {
          for (int i = 0; i<=100; i = i + 10) {
            for (int k = 0; k<=25; k = k+3) {
              stroke(#F2F258, 17);
              line(mouseX+i, mouseY+j, mouseX, mouseY);
            }
          }
        }
      }
    }
    if (key == '9') {
      if (mousePressed) {
        ogpattern = false;
        fill(#3B99F5);
        triangle(mouseX, mouseY, width/2, height/2, pmouseX, pmouseY);
      }
    }
    if (key == '0') {
      noStroke();
      for (int j = 0; j<=500; j = j + 50) {
        for (int i = 0; i<=500; i = i + 50) {
          for (int k = 0; k<=25; k = k+6) {
            rect(0+i, 0+j, 45, 45);
            fill(70, 255, 244);
            rect(0+i, 0+j, 35, 35);
            fill(#470E9B-j/3);
            ellipse(0+i, 0+i, 20, 20);
            ellipse (500-i, 0+i, 20, 20);
          }
        }
      }
    }
  }
  else {
    fill(255);
  }
}

void keyPressed() {
  if (key == 'm') {
    filter(DILATE);
  }
  else if(key == 'b'){
    filter(INVERT);
  }
}


