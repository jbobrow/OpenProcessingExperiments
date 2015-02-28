
//Nathan Lutz
//Introduction to Digital Media Fall 2012 - Assignment 01b
//Section B

void setup() {
  size(1200, 600);
  background(0);
}

float tool = 1;
color brush = color(0, 0, 180);
color pencil = color(0, 0, 0);
color setting = color(255, 255, 255);
boolean press = false;
float n = 0;
int i = 0;

void draw() {
  smooth();
  if (press == true) {
    if (tool == 1) {
      fill (brush);
      ellipse (mouseX, mouseY, 30, 30);
    }
    if (tool == 2) {
      if (n < 100) {
        float a = random(-width/4, width/4);
        float b = random(-height/4, height/4);
        float c = random(0, 255);
        stroke (0, 0, c);
        line(mouseX, mouseY, mouseX+a, mouseX+b);
      }
      else {
        n = 0;
      }
    }
    if (tool == 3) {
      if (n < 100) {
        float a = random(-100, 100);
        float b = random(-100, 100);
        float c = random(0, 255);
        if (setting == color(255, 255, 255)) {
          fill (0, 0, c);
        }
        else {
          fill (c, c, c);
        }
        stroke (0);
        ellipse(mouseX+a, mouseY+b, 10, 10);
      }

      else {
        n = 0;
      }

      fill (brush);
      ellipse(mouseX, mouseY, 10, 10);
    }
    else {
      n = 0;
    }
  }
  strokeWeight(5);
  stroke(0, 0, 40);
  fill(0, 0, 80);
  for (int i=1; i<5; i=i+1) {
    rect(height/30, (4*i+1)*height/30, height/10, height/10, height/100, height/100, height/100, height/20);
  }
  fill(brush);
  stroke(pencil);
  ellipse(height/30+height/20, 5*height/30+height/20, 30, 30);
  int i = 0;
  while (i < 5) {
    float rX = random(-20, 20);
    float rY = random(-20, 20);
    ellipse(height/30+height/20+rX, 13*height/30+height/20+rY, 10, 10);
    i=i+1;
  }
  fill(setting);
  rect(height/30+10, 17*height/30+10, 40, 40);
  line(height/30+10, 9*height/30+10, height/30+10 + 40, 9*height/30+10 + 40);
}

void mousePressed() {
  press = true;
  if ((height/30 < mouseX) && (mouseX < height/30 + height/10) && (5*height/30 < mouseY) && (mouseY < 5*height/30+height/10)) {
    tool = 1;
  }
  if ((height/30 < mouseX) && (mouseX < height/30 + height/10) && (9*height/30 < mouseY) && (mouseY < 9*height/30+height/10)) {
    tool = 2;
  }
  if ((height/30 < mouseX) && (mouseX < height/30 + height/10) && (13*height/30 < mouseY) && (mouseY < 13*height/30+height/10)) {
    tool = 3;
  }
  if ((height/30 < mouseX) && (mouseX < height/30 + height/10) && (17*height/30 < mouseY) && (mouseY < 17*height/30+height/10)) {
    if (setting == color(0, 0, 180)) {
      brush = setting;
      setting = color(255, 255, 2555);
    }
    else {
      brush = setting;
      setting = color(0, 0, 180);
    }
  }
}

void mouseReleased() {
  press = false;
}

void keyPressed() {
  if (key == 's') {
    save ("nathanLutzPaint3.png");
    }
}
