
PFont font;
int ypos;
int xpos;
int degree;
int gray;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  font = createFont("CalistoMT-Italic-30.vlw", 20);
}

void draw() {
  background(0);
  fill(255);
  textFont(font);
  textAlign(CENTER);
  text("What do people see when they look at me?", width/2, 30);
  outer();
  inner();
  summary();
}

void outer() {
  float time = millis()/1000;
  if (time > 2) {
    text("They see someone...", width/2, 60);
  }
  if (time > 4) {
    if (xpos <= 200) {
      xpos += 5;
    }
    text("who is silent.", xpos, 90);
  }
  if (time > 6) {
    text("who seems uninterested.", width/2, 120);
  }
  if (time > 8) {
    if (ypos <= 145) {
      ypos += 5;
    }
    text("who is a loner.", width/2, ypos);
  }
  if (time > 10) {
    if (gray <= 250 && gray != 255) {
      gray += 2;
    }
    fill(gray);
    text("who is constantly nervous.", width/2, 180);
  }
  if (time > 12) {
    text("who is constantly nervous.", width/2, 210);
  }
  if (time > 14) {
    text("nervous.", width/2, 240);
  }
  if (time > 16) {
    text("nervous.", width/2, 270);
  }
  if (time > 18) {
    textSize(30);
    text("nervous.", width/2, 300);
  }
  if (time > 20) {
    textSize(20);
    text("Well, that last one is pretty accurate.", width/2, 330);
  }
  if (time > 22) {
    text("But that's not who I want them to see.", width/2, 360);
  }
  if (time > 25) {
    background(0);
  }
}

void inner() {
  float time = millis()/1000;
  if (time > 27) {
    text("The real me? The real Demetri?", width/2, 30);
  }
  if (time > 30) {
    text("He's talkative.", width/2, 60);
  }
  if (time > 32) {
    pushMatrix();
    translate(width/2, 90);
    if (degree != 360) {
      degree += 5;
    }
    rotate(radians(degree));
    text("His mind is constantly turning.", 0, 0);
    popMatrix();
  }
  if (time > 35) {
    text("He's funny.", width/2, 120);
  }
  if (time > 37) {
    pushMatrix();
    translate(width/2, 140);
    scale(0.75);
    text("Or at least he tries to be.", 0, 0);
    popMatrix();
  }
  if (time > 39) {
    pushMatrix();
    translate(width/2, 170);
    fill(255, 204, 0);
    scale(1.0);
    text("He's caring and has a warm heart.", 0, 0);
    popMatrix();
  }
  if (time > 41) {
    pushMatrix();
    translate(width/2, 1200);
    scale(0.75);
    fill(gray);
    text("But sadly, he doesn't get to show it often.", 0, 0);
    popMatrix();
  }
  if (time > 43) {
    background(0);
  }
}

void summary() {
  float time = millis()/1000;
  if (time > 45) {
    text("Here is the big problem, though.", width/2, 30);
  }
  if (time > 47) {
    pushMatrix();
    translate(25, 80);
    scale(2.5);
    textAlign(LEFT);
    text("OUTER", 0, 0);
    popMatrix();

    pushMatrix();
    translate(350, 70);
    scale(1.0);
    textAlign(RIGHT);
    text("INNER", 0, 0);
    popMatrix();
  }
  if (time > 49) {
    textAlign(CENTER);
    text("One of these is bigger than the other.", width/2, 110);
  }
  if (time > 51) {
    text("People will just largely see the outer qualities.", width/2, 140);
  }
  if (time > 53) {
    text("Maybe one day, this is what they'll see.", width/2, 170);
  }
  if (time > 55) {
    pushMatrix();
    translate(25, 250);
    scale(2.5);
    textAlign(LEFT);
    text("INNER", 0, 0);
    popMatrix();

    pushMatrix();
    translate(350, 250);
    scale(1.0);
    textAlign(RIGHT);
    text("OUTER", 0, 0);
    popMatrix();
  }
}


