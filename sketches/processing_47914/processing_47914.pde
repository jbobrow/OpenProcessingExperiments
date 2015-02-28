
class CA {
  int ca_width;    // the width
  int ca_height;   // height of the ca
  int[] cells;     // An array of 0s and 1s 
  int position;    // position of the scanline
  int scl;         // How many pixels wide/high is each cell?
  int num_start;   // How many positions are initially set to 1
  int[] rules;     // An array to store the ruleset, for example {0,1,1,0,1,1,0,1}

  CA(int caw, int cah, int[] r, int cs, int ns) {
    this.ca_width = caw;
    this.ca_height = cah;
    this.rules = r;
    this.scl = cs;
    this.num_start = ns;
    this.cells = new int[ca_width/scl];
    this.position = ca_height-scl;
    restart(num_start);
  }

  // Set the rules of the CA
  void setRules(int[] r) {
    rules = r;
  }

  void restart(int num) {
    this.num_start = num;
    // reset cells to 0
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    
    // if only 1 position is set to 1 place it at half width of ca else distribute randomly
    if (num == 1) {
      cells[cells.length/2] = 1;
    }
    else {
      int cnt=0;
      while (cnt<num) {
        int prop =  floor(random(cells.length));
        if (cells[prop] == 0) {
          cells[prop] = 1;
          cnt++;
        }
      }
    }
  }

  // The process of creating the new generation
  void generate() {
    // First we create an empty array for the new values
    int[] nextgen = new int[cells.length];
    // For every spot, determine new state by examing current state, and neighbor states
    // Ignore edges that only have one neighor
    for (int i = 1; i < cells.length-1; i++) {
      int left = cells[i-1];               // Left neighbor state
      int me = cells[i];                   // Current state
      int right = cells[i+1];              // Right neighbor state
      nextgen[i] = rules(left, me, right); // Compute next generation state based on ruleset
    }
    // Copy the array into current value
    cells = (int[]) nextgen.clone();
  }

  // Draw the cells, fill 255 for '1', fill 0 for '0'
  void render() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) fill(255); //white
      else               fill(0);   //black
      noStroke();
      rect(i*scl, position, scl, scl);
    }
  }

    // Implementing the Wolfram rules
    int rules (int a, int b, int c) {
    if (a == 1 && b == 1 && c == 1) return rules[0];
    if (a == 1 && b == 1 && c == 0) return rules[1];
    if (a == 1 && b == 0 && c == 1) return rules[2];
    if (a == 1 && b == 0 && c == 0) return rules[3];
    if (a == 0 && b == 1 && c == 1) return rules[4];
    if (a == 0 && b == 1 && c == 0) return rules[5];
    if (a == 0 && b == 0 && c == 1) return rules[6];
    if (a == 0 && b == 0 && c == 0) return rules[7];
    return 0;
  }

  // print current ruleset as decimal number
  String getInfo() {
    String info="";
    for (int i=0;i<ca.rules.length;i++) {
      info+= str(ca.rules[i]);
    }
    return ("number: " + unbinary(info) + " initial cells: " + num_start);
  }
}


