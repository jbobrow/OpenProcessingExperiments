

int numEggs = 20;
float[][] eggPos;
float eggWidth=30;
float[][][] eggRange;
boolean[] eggDraw;
float[] pacMan = {
  350,350
};
float pacManWidth =20;

void setup() {
  size(700,700);
  smooth();
  // Set up some random positions
  eggPos = new float[numEggs][2];
  for(int i=0; i<numEggs; i++) {
    eggPos[i][0] = random(width);
    eggPos[i][1] = random(height);
  }

  // Figure out the ranges
  eggRange = new float[numEggs][2][2];
  for(int i=0; i<numEggs; i++) {
    // Xrange
    eggRange[i][0][0] = eggPos[i][0] - eggWidth/2 - pacManWidth;
    eggRange[i][0][1] = eggPos[i][0] + eggWidth/2 + pacManWidth;
    // Yrange
    eggRange[i][1][0] =  eggPos[i][1] - eggWidth/2 - pacManWidth;
    eggRange[i][1][1] = eggPos[i][1] + eggWidth/2 + pacManWidth;
  }

  // Default to drawing all the eggs
  eggDraw = new boolean[numEggs];
  for(int i=0; i<numEggs; i++)
    eggDraw[i] = true;
}

void keyPressed() {
}

void draw() {
  // move pacMan
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        pacMan[0] += -5;
      } 
      else if (keyCode == RIGHT) {
        pacMan[0] += 5;
      }      
      else if (keyCode == UP) {
        pacMan[1] += -5;
      }      
      else if (keyCode == DOWN) {
        pacMan[1] += 5;
      }
    }
  }
  // Check for a hit
  color backGround = color(0,0,0);
  for(int i=0; i<numEggs; i++) {
    if (pacMan[0] >= eggRange[i][0][0] && pacMan[0] < eggRange[i][0][1] 
      && pacMan[1] >= eggRange[i][1][0] && pacMan[1] < eggRange[i][1][1]
      && eggDraw[i] == true) {
      backGround = color(255,0,0);
      eggDraw[i] = false;
    }
  }
  background(backGround);

  // Draw all the eggs
  fill(128,128,0);
  for(int i=0; i<numEggs; i++) {
    if(eggDraw[i])
      ellipse(eggPos[i][0], eggPos[i][1],eggWidth, eggWidth);
  }

  // Draw pacman
  fill(128,0,0);
  arc(pacMan[0], pacMan[1], 2*pacManWidth, 2*pacManWidth, TWO_PI-PI/2, TWO_PI+PI);

  text(mouseX + " " + mouseY,10,10);
}


