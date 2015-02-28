
ArrayList<Integer[]> orgPts;
ArrayList<Integer[]> newPts;
ArrayList<Integer> phase;

boolean isDraw;
boolean isWipe;

void setup () {
  size (600, 600);
  background (0);
  stroke (255);  

  orgPts = new ArrayList<Integer[]>();
  newPts = new ArrayList<Integer[]>();
  phase = new ArrayList<Integer>();

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
        float dis = width/2 - orgPts.get(i)[0];
        float newVal = map (sin(radians(phase.get(i))), -1.0, 1.0, width/2.0 - dis, width/2.0 + dis);
        Integer[] newPair = {
          (int)newVal, newPts.get(i)[1]
        };

        newPts.set(i, newPair);
        phase.set(i, phase.get(i) + 1);
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
    phase = new ArrayList<Integer>();

    isDraw = false;
    isWipe = true;
  }
  if (key == 's' || key == 'S') {
    save ("screenie.png");
  }
}

void addPt (int x, int y) {
  Integer temp[] = {
    x, y
  };

  orgPts.add (temp);
  newPts.add (temp);
  phase.add (new Integer(-90));
}


