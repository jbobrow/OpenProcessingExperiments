
import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

int x = 0;
int y = 0;
int x1 = 0;
int y1 = 0;
int x0 = 0;
int y0 = 0;

int x2 = 0;
int y2 = 0;
int x3 = 0;
int y3 = 0;
int x4 = 0;
int y4 = 0;

int x5 = 0;
int y5 = 0;
int x6 = 0;
int y6 = 0;

int x7 = 0;
int y7 = 0;
int x8 = 0;
int y8 = 0;

long time = 0;
int step = 0;

PFont f;

void setup() {
  size(500, 500);
  background(255);
  Ani.init(this);
  smooth();

  x = width/2;
  y = 10;
  x1 = 3*width/8;
  y1 = height/3 + 75;
  x0 = 3*width/8 + 75 + 10;
  y0 = height/3;
  x2 = width/2;
  y2 = 10;
  x3 = 3*width/8 + 75 + 10;
  y3 = height/3;
  x4 = 3*width/8;
  y4 = height/3 + 75;
  x5 = width/2;
  y5 = 10;
  x6 = 3*width/8 + 75;
  y6 = height/3;
  x7 = width/2;
  y7 = 10;
  x8 = 3*width/8 + 75 + 10;
  y8 = height/3;


  f = createFont("Arial", 16, true);
}

void draw() {
  background(255);

  textFont(f, 16);
  fill(0);
  line(9*width/10, 7*height/8, 9*width/10, 7*height/8 - height/20); //because the loop adds too many indices
  for (int i = 1; i < 9; i++) {
    text((i-1) + "", i*width/10 + width/20, 7*height/8 + height/20);
    line(i*width/10, 7*height/8, i*width/10, 7*height/8 - height/20);
  }

  textFont(f, 22);
  textAlign(LEFT);
  if (step >= 0 && step <= 3) {
    text("Placing Circle", 10, 1.25*height/20);
  }
  else if (step >= 4 && step <= 7) {
    text("Placing Square", 10, 1.25*height/20);
  }
  else if (step >= 8 && step <= 11) {
    text("Searching for Ellipse", 10, 1.25*height/20);
  }
  else {
    text("Searching for Circle", 10, 1.25*height/20);
  }

  textAlign(CENTER);
  textFont(f, 16);

  //placing square
  if (step == 0) {
    rect(x, y, 20, 20);
    Ani.to(this, 10, "x", 3*width/8);
    Ani.to(this, 10, "y", height/3 + 20);
    if (x <= 3*width/8 + 10 && y >= height/5 - 10) {
      step++;
      time = millis();
    }
  }

  if (step == 1) {
    textAlign(CENTER);
    fill(0);  
    text("Hashing", 3*width/8, height/3);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 2) {
    textAlign(CENTER);
    fill(0);
    text("5", x0, y0);
    Ani.to(this, 10, "x0", 6*width/8 + 100);

    if (x0 > 6*width/8) {
      step++;
      time = millis();
    }
  }

  if (step == 3) {
    textAlign(CENTER);
    fill(0);
    text("Hash", 6*width/8, height/5);
    text("5", 6*width/8, height/3);
    if (millis() - time > 2000) {
      rect(x1, y1, 20, 20);

      Ani.to(this, 10, "x1", 6*width/10 + 5*width/20 - 10);
      Ani.to(this, 10, "y1", 7*height/8 + 80);

      if (x1 >= 6*width/10 + width/20 && y1 >= 7*height/8 - 10) {
        step++;
        time = millis();
      }
    }
  }

  //placing ellipse
  if (step == 4) {
    rectMode(CENTER);
    fill(0);

    rect(6*width/10 + width/20, 7*height/8 - 10, 20, 20);

    ellipseMode(CENTER);
    ellipse(x2, y2, 20, 20);

    Ani.to(this, 10, "x2", 3*width/8);
    Ani.to(this, 10, "y2", height/3 + 20);
    if (x2 <= 3*width/8 + 10 && y2 >= height/5 - 10) {
      step++;
      time = millis();
    }
  }

  if (step == 5) {
    fill(0);
    rect(6*width/10 + width/20, 7*height/8 - 10, 20, 20);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 6) {
    fill(0);
    rect(6*width/10 + width/20, 7*height/8 - 10, 20, 20);
    textAlign(CENTER);
    text("3", x3, y3);
    text("Hash", 6*width/8, height/5);
    Ani.to(this, 10, "x3", 6*width/8 + 100);

    if (x3 > 6*width/8) {
      step++;
      time = millis();
    }
  }

  if (step == 7) {
    fill(0);
    rect(6*width/10 + width/20, 7*height/8 - 10, 20, 20);
    textAlign(CENTER);
    text("3", 6*width/8, height/3);

    if (millis() - time > 2000) {
      ellipse(x4, y4, 20, 20);

      Ani.to(this, 10, "x4", 4*width/10 + 5*width/20 - 15);
      Ani.to(this, 10, "y4", 7*height/8 + 80);

      if (x4 >= 4*width/10 + width/20 - 10 && y4 >= 7*height/8 - 10) {
        step++;
        time = millis();
      }
    }
  }

  //search ellipse
  if (step == 8) {
    rect(6*width/10 + width/20, 7*height/8 - 10, 20, 20);
    ellipse(4*width/10 + width/20, 7*height/8 - 10, 20, 20);

    fill(0);
    ellipseMode(CENTER);
    ellipse(x5, y5, 40, 20);
    Ani.to(this, 10, "x5", 3*width/8);
    Ani.to(this, 10, "y5", height/3 + 20);
    if (x5 <= 3*width/8 + 10 && y5 >= height/5 - 10) {
      step++;
      time = millis();
    }
  }

  if (step == 9) {
    fill(0);
    rect(6*width/10 + width/20, 7*height/8 - 10, 20, 20);
    ellipse(4*width/10 + width/20, 7*height/8 - 10, 20, 20);

    textAlign(CENTER);
    text("Hashing", 3*width/8, height/3);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 10) {
    rect(6*width/10 + width/20, 7*height/8 - 10, 20, 20);
    ellipse(4*width/10 + width/20, 7*height/8 - 10, 20, 20);
    textAlign(CENTER);
    fill(0);
    text("7", x6, y6);
    Ani.to(this, 10, "x6", 6*width/8 + 100);

    if (x6 > 6*width/8) {
      step++;
      time = millis();
    }
  }

  if (step == 11) {
    fill(0);
    rect(6*width/10 + width/20, 7*height/8 - 10, 20, 20);
    ellipse(4*width/10 + width/20, 7*height/8 - 10, 20, 20);
    text("7", 6*width/8, height/3);

    ellipseMode(CENTER);
    ellipse(3*width/8, height/3 + 75 + 15, 40, 20);
    if (millis() - time > 1000) {
      line(3*width/8, height/3 + 75 + 15, 8*width/10 + width/20, 7*height/8 - width/20);
      if (millis() - time > 3000) {
        stroke(255);
        line(3*width/8, height/3 + 75 + 15, 8*width/10 + width/20, 7*height/8 - width/20);
        stroke(252, 0, 0);
        line(3*width/8, height/3 + 75 + 15, 8*width/10 + width/20, 7*height/8 - width/20);
        stroke(0);
        if (millis() - time > 6000) {
          step++;
          time = millis();
        }
      }
    }
  }

  //searching circle
  if (step == 12) {
    rect(6*width/10 + width/20, 7*height/8 - 10, 20, 20);
    ellipse(4*width/10 + width/20, 7*height/8 - 10, 20, 20);

    fill(0);
    ellipseMode(CENTER);
    ellipse(x7, y7, 20, 20);
    Ani.to(this, 10, "x7", 3*width/8);
    Ani.to(this, 10, "y7", height/3 + 20);
    if (x7 <= 3*width/8 + 10 && y7 >= height/5 - 10) {
      step++;
      time = millis();
    }
  }

  if (step == 13) {
    fill(0);
    rect(6*width/10 + width/20, 7*height/8 - 10, 20, 20);
    ellipse(4*width/10 + width/20, 7*height/8 - 10, 20, 20);

    textAlign(CENTER);
    text("Hashing", 3*width/8, height/3);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 14) {
    rect(6*width/10 + width/20, 7*height/8 - 10, 20, 20);
    ellipse(4*width/10 + width/20, 7*height/8 - 10, 20, 20);
    textAlign(CENTER);
    fill(0);
    text("3", x8, y8);
    Ani.to(this, 10, "x8", 6*width/8 + 100);

    if (x8 > 6*width/8) {
      step++;
      time = millis();
    }
  }

  if (step == 15) {
    fill(0);
    rect(6*width/10 + width/20, 7*height/8 - 10, 20, 20);
    ellipse(4*width/10 + width/20, 7*height/8 - 10, 20, 20);
    text("3", 6*width/8, height/3);

    ellipseMode(CENTER);
    ellipse(3*width/8, height/3 + 75 + 15, 20, 20);
    if (millis() - time > 1000) {
      line(3*width/8, height/3 + 75 + 15, 4*width/10 + width/20, 7*height/8 - width/20);
      if (millis() - time > 3000) {
        stroke(255);
        line(3*width/8, height/3 + 75 + 15, 4*width/10 + width/20, 7*height/8 - width/20);
        stroke(0, 252, 0);
        line(3*width/8, height/3 + 75 + 15, 4*width/10 + width/20, 7*height/8 - width/20);
        stroke(0);
        if (millis() - time > 6000) {
          step = 0;
          time = millis();
          reset();
        }
      }
    }
  }

  fill(255);
  rectMode(CENTER);
  rect(3*width/8, height/3, 150, 150);
  line(width/10, 7*height/8, 9*width/10, 7*height/8);

  if (step != 5 && step != 1 && step != 9) {
    textAlign(CENTER);
    fill(0);  
    text("Hash", 3*width/8, height/3 - 10);
    text("Machine", 3*width/8, height/3 + 10);
  }
  else {
    fill(0);
    text("Hashing", 3*width/8, height/3);
  }

  text("Hash", 6*width/8, height/5);
}

void reset() {
  x = width/2;
  y = 10;
  x1 = 3*width/8;
  y1 = height/3 + 75;
  x0 = 3*width/8 + 75 + 10;
  y0 = height/3;
  x2 = width/2;
  y2 = 10;
  x3 = 3*width/8 + 75 + 10;
  y3 = height/3;
  x4 = 3*width/8;
  y4 = height/3 + 75;
  x5 = width/2;
  y5 = 10;
  x6 = 3*width/8 + 75;
  y6 = height/3;
  x7 = width/2;
  y7 = 10;
  x8 = 3*width/8 + 75 + 10;
  y8 = height/3;
}



