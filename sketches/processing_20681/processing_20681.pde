
ArrayList<Integer[]> orgPts;
ArrayList<Integer[]> newPts;
ArrayList<Integer> phaseX;
ArrayList<Integer> phaseY;

int xPhase;
int yPhase;

boolean isDraw;
boolean isWipe;

void setup () {
  size (600, 600);
  background (0);
  stroke (255);  

  orgPts = new ArrayList<Integer[]>();
  newPts = new ArrayList<Integer[]>();
  phaseX = new ArrayList<Integer>();
  phaseY = new ArrayList<Integer>();

  xPhase = 1;
  yPhase = 0;

  isDraw = false;
  isWipe = true;
}

void draw () {
  if (isWipe)
    background (0);

  if (isDraw) {
    addPt (mouseX, mouseY);
  }

  if (newPts.size() > 1) {
    for (int i = 0; i < newPts.size() - 1; i++) {
      if (newPts.get(i+1)[0] == -1) {
        i++;
      }
      else {
        line (newPts.get(i)[0],newPts.get(i)[1],newPts.get(i+1)[0],newPts.get(i+1)[1]);
      }
    }

    for (int i = 0; i < newPts.size(); i++) {
      if (newPts.get(i)[0] != -1) {
        float disX = width/2 - orgPts.get(i)[0];
        float disY = height/2 - orgPts.get(i)[1];
        float newX = map (sin(radians(phaseX.get(i))), -1.0, 1.0, width/2.0 - disX, width/2.0 + disX);
        float newY = map (sin(radians(phaseY.get(i))), -1.0, 1.0, height/2.0 - disY, height/2.0 + disY);
        Integer[] newPair = {
          (int)newX, (int)newY
        };

        newPts.set(i, newPair);
        phaseX.set(i, phaseX.get(i) + xPhase);
        phaseY.set(i, phaseY.get(i) + yPhase);
      }
    }
  }
}

void mousePressed () {
  isDraw = true;
}
void mouseReleased () {
  isDraw = false;
  addPt (-1, -1);
}
void keyReleased () {
  if (key == 't' || key == 'T')
    isWipe = !isWipe;
  if (key == 'c' || key == 'C') {
    orgPts = new ArrayList<Integer[]>();
    newPts = new ArrayList<Integer[]>();
    phaseX = new ArrayList<Integer>();
    phaseY = new ArrayList<Integer>();

    isDraw = false;
    isWipe = true;
  }
  if (key == 's' || key == 'S') {
    save ("screenie.png");
  }
  
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        yPhase ++;
        break;
      case DOWN:
        yPhase --;
        break;
      case LEFT:
        xPhase --;
        break;
      case RIGHT:
        xPhase ++;
        break;
    } 
  }
}

void addPt (int x, int y) {
  Integer temp[] = {
    x, y
  };

  orgPts.add (temp);
  newPts.add (temp);
  phaseX.add (new Integer(-90));
  phaseY.add (new Integer(-90));
}


