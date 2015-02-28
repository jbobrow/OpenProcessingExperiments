
class Face {
  float x;
  float y;
  float eyesize;
  float facescale;

  Face(float initx) {
    x = initx;
    y = random(height);
    eyesize = random(80) + 20;
    facescale = 0.1;
  } 

  void drawFace() {
    pushMatrix();
    // move to the center of canvas:
    translate(x, y);
    scale(facescale);
    // paint in white:
    fill(255);
    // head:
    ellipse(0, 0, 300, 300);        
    // paint in black:
    fill(0);
    // mouth
    rect(-100, 50, 200, 20);
    // nose
    line(0, 0, 0, 20);
    // eyes
    ellipse(-70, -50, eyesize, eyesize);
    ellipse( 70, -50, eyesize, eyesize);
    popMatrix();
  }

  void move(float amount) {
    x = x + random(-amount, amount);
    y = y + random(-amount, amount);

    if (x > width || x < 0) {
      x = random(width);
    }
    if (y > height) {
      y -= height;
    } 
    else if (y < 0) {
      y += height;
    }
  }
}

class Stroke {
  Face[] myfaces;
  int numfaces = 400;
  int drawfaces = 0;
  float x = 0;
  float y = 0;

  Stroke() {
    myfaces = new Face[numfaces];
    for (int i=0; i < numfaces; i++) {
      myfaces[i] = new Face(i*4);
    }
  }

  void drag() {
    if (drawfaces < numfaces) {
      myfaces[drawfaces].x = mouseX;
      myfaces[drawfaces].y = mouseY;
      drawfaces++;
    }
  }

  void draw() {
    x = x + random(-1, 1);
    y = y + random(-1, 1);
    
    pushMatrix();
    translate(x, y);
    for (int i=0; i < drawfaces; i++) {
      myfaces[i].move(0.1);
      myfaces[i].drawFace();
    }
    popMatrix();
  }
};

Stroke[] mystrokes;
int numstrokes = 10;
int drawstrokes = 0;

void setup() {
  size(400, 400);

  mystrokes = new Stroke[numstrokes];
  for (int i=0; i < numstrokes; i++) {
    mystrokes[i] = new Stroke();
  }
}

void mouseDragged() {
  mystrokes[drawstrokes-1].drag();
}

void mousePressed() {
  if (drawstrokes < numstrokes) {
    drawstrokes++;
  }
}

void draw() {
  background(200);
  for (int i=0; i < drawstrokes; i++) {
    mystrokes[i].draw();
  }
}
