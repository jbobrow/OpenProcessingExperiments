
int i = 0;
int a = 0;
int s = 0;
int d = 0;
int f = 255;
int q = 5;
int b = 1;
int p = 10;
int t = 1;
float n = 4;
float j = .5;
float k = 1;
PImage butterfly;
PImage cloud;
PFont font;

void setup () {
  smooth();
  size(800, 800);
  background(255);

  stroke(0);
  strokeWeight(1.5);
  fill(180, 225, 225, 100);
  rect(-1, -1, 802, 31);


  font = createFont("Calibri", 18, true);
  textFont(font);
  fill(100);
  text("Better than Paint: 1.0", 10, 20);

  fill(0);
  rect(609, 1, 28, 28);

  noStroke();
  fill(230);
  rect(647, 1, 28, 28);

  butterfly = loadImage("butterfly.jpg");
  image(butterfly, 685, 1, 28, 28);

  cloud = loadImage("cloud.jpg");
  image(cloud, 723, 1, 28, 28);

  fill(250, 0, 0);
  rect(761, 1, 28, 28);
  fill(250);
  text("?", 771, 21);
}  

void refresh () {
  smooth();
  size(800, 800);
  background(255);

  stroke(0);
  strokeWeight(1.5);
  fill(180, 225, 225, 100);
  rect(-1, -1, 802, 31);


  font = createFont("Calibri", 18, true);
  textFont(font);
  fill(100);
  text("Better than Paint: 1.0", 10, 20);

  fill(0);
  rect(609, 1, 28, 28);

  noStroke();
  fill(230);
  rect(647, 1, 28, 28);

  butterfly = loadImage("butterfly.jpg");
  image(butterfly, 685, 1, 28, 28);

  cloud = loadImage("cloud.jpg");
  image(cloud, 723, 1, 28, 28);

  fill(250, 0, 0);
  rect(761, 1, 28, 28);
  fill(250);
  text("?", 771, 21);
}

void mouseClicked () {
  if (mouseY >= 1) {
    if (mouseY <= 29) {
      if (mouseX >= 609) {
        if (mouseX <= 637) {
          n = 4;
          b = 1;
        }
      }
      if (mouseX >= 647) {
        if (mouseX <= 675) {
          n = 4;
          b = 2;
        }
      }
      if (mouseX >= 685) {
        if (mouseX <= 727) {
          n = 4;
          b = 3;
        }
      }
      if (mouseX >= 737) {
        if (mouseX <= 751) {
          n = 4;
          b = 4;
        }
      }
      if (mouseX >= 761) {
        if (mouseX <= 789) {
          b = 0;
          n = random(4, 12);
        }
      }
      if (n > 12) {
        n = 4;
      }
    }
  }
}  

void draw () {
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      a += 1;
    }
    if (key == 'z' || key == 'Z') {
      a -= 1;
    }
    if (key == 's' || key == 'S') {
      s += 1;
    }
    if (key == 'x' || key == 'X') {
      s -= 1;
    }
    if (key == 'd' || key == 'D') {
      d += 1;
    }
    if (key == 'c' || key == 'C') {
      d -= 1;
    }
    if (key == 'f' || key == 'F') {
      f += 1;
    }
    if (key == 'v' || key == 'V') {
      f -= 1;
    }
    if (key == 'q' || key == 'Q') {
      q -= 1;
    }
    if (q >= 400) {
      q = 400;
    }  
    if (key == 'w' || key == 'W') {
      q += 1;
    }
    if (q <=1) {
      q = 1;
    }
    if (key == 'p' || key == 'P') {
      p += 1;
    }  
    if (p >= 30) {
      p = 30;
    }
    if (key == 'o' || key == 'O') {
      p -= 1;
    }
    if (p <= 10) {
      p = 10;
    }
    if (key == '1') {
      n = 4;
      b = 1;
    }
    if (key == '2') {
      n = 4;
      b = 2;
    }
    if (key == '3') {
      n = 4;
      b = 3;
    }
    if (key == '4') {
      n = 4;
      b = 4;
    }
    if (key == '5') {
      b = 0;
      n = random(4, 12);
    }
  }  

  if (b < 2) {
    if (b > 0) {
      if (mousePressed == true) {
        stroke(a, s, d, f);
        strokeWeight(q);
        line(mouseX, mouseY, pmouseX, pmouseY);
      }
    }
  }

  if (b < 3) {
    if (b > 1) {
      if (mousePressed == true) {
        pushMatrix();
        noStroke();
        fill(255);
        rect(mouseX, mouseY, p, p);
        popMatrix ();
      }
    }
  }

  if (b < 4) {
    if (b > 2) {
      if (mousePressed == true) {
        pushMatrix();
        noStroke();
        translate(random(-90, 90), random(-90, 90));
        fill(random(255), random(255), random(255));
        ellipse(mouseX, mouseY, 10, 33);
        ellipse(mouseX-11, mouseY-5, 20, 25);
        ellipse(mouseX+11, mouseY-5, 20, 25);
        ellipse(mouseX-9, mouseY+9, 15, 15);
        ellipse(mouseX+9, mouseY+9, 15, 15);
        popMatrix ();
      }
    }
  }

  if (b < 5) {
    if (b > 3) {
      if (mousePressed == true) {
        pushMatrix();
        float u = random(50, 250);

        fill(u);
        ellipse (mouseX, mouseY, 50, 15);
        ellipse (mouseX+20, mouseY-10, 40, 20);
        ellipse (mouseX+30, mouseY, 50, 20);
        ellipse (mouseX+7, mouseY+10, 40, 15);
        ellipse (mouseX+23, mouseY+11, 50, 10);

        if (u < 75) {
          pushMatrix();
          beginShape();
          fill(250, 250, 0);
          vertex(mouseX+10, mouseY+18);
          vertex(mouseX-2, mouseY+40);
          vertex(mouseX+10, mouseY+35);
          vertex(mouseX+5, mouseY+65);
          vertex(mouseX+20, mouseY+27);
          vertex(mouseX+8, mouseY+32);
          vertex(mouseX+18, mouseY+18);
          endShape();
          popMatrix();
        }
        popMatrix();
      }
    }
  }
  if (n > 4) {
    if (n <= 6) {
      if (mousePressed == true) {
        if (t < 125) {
          t += 1;
        } 
        else {
          t = 1;
        }
        fill(random(240, 255), random(255), 0);
        ellipse(mouseX, mouseY, t, t);
      }
    }
  }

  if (n > 6) {
    if (n <= 7) {
      if (mousePressed == true) {
        fill(0, random(255), random(255), random(255));
        noStroke(); 
        bezier(mouseX-random(850), mouseY+random(200), mouseX+random(100), mouseY+random(100), mouseX+random(900), mouseY+random(900), pmouseX+random(150), pmouseY-random(800));
      }
    }
  }

  if (n > 7) {
    if (n <= 8) {
      if (mousePressed == true) {
        pushMatrix();
        noStroke();
        translate(random(-300, 300), random(-300, 300));
        fill(random(255), random(255), random(255));
        ellipse(mouseX, mouseY, random(5, 500), random(5, 500));
        popMatrix();
      }
    }
  }

  if (n > 8) {
    if (n <= 9) {
      if (mousePressed == true) {
        fill(random(255), 0, random(255), random(255));
        noStroke(); 
        bezier(mouseX-random(400), mouseY+random(100), mouseX+random(50), mouseY+random(50), mouseX+random(650), mouseY+random(650), pmouseX+random(150), pmouseY-random(400));
      }
    }
  }

  if (n > 9) {
    if (n <= 10) {
      if (mousePressed == true) {
        fill(random(255), random(255), 0, random(255));
        noStroke(); 
        bezier(mouseX-random(100), mouseY+random(300), mouseX+random(500), mouseY+random(500), mouseX+random(600), mouseY+random(600), pmouseX+random(100), pmouseY-random(200));
      }
    }
  }

  if (n > 10) {
    if (n <= 11) {
      if (mousePressed == true) {
        if (t > 200) {
          k = -1;
        } 
        if (t < 0) {
          k = 1;
        }
        t += k;
        fill(0, random(200, 255), random(255));
        ellipse(mouseX, mouseY, t, t);
      }
    }
  }
  
  if (n > 11) {
    if (n <= 12) {
      if (mousePressed == true) {
        if (t < 60) {
          t += 1;
        } 
        else {
          t = 1;
        }
        fill(random(255), 0, random(220, 255));
        ellipse(mouseX, mouseY, t, t);
      }
    }
  }
  
  stroke(0);
  strokeWeight(1.5);
  fill(180, 225, 225, 100);
  rect(-1, -1, 802, 31);


  font = createFont("Calibri", 18, true);
  textFont(font);
  fill(100);
  text("Better than Paint: 1.0", 10, 20);

  fill(0);
  rect(609, 1, 28, 28);

  noStroke();
  fill(230);
  rect(647, 1, 28, 28);

  image(butterfly, 685, 1, 28, 28);

  image(cloud, 723, 1, 28, 28);

  fill(250, 0, 0);
  rect(761, 1, 28, 28);
  fill(250);
  text("?", 771, 21);
}


void keyPressed () {
  if (key == ' ') {
    refresh();
  }
}


