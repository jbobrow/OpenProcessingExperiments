
PImage background;
PFont font;
float xpos, ypos, xpos2, ypos2, textYPos = -10;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  frameRate(30);
  house1 = new House(300, 125, 100, 275);

  // The following three objects serve as components of the house rather than separate houses. 
  house2 = new House(325, 150, 50, 50); // Top window
  house3 = new House(325, 225, 50, 50); // Bottom window
  house4 = new House(325, 325, 50, 75); // Door

  // Image
  background = loadImage("Background.jpg");

  // Font
  font = loadFont("RemachineScript.ttf");
}

void draw() {
  float time = millis()/1000;
  image(background, 0, 0);
  fill(178, 34, 34);
  house1.build();
  fill(255);
  house2.build();
  house3.build();
  fill(139, 0, 0);
  house4.build();
  fill(218, 165, 32);
  ellipse(365, 365, 15, 15); // Doorknob

  // CHARACTER DRAWING
  fill(204);
  if (xpos <= 30) {
    xpos += 0.5;
  }
  ellipse(xpos, 375, 50, 50);

  for (int i = 0; i != 1; i++) {
    if (ypos <= 340) {
      ellipse(30, ypos, 20, 30);
      ypos += 5;
    }
    else {
      ellipse(30, ypos-15, 30, 30);
    }
  }
  if (time >= 6 && time <= 8) {
    fill(random(0, 255));
    text("What???", 10, 305);
  }
  
  if (time >= 20 && time <= 23) {
    fill(random(0, 255));
    text("Whew!", 10, 305);
  }
  
  if (time >= 25) {
    textFont(font, 60);
    fill(0);
    if (textYPos <= 50) {
      textYPos += 1;
    }
    text("The end!", 90, textYPos);
  }

  // FIRE DRAWING
  fire();

  // CLOUD DRAWING
  clouds();

  // RAINDROPS
  raindrops();

}


void fire() {
  float time = millis()/1000;
  if (time >= 3 && time <= 15) {
    for (int i = 0; i <= 5; i++) {
      stroke(255, random(70, 100), 0); // Gives the flames a random orange color.
      line(random(330, 370), random(150, 180), 350, 200);
    }
  }
  if (time >= 5 && time <= 15) {
    for (int i = 0; i <= 5; i++) {
      stroke(255, random(70, 100), 0);
      line(random(330, 380), random(225, 255), 350, 275);
    }
  }
}

void clouds() {
  float time = millis()/1000;
  fill(204);
  noStroke();
  if (time >= 8) {
    if (xpos2 <= 375) {
      xpos2 += 5;
    }
    ellipse(xpos2, 15, 50, 35);
    ellipse(xpos2-15, 15, 50, 40);
    ellipse(xpos2-30, 15, 50, 45);
    ellipse(xpos2-45, 15, 50, 40);
    ellipse(xpos2-60, 15, 50, 35);
  }
  if (time >= 19) {
    xpos2 += 5;
  }
}

void raindrops() {
  //ypos2 = 40;
  float time = millis()/1000;
  if (time >= 12 && time <= 17) {
    fill(0, 0, random(190, 255)); // Gives the raindrops a random blue color.
    if (ypos2 <= 450) {
      ypos2 += 15;
    }
    for (int i = 0; i <= 100; i++) {
      ellipse(random(325, 375), random(55, ypos2), 5, 45);
    }
  }
}

class House {
  int x, y, w, h;
  
  House (int xpos, int ypos, int wid, int hei) {
    x = xpos;
    y = ypos;
    w = wid;
    h = hei;
  }
  
  void build() {
    noStroke();
    rect(x, y, w, h);
  }
}



