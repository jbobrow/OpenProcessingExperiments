
class Index2D {
  int x;
  int y;
  //</textarea>
  Index2D(int x, int y) {
    this.x = x; this.y = y;
  }
};

class NvInput {
  float r;
  float c;
  float charge;
  float lastIn;
  Index2D fromElement;

  NvInput(float r, float c, float charge, Index2D fromElement) {
    this.r = r;
    this.c = c;
    this.charge = charge;
    lastIn = 0.0;
    this.fromElement = fromElement;
  }   
  
  float update() {
    this.charge *= 1.0 - pow(2.718, -1/(r * c));
    
    this.charge += Elements[fromElement.x][fromElement.y].output - lastIn;
    
    if (this.charge < 0)
      this.charge = 0;
      
    lastIn = Elements[fromElement.x][fromElement.y].output;
    
    return this.charge;
  }
}

class Element {
  int type;
  float output;

  NvInput[] inputCharges;

  Element(int type) {
    this.type = type;
    this.output = 0.0;
    this.inputCharges = new NvInput[0];
  }
  
  void addInput(Index2D input, float r, float c, float charge)
  {
    NvInput[] newInputCharges = new NvInput[this.inputCharges.length + 1];
    //System.arraycopy(this.inputCharges, 0, newInputCharges, 0, this.inputCharges.length); //System not supported in processingjs
    for(int i=0; i<this.inputCharges.length; i++){
        newInputCharges[i] = this.inputCharges[i];
    }
    newInputCharges[this.inputCharges.length] = new NvInput(r, c, charge, input);
    inputCharges = newInputCharges;
  }
  
  void updateInputs()
  {
    for (int i = 0; i < inputCharges.length; i++) {
      inputCharges[i].update();
    }
  }
  
  void updateOutputs()
  {
    float outputCharge = 0.0;
    
    if (type == 0) { // XOR
      outputCharge = 0.0;
      
      for (int i = 0; i < inputCharges.length; i++) {
        if ((inputCharges[i].charge > 2.5) ^ (outputCharge > 2.5)) {
          outputCharge = 5.0;
        } else {
          outputCharge = 0.0;
        }
      }
    } else if (type == 1) { // NOR
      outputCharge = 5.0;
      for (int i = 0; i < inputCharges.length; i++) {
        if (inputCharges[i].charge > 2.5)
          outputCharge = 0;
      }
    } else if (type == 2) { // NAND
      outputCharge = 0.0;
      for (int i = 0; i < inputCharges.length; i++) {
        if (inputCharges[i].charge < 2.5)
          outputCharge = 5.0;
      }
    } else if (type == 3) { // OR
      outputCharge = 0.0;
     for (int i = 0; i < inputCharges.length; i++) {
        if (inputCharges[i].charge > 2.5)
          outputCharge = 5.0;
      }
    } else if (type == 4) { // AND
      outputCharge = 0.0;
     for (int i = 0; i < inputCharges.length; i++) {
        if (inputCharges[i].charge < 2.5)
          outputCharge = 5.0;
      }
    } else {
      outputCharge = 0.0;
      for (int i = 0; i < inputCharges.length; i++) {
        outputCharge += inputCharges[i].charge;
      }
      
      outputCharge /= inputCharges.length;
    }
    
    this.output = outputCharge;
  }
};

int XOR = 0;
int NOR = 1;
int NAND = 2;
int OR = 3;
int AND = 4;

int SIZEW = 27;
int SIZEH = 27;
int DIST = 1;

Element[][] Elements = new Element[SIZEW][SIZEH];

void addConnection(int fromX, int fromY, int toX, int toY, float r, float c)
{
  Index2D to = new Index2D(toX, toY);
  
  Elements[fromX][fromY].addInput(to, r, c, 3.0);
}

void setup()
{
  size(SIZEW * 5, SIZEH * 5);

  int t = 0;
  
  for (int i = 0; i < SIZEW; i++) {
    for (int j = 0; j < SIZEH; j++) {
      t = (i * j) % 3 + 3;
      if (i > 48 && i < 52 && j > 48 && j < 52) t = 0;
      //if (t == NAND) t = NOR;

      Elements[i][j] = new Element(t);
    }
  }
  
  
  for (int i = 0; i < SIZEW; i++) {
    for (int j = 0; j < SIZEH; j++) {

      addConnection(i, j, ((i - DIST) + SIZEW) % SIZEW, ((j - DIST) + SIZEH) % SIZEH, 1000000, .000001);
      addConnection(i, j, ((i - DIST) + SIZEW) % SIZEW, j, 1000000, .000001);
      addConnection(i, j, ((i - DIST) + SIZEW) % SIZEW, (j + DIST) % SIZEH, 1000000, .000001);
      
      addConnection(i, j, i, ((j - DIST) + SIZEH) % SIZEH, 1000000, .000001);
 
      addConnection(i, j, (i + DIST) % SIZEW, ((j - DIST) + SIZEH) % SIZEH, 1000000, .000001);
      addConnection(i, j, (i + DIST) % SIZEW, j, 1000000, .000001);
      addConnection(i, j, i, (j + DIST) % SIZEH, 300000, .000001);
      
      addConnection(i, j, (i + DIST) % SIZEW, (j + DIST) % SIZEH, 500000, .000001);

    }
  }
  
}


void draw()
{
  background(0x30);   //</textarea>
  
  if (mousePressed && mouseX < SIZEW*5 && mouseY < SIZEH*5 && mouseX >= 0 && mouseY >= 0) {
    if (Elements[mouseX/5][mouseY/5].output >= 2.5) {
      Elements[mouseX/5][mouseY/5].output = 0.0;
    } else {
      Elements[mouseX/5][mouseY/5].output = 5.0;
    }
  }
  
  for (int y = 0; y < SIZEH; y++) {
    for (int x = 0; x < SIZEW; x++) {
      Elements[x][y].updateInputs();
    }
  }
  
  for (int x = 0; x < SIZEW; x++) {
    for (int y = 0; y < SIZEH; y++) {
      Elements[x][y].updateOutputs();
      
      color(Elements[x][y].output * 255 / 30);
      fill(Elements[x][y].output * 255 / 5);
      noStroke();
      //stroke(0xff, 0xff, 0xff);

      if (Elements[x][y].output >= 2.5) {
//ellipse(x * 5, y * 5, 5, 5);
        rect(x * 5, y * 5, 5, 5);
      }
    }
  }
  
}
