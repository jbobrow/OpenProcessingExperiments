
// Nature of Code Ch7 Cellular Automata

Vehicle[]  boxes;
ListManager listManager;
int[] ruleSet;
int num, spacing;

void setup() {
  size(1100, 300);
  listManager = new ListManager();
  spacing = 10;
  num = 11;
  boxes = new Vehicle[num];
  

  for (int i = 0; i < num; i++) {
    ruleSet = listManager.nextFromList();
    boxes[i] = new Vehicle(spacing, 50, ruleSet);
    spacing += 100;
  }
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(1);
  line(0, 252, width, 252);
  for (Vehicle b : boxes) {
    b.run();
  }
}

class CA {
  // variables for the automaton structure
  int cellSize, autoCol, autoRow, autoWidth, autoHeight;
  int[][] automaton;   
  PGraphics p;  

  CA() {
    cellSize = 1;
    autoWidth = 51;
    autoHeight = 200;
    automaton = new int[autoHeight][autoWidth];
    buildAutoMatrix();
    p = createGraphics(50, 200);
  }

  // create 2D array of zero's
  void buildAutoMatrix() {
    for (int row = 0; row < autoHeight; row++) { 
      for (int col = 0; col < autoWidth; col++) {
        automaton[row][col] = 0;
      }
    }
  }

  // use ruleset argument to build the automaton structure
  void calcAutoMatrix(int[] rSet) {

    autoRow = 0; // start from gen zero
    automaton[autoRow][autoWidth/2 +1] = 1;  // prime gen zero(the top row)

    // transfers to 1 row ahead(the next gen), so reduce autoHeight by 1
    for (int i = 0; i < autoHeight-1; i++) { // row

      // calc the next row/gen
      int[] nextRow = new int[autoWidth];
      for (int j = 1; j < nextRow.length-1; j++) { // ignore ends
        int left = automaton[autoRow][j-1];   
        int me = automaton[autoRow][j];       
        int right = automaton[autoRow][j+1];  
        nextRow[j] = rules(left, me, right, rSet);
      }

      // transfer calculated row to next gen. 2D array row
      autoRow++;
      for (int n = 0; n < nextRow.length; n++) {
        automaton[autoRow][n] = nextRow[n];
      }
    }
  }

  void makeGraphic() {
    p.beginDraw();
    p.fill(90);
    p.noStroke();
    for (int row = 0; row < autoHeight; row++) { 
      for (int col = 0; col < autoWidth; col++) {
        if (automaton[row][col] == 1 ) {
          p.rect(col*cellSize, row*cellSize, cellSize, cellSize);
          p.endDraw();
        }
      }
    }
  }

  void displayGraphic() {
    image(p, 0, 0);
  }

  // apply ruleset, used in 'calcAutoMatrix'
  int rules (int a, int b, int c, int[] set) {
    int[] ruleSet = set;
    String s = "" + a + b + c;
    int index = unbinary(s);
    return ruleSet[index];
  }
}

class ListManager {
  int listPos;
  int[] ruleSet;
  int[] ruleList = {
    105, 109, 129, 137, 149, 151, 153, 169, 181, 183, 225
  };

  ListManager() {
    ruleSet = new int[8];
    listPos = 0;
  }

  int[]  nextFromList() {
    String s = binary(ruleList[listPos], 8);
    for (int i = 0; i < 8; i++) { 
      char temp = s.charAt(i);
      // cull ascii code when in JavaMode
      int n = 0;       
      if (temp == 49 || temp == 1)  n = 1;
      ruleSet[i] = n;
    }
    ruleSet = reverse(ruleSet);
    listPos++;
    return ruleSet;
  }
}

class Vehicle {
  VehicleDraw vehDraw;
  PVector accel, vel, pos, move;

  Vehicle(int x, int y, int[] rSet) {
    accel = new PVector(0, 0);
    vel = new PVector(0, 0);
    pos = new PVector(x, y); 
    move = new PVector(1, 0);
    move.mult(.7);
    applyForce(move);
    vehDraw = new  VehicleDraw(rSet);
  }

  void applyForce(PVector f) {
    accel.add(f);
  }

  void update() {
    vel.add(accel);
    pos.add(vel);
    accel.mult(0);
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    vehDraw.display();
    popMatrix();
  }

  void boundsCheck() {
    if ((pos.x > width-53 ) || (pos.x < 1 )) {
      vel.x = vel.x * -1;
    }
  }

  void run() {
    update();
    boundsCheck();
    display();
  }
}

// this could be included as part of Vehicle  
class VehicleDraw {
  CA ca; 

  VehicleDraw(int[] rules) {
    ca = new CA();
    ruleSet = rules;
    ca.calcAutoMatrix(ruleSet);
    ca.makeGraphic();
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    noFill();
    rect(-2, -1, 54, 202); // slightly clear 
    ca.displayGraphic();
  }
}



