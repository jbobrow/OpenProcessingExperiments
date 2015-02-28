
int x1= 0;
int y1 = 0;
int num = 500;
int [] x = new int[num];
int [] y = new int[num];

void setup() {
  size(500, 500);
  background(0, 0, 0);
  noStroke();
}

void draw() {
  if (mouseX<250) {
    background(0, 0, 0);
    for (int j = 0; j<=500; j = j + 50) {
      for (int i = 0; i<=500; i = i + 50) {
        fill(#FF9E00);
        ellipse(x1+i, y1+j, 25, 25);
      }
    }
    ellipse (mouseX, mouseY, 25, 25);
    ellipse (mouseX+50, mouseY, 5, 5);
    ellipse (mouseX-50, mouseY, 5, 5);
    ellipse (mouseX, mouseY+50, 5, 5);
    ellipse (mouseX, mouseY-50, 5, 5);
  }


  if (mouseX>250) {
    background (0, 0, 0);
    noStroke();
    for (int j = 0; j<=500; j = j + 50) {
      for (int i = 0; i<=500; i = i + 50) {
        fill(#8FFF00);
        ellipse(x1+i, y1+j, random(10, 50), random(10, 50));
      }
    }
    for (int j = 0; j<=500; j = j + 50) {
      for (int i = 0; i<=500; i = i + 50) {
        for (int k = 0; k<=25; k = k+6) {
          fill(#FF9E00-k/3, random(5, 65));
          ellipse(x1+i, y1+j, 50-k, 50-k);
        }
      }
    }
  }
  if (keyPressed) {

    switch(key) {
    case ' ':
      background(200);
      break;
    }
    if (key == '1') {
      for (int j = 25; j<=550; j = j + 50) {
        for (int i = 25; i<=550; i = i + 50) {
          stroke(#00F2F0);
          line(x1+i, y1+j, x1+1, y1+j);
          line(x1+i, 0, x1+i, 500);
        }
      }
    }
    if (key == '2') {
      if (mouseX>250) {
        background(0, 0, 0);
        for (int j = 0; j<=500; j = j + 50) {
          for (int i = 0; i<=500; i = i + 50) {
            fill(#FF0015);
            rect(x1+i, y1+j, random(1, 50), random(1, 50));
          }
        }
        fill(#FF0015*mouseX+mouseY);
        rect (mouseX, mouseY, 25, 25);
        rect (mouseX+50, mouseY, 5, 5);
        rect (mouseX-50, mouseY, 5, 5);
        rect (mouseX, mouseY+50, 5, 5);
        rect (mouseX, mouseY-50, 5, 5);
      }
    }
    if (key == '3') {
      for (int j = 0; j<=500; j = j + 50) {
        for (int i = 0; i<=500; i = i + 50) {
          stroke(#00FF79);
          line(x1+i, y1+j, mouseX, mouseY);
        }
      }
    }
    if (key == '4') {
      //yif (mouseX>250) {
      if (mousePressed) {
        for (int i = x.length-1; i>0; i--) {
          x[i] = x[i-1];
          y[i] = y[i-1];
        }
        x[0]=mouseX;
        y[0]=mouseY;
        for (int i = 0; i<x.length; i++) {
          noStroke();
          fill(#FFF705*i, 255-20*i);
          rect(x[i], y[i], 50, 50, 50, random(5, 255));
        }
      }
      //}
    }
    if (key == '5') {
      if (mouseX>250) {
        filter(INVERT);
      }
    }
    if (key == '6') {
      if (mouseX>250) {
        background(mouseX, mouseY, 65, 20);
        stroke(0, 0, 0);
        line(pmouseX, pmouseY, random(width), random(height));
        line(pmouseX, pmouseY, random(width), random(height));
        line(pmouseX, pmouseY, random(width), random(height));
        line(pmouseX, pmouseY, random(width), random(height));
        line(pmouseX, pmouseY, random(width), random(height));
      }
    }
    if (key == '7') {
      //yif (mouseX>250) {
      if (mousePressed) {
        for (int i = x.length-1; i>0; i--) {
          x[i] = x[i-1];
          y[i] = y[i-1];
        }
        x[0]=mouseX;
        y[0]=mouseY;
        for (int i = 0; i<x.length; i++) {
          stroke(#FFF703, 255-20*i);
          line(x[i], y[i], pmouseX, pmouseY);
        }
      }
      //}
    }
    if (key == '8') {
      noStroke();
      fill(#02093E*mouseX);
      triangle(mouseX, mouseY, width/2, height/2, random(width), random(height));
      triangle(mouseX, mouseY, width/2, height/2, random(width), random(height));
      triangle(mouseX, mouseY, width/2, height/2, random(width), random(height));
    }
    if (key == '9') {
      if (mouseX>250) {
        filter(THRESHOLD);
      }
    }
    if (key == '0') {
      if (mouseX>250) {
        filter(POSTERIZE, random(2, 6));
      }
    }
    if (key == 'q' || key == 'Q') {
      for (int j = 25; j<=550; j = j + 50) {
        for (int i = 25; i<=550; i = i + 50) {
          fill(#FFDA03);
          ellipse(x1+i, y1+j, 25, 25);
        }
      }
    }
    if (key == 'w' || key == 'W') {
      fill(#273790*mouseY);
      for (int j = 0; j<=500; j = j + 50) {
        for (int i = 0; i<=500; i = i + 50) {
          //fill(#8FFF00);
          ellipse(x1+i, y1+j, random(10, 50), random(10, 50));
        }
      }
      for (int j = 0; j<=500; j = j + 50) {
        for (int i = 0; i<=500; i = i + 50) {
          for (int k = 0; k<=25; k = k+6) {
            //fill(#FF9E00-k/3, random(5, 65));
            ellipse(x1+i, y1+j, 50-k, 50-k);
          }
        }
      }
    }
    if (key == 'e' || key == 'E') {
      if (mouseX>250) {
        fill(0, 0, 0);
        background(255, 255, 255);
        textFont(createFont("SansSerif", random(120, 480)));
        text("X_X", random(width), random(height));
      }
    }
    if (key == 'r' || key == 'R') {
      if (mouseX>250) {
        background(0, 0, 0);
        fill(255);
        textFont(createFont("SansSerif", random(10, 102)));
        text("._.", mouseX, mouseY);
      }
    }
    if (key == 't' || key == 'T') {
      if (mouseX>250) {
        filter(BLUR, 1);
      }
    }
  }
}


