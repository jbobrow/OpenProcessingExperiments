
int statusBarHeight = 30;
int canvasHeight = 0;

PImage bgMovement;
PFont font;

CADyn ca; 

void setup() {
  size(640, 480, P2D);
  frameRate(30);
  background(0);
  noStroke();
  font = loadFont("TrebuchetMS-Bold-12.vlw");
  textFont(font, 12);
  int[] ruleset = {0,1,0,1,1,0,1,0};
  ca = new CADyn(ruleset);
}

void draw() {
  ca.printRule();
  ca.generate();
}

void mousePressed() {
  ca.randomizeRule();
}

void keyPressed() {
  ca.changeRuleSpot(int(key) - 48);
}

class CADyn {
  int[] cells;
  int generation;

  int[] rule;
  
  CADyn(int[] r) {
    rule = r;
    cells = new int[width];
    start();
  }
  
  void randomizeRule() {
    for (int i = 0; i < 8; i++) {
      rule[i] = int(random(2));
    }
  }
  
  void changeRuleSpot(int i) {
    if (i > 0 && i < 9) rule[i - 1] = (rule[i - 1] + 1) % 2;
  }
  
  void printRule() {
    String rule2Print = "";
    noStroke();
    fill(255);
    rect(0, canvasHeight + 1, width, statusBarHeight);
    fill(0);
    for (int i = 0; i < 8; i++) {
      rule2Print += nf(rule[i] , 1) + " ";
    }
    text(rule2Print, 10, canvasHeight + 20);
  }
  
  void toggleRuleItem(int i) {
    rule[i] = (rule[i] + 1) % 2;
  }
  
  void start() {
    canvasHeight = height - statusBarHeight;
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;
    generation = 0;
    renderCells();
  }
  
  void generate() {
    int[] nextgen = new int[cells.length];
    for (int i = 1; i < cells.length-1; i++) {
      int left = cells[i-1];
      int me = cells[i];
      int right = cells[i+1];
      nextgen[i] = rules(left,me,right);
    }
    cells = (int[]) nextgen.clone();
    renderCells();
  }
  
  void renderCells() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) {
        fill(255);
      } else {
        fill(0);
      }
      rect(i, generation, 1, 1);
    }
    generation++;
    if (generation > canvasHeight) {
      bgMovement = get(0, 1, width, canvasHeight);
      image(bgMovement, 0, 0);
      generation--;
    }
  }

  int rules (int a, int b, int c) {
    if (a == 1 && b == 1 && c == 1) return rule[0];
    if (a == 1 && b == 1 && c == 0) return rule[1];
    if (a == 1 && b == 0 && c == 1) return rule[2];
    if (a == 1 && b == 0 && c == 0) return rule[3];
    if (a == 0 && b == 1 && c == 1) return rule[4];
    if (a == 0 && b == 1 && c == 0) return rule[5];
    if (a == 0 && b == 0 && c == 1) return rule[6];
    if (a == 0 && b == 0 && c == 0) return rule[7];
    return 0;
  }

}

