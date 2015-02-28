
class Cell {
  int posX = 0;
  int posY = 0;
  float nrg = 255.0;
  float nrgLossS = 1;
  float nrgLossD = sqrt(2);
  float minLoss = 0.1;      // factor!
  public boolean alive = true;
  int colR = 0;
  int colG = 0;
  int colB = 0;
  int colT = 0;
  
  Cell (int tposX, int tposY, int r, int g, int b, int t) {
    posX = tposX;
    posY = tposY;
    colR = r;
    colG = g;
    colB = b;
    colT = t;
  }
  
  void move () {
    if (alive) {
      int direction = int(random(9));
      int lossType = 0;
      
      switch (direction) {
        case 0:
        break;
        
        case 1:
        posX++;
        // posY;
        lossType = 0;
        break;
        
        case 2:
        posX++;
        posY++;
        lossType = 1;
        break;
        
        case 3:
        // posX;
        posY++;
        lossType = 0;
        break;
        
        case 4:
        posX--;
        posY++;
        lossType = 1;
        break;
        
        case 5:
        posX--;
        // posY;
        lossType = 0;
        break;
        
        case 6:
        posX--;
        posY--;
        lossType = 1;
        break;
        
        case 7:
        // posX;
        posY--;
        lossType = 0;
        break;
        
        case 8:
        posX++;
        posY--;
        lossType = 1;
        break;
        
        default:
        break;
      } // switch
      
        
      if (lossType == 0) {
        nrg -= nrgLossS + nrgLossS*minLoss;
      } else if (lossType == 1) {
        nrg -= nrgLossD + nrgLossD*minLoss;
      }
      
      if (posX <= 0) {
        posX = width;
      } else if (posX >=width) {
        posX = 0;
      } else if (posY <= 0) {
        posY = height;
      } else if (posY >=width) {
        posY = 0;
      }
    } // if
    
    stroke(colR,colG,colB,nrg);
    strokeWeight(2);
    point (posX, posY);
    noStroke();
  } // move
  
  void die() {
    if (nrg <= 0) {
      alive = false;
    }
  }
} // Cell

