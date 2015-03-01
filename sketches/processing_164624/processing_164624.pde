
Creature bob = new Creature();
Creature hank;

void setup() { 
  size(400,400);
  smooth();
  hank = new Creature(); //Alternate Constructor placement in setup
  bob.prime(width/2, height/2, 5);
  hank.prime(100, 100, 2);
}



void draw() {

  bob.update();
  hank.update();
  
}

class Creature {

  int bigness;
  int xPos;
  int yPos;

  void prime(int _xPos, int _yPos, int _bigness) {
    bigness = _bigness;    // Change the creature's size
    xPos = _xPos;
    yPos = _yPos;
  }

  void update() {

    //The body. Position determined here
    strokeWeight(3);  
    stroke(0);
    fill(75, 56, 32);
    ellipse(xPos, yPos, bigness*50, bigness*50);

    // The eyeball
    fill(255);        
    ellipse(xPos-(bigness*4), yPos-(bigness*2), bigness*25, bigness*10);

    //The pupil
    fill(0);    
    ellipse(xPos-(bigness*5), yPos-(bigness+bigness*.5), bigness*5, bigness*5);

    //The mouth
    line(xPos-(bigness*16), yPos*1.2, xPos+(bigness*11), yPos*1.2);
  }
}



