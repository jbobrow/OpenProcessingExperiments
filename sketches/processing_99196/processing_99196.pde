
PFont f;
long time;
int step = 0;

void setup() {
  size(500, 300);
  background(255);
  f = createFont("Arial", 40, true);
  time = millis();
}

void draw() {
  background(255);

  textFont(f);
  textAlign(CENTER);
  fill(0, 0, 255);
  for (int i = 0; i < 8; i++) {
    text(i + "", (i+1)*width/10, 6*height/8);
  }
  text("9", 9*width/10, 6*height/8);

  if (step >= 0 && step <= 6) {
    if (step == 6) {
      fill(0, 255, 0);
      text("Searching for 2", width/2, 1.5*height/8);
      text("Found", width/2, 2.5*height/8);
      fill(0, 0, 255);
    }
    else {
      text("Searching for 2", width/2, 1.5*height/8);
    }
  }
  else {
    if (step == 12) {
      fill(255, 0, 0);
      text("Searching for 8", width/2, 1.5*height/8);
      text("Not Found", width/2, 2.5*height/8);
      fill(0, 0, 255);
    }
    else {
      text("Searching for 8", width/2, 1.5*height/8);
    }
  }

  if (step == 0) {
    text("2", width/2, 5*height/8);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 1) {
    text("2", 5*width/10, 5*height/8);
    text("2", 4*width/10, 4*height/8);
    text("<", 5*width/10, 4*height/8);
    text("4", 6*width/10, 4*height/8);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 2) {
    text("2", 2*width/10, 5*height/8);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 3) {
    text("2", 2*width/10, 5*height/8);
    text("<", 2*width/10, 4*height/8);
    text("2", 3*width/10, 4*height/8);
    text("1", 1*width/10, 4*height/8);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 4) {
    text("2", 3*width/10, 5*height/8);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 5) {
    text("2", 3*width/10, 5*height/8);
    text("=", 3*width/10, 4*height/8);
    text("2", 4*width/10, 4*height/8);
    text("2", 2*width/10, 4*height/8);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 6) {
    fill(0, 255, 0);
    text("2", 3*width/10, 5*height/8);
    text("2", 3*width/10, 6*height/8);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 7) {
    text("8", width/2, 5*height/8);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 8) {
    text("8", 5*width/10, 5*height/8);
    text("8", 4*width/10, 4*height/8);
    text(">", 5*width/10, 4*height/8);
    text("4", 6*width/10, 4*height/8);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 9) {
    text("8", 8*width/10, 5*height/8);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 10) {
    text("8", 8*width/10, 5*height/8);
    text("<", 8*width/10, 4*height/8);
    text("8", 9*width/10, 4*height/8);
    text("7", 7*width/10, 4*height/8);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 11) {
    text("8", 9*width/10, 5*height/8);
    if (millis() - time > 2000) {
      step++;
      time = millis();
    }
  }

  if (step == 12) {
    fill(255, 0, 0);
    text("8", 9*width/10, 5*height/8);
    text("9", 9*width/10, 6*height/8);
    if (millis() - time > 2000) {
      step=0;
      time = millis();
    }
  }
}



