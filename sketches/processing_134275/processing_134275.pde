
int d=0;
Leaf leaf;
Leaf leaves[]; 

void setup() {
  size(400, 400);
  frameRate(30);
  leaves = new Leaf[20];
  for (int i = 0; i< leaves.length;i++) {
    leaves[i] = new Leaf(int(random(width)), int(random(height)), 20);
  }
}

void draw() {
  background(255);
  for (int i = 0; i< leaves.length;i++) {
    leaves[i].update();
    leaves[i].display();
  }
}
class Leaf {
  int d;
  int xPos;
  int yPos;
  int maxSize; 
  int startSleep;
  int sleepFor = 30;
  boolean isShrinking;
  Leaf(int tempX, int tempY, int tempSize) {
    d=0;
    xPos=tempX;
    yPos=tempY;
    maxSize = tempSize;
  }

  void update() {

    if (frameCount > startSleep + sleepFor) {
      if (d < maxSize) {
        d++;
      }
    }
    
    if (isShrinking) {
      if (d>1) {
      d = d/2-1;
      }
      else {
        isShrinking=false;
        reset();
      }
    }
    if (overCircle(xPos, yPos, d)) {
      isShrinking = true;
    }
  }

  void display() {
//    xPos = xPos+int(random(-2,2));
//    yPos = yPos+int(random(-2,2));
    ellipse(xPos,yPos, d, d);
  }

  void reset() {
    d=1;
    startSleep = frameCount;
  }

  boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } 
    else {
      return false;
    }
  }
}

