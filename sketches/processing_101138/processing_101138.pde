
BoxelStrip[] boxelStrips = new BoxelStrip[15];
displayController displayController = new displayController();

void setup() {
  size(400, 600);
  background(255);
  for (int i = 0; i < boxelStrips.length; i++) {
    boxelStrips[i] = new BoxelStrip(int(random(5,15)), i * 40);
  }
}

void draw() {
  displayController.randomChaser();
}

class displayController {
    int bIndex;
    int sIndex;
    displayController () {
        bIndex = 0;
        sIndex = 0;
    }

    void randomChaser() {
        if (sIndex < boxelStrips.length) {
            boxelStrips[sIndex].chase();
        }
        else {
            sIndex = 0;
        }
    }
}

class BoxelStrip {
  int numBoxels;
  Boxel[] strip;
  int stripYpos;
  float bWidth;

  BoxelStrip(int tempNumBoxels, int tempStripYpos) {
    numBoxels = tempNumBoxels;
    stripYpos = tempStripYpos;
    bWidth = width/numBoxels;
    build(numBoxels, stripYpos);
  }

  void build(int tempNumBoxels, int tempStripYpos) {
    numBoxels = tempNumBoxels;
    stripYpos = tempStripYpos;
    strip = new Boxel[numBoxels];    
    for (int i = 0; i < numBoxels; i++) {
      strip[i] = new Boxel(bWidth, 40, (bWidth * i), stripYpos, color(255, 0, 255));
    }
  }

  void display() {
    for (int i = 0; i < strip.length; i++) {
      strip[i].display();
      
    }
  }

  void chase() {
    if (displayController.bIndex < strip.length) {
      strip[displayController.bIndex].randomizeColor();
      strip[displayController.bIndex].display();
      displayController.bIndex++;
    }
    else {
      displayController.bIndex = 0;
      displayController.sIndex++;
    }
  }

  void oneRandom() {
    strip[int(random(strip.length))].randomizeColor();
  }

  void randomizeColors() {
    for (int i = 0; i < strip.length; i++) {
      strip[i].randomizeColor();
    }
  }
}

class Boxel {
  float xsize;
  int ysize;
  float xpos;
  int ypos;
  color c;
  
  Boxel(float tempXsize, int tempYsize, float tempXpos, int tempYpos, color tempC) {
    xsize = tempXsize;
    ysize = tempYsize;
    xpos = tempXpos;
    ypos = tempYpos;
    c = tempC;
  }
  
  void randomizeColor() {
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    c = color(r, g, b);
  }

  void display() {
    fill(c);
    noStroke();
    rect(xpos, ypos, xsize, ysize);
  }
}
