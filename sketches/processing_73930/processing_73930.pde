
PFont font;
PImage frame, frame1, frame2, frame3, frame4, frame5, frame6;
int currentmillis = millis();
Blah[] words = new Blah[5];
int count = 0;

void setup() {
  size(500, 400);
  font = createFont("Arial", 16);
  frame1 = loadImage("http://i.imgur.com/1s7Fn.png");
  frame2 = loadImage("http://i.imgur.com/OfXTF.png");
  frame3 = loadImage("http://i.imgur.com/JFcXP.png");
  frame4 = loadImage("http://i.imgur.com/V4lDx.png");
  frame5 = loadImage("http://i.imgur.com/B29EF.png");
  frame6 = loadImage("http://i.imgur.com/fWlB2.png");
  smooth();
}

void draw() {
  background(255, 255, 160);
  drawMad();
  drawBlah();
}

void drawMad() {
  //added a little delay so first frame is visible
  if (millis() < currentmillis +1000) frame = frame1;
  else if (millis() < currentmillis +2000) frame = frame2;
  else if (millis() < currentmillis +3000) frame = frame3;
  else if (millis() < currentmillis +4000) frame = frame4;
  else if (millis() < currentmillis +5000) frame = frame5;
  else frame = frame6;
  image(frame, 70, 100);
}

void mousePressed () {
  currentmillis = millis();
  count = 0;
}

void drawBlah() {
  if (millis() < currentmillis + 5000) {
    for (int i = 0; i < 5; i++) {
      words[i] = new Blah(random(16, 40), random(-1, 1), random(-1, 1), 
      random(200, 400), random(80, 130));
    }
    for (int i = 0; i < 5; i++) {
      words[i].display();
    }
  }
  else {
    for (int i = 0; i < 5; i++) {
      words[i].explode();
    }
  }
}


class Blah {
  float v;
  float siz, xpos, ypos;
  float sx, sy;

  Blah(float s, float spinx, float spiny, float x, float y) {
    siz = s;
    sx = spinx;
    sy = spiny;
    xpos = x;
    ypos = y;
  }

  void explode() {
    pushMatrix();
    translate(xpos + sx, ypos + sy);
    rotate(frameCount*0.1);
    textFont(font, siz);
    text("Blah", 0, 0);
    sx *= 1.2;
    sy *= 1.2;
    popMatrix();
  }

  void display() {
    fill(100, 0, 0);
    textFont(font, siz);
    text("Blah", xpos, ypos);
  }
}
