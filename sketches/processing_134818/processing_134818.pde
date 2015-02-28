
/*
NATHAN STETTER
ART 3001
PROJECT 01
*/

//global vars
float randPos, randPosY;
//num of blocks in the firework
int f1;
int w, h, r, g, b, alpha, counter;

void setup() { 
  size(800,800);
  background(10);
  stroke(10);
  //frameRate(2);
  w = (int)random(10, 60);
  h = w/2;
  r = 15;
  g = 35;
  b = 255;
  alpha = 80;
  f1 = (int)random(4, 100);
  randPos = random(100, 700);
  randPosY = random(100, 700);
  
  counter = 0;
} 

void smokeScreen(int w, int h) {
  int ranX = (int)random(width);
  int ranY = (int)random(width);
  fill(255,255,140,40);
  rect(ranX, ranY, w*10 , h*10);
  rect(ranX+10, ranY+10, h*10 , w*10);
  
}


void drawFLAIR(int w, int h) {
  w = w/2;
  h = h/2;
  int posX = (int)random(width - 10);
  int posY = (int)random(height - 10);
  int rIndex = (int)random(10, 200);
  
  //center
  fill(255);
  rect(posX, posY, w, h);
  //top
  fill(255, 15, 87);
  rect(posX, posY - 20, w, h);
  //bottom
  rect(posX, posY + 20, w, h);
  //left
  rect(posX - 20, posY, w, h);
  //right
  rect(posX + 20, posY, w, h);
  int moveX = 0;
  int moveY = 0;
  while (rIndex > 0) {
    //center
    fill(255);
    rect(posX +moveX, posY+moveY, w, h);
    //top
    fill(255, 15, 87);
    rect(posX+moveX, (posY - 20)+moveY, w, h);
    //bottom
    rect(posX+moveX, (posY + 20)+moveY, w, h);
    //left
    rect((posX - 20)+moveX, posY+moveY, w, h);
    //right
    rect((posX + 20)+moveX, posY+moveY, w, h);
    moveX++;
    moveY--;
    rIndex--; 
  }
}

void drawSHOOT(int w, int h) {
  int alpha = 0;
  int rMaxHeight = (int)random(60);
  int rWidth = (int)random(width);
  int inc = 0;
  for (int i = 0; i < rMaxHeight; i++) {
    fill(255, random(255), random(155), alpha);
    rect(rWidth, height - inc, w, h); 
    if (alpha < 80) { 
      alpha++;
    }
    inc += h;
  }
  alpha = 80;
  fill(255, random(255), random(155), alpha);
  rect(rWidth - (w/2), height - inc, w, h);
  rect(rWidth + (w/2), height - inc, w, h);
  inc += h;
  rect(rWidth - (w/2), height - inc, w, h);
  rect(rWidth + (w/2), height - inc, w, h);
}

void drawBOOM (float randPos, 
                float randPosY, 
                int f1, 
                int w, 
                int h, 
                int alpha,
                int r,
                int g,
                int b) {
  
  int inc = 0;
  int a = alpha;
  int aCopy = a;
  int fCopy = f1;
  float randPosYCopy = randPosY;
  
  //loops twice for top half and bottom half
  for(int j = 0; j < 2; j++) {
    //loops f1 times to bring the number of blocks in each row
    while (f1 > 0) {
      //this loop makes each row
      for (int i = 0; i < f1; i++) {
          if (i < f1/2) {
            fill(random(255), random(255), 255, alpha);
            rect(randPos + inc, randPosY, w, h);
            inc += w;
            alpha -= 6;
          } else {
            if (i == f1/2) {
             inc = 0; 
             alpha += 30;
            }
            fill(r, g, b, alpha);
            rect(randPos - inc, randPosY, w, h);
            inc += w;
            alpha -= 6;
          }
        }
      //resets vars
      alpha = a - 10;
      a -= 5;
      inc = 0;
      f1 -= 2;

      
      //if j == 0, we incrament down to create the bottom
      //else we incrament up to create top
      if (j == 0) {
        randPosY += h;
      } else {
        randPosY -= h;
      }
      
    }
    //resets vars
    alpha = aCopy;
    a = aCopy;
    f1 = fCopy;
    randPosY =randPosYCopy;
    inc = 0;
  } 
}

void draw() {
    //int time = (int)random(1000, 5000);
    //for(int i = 0; i < time; i++){
   
      if (counter < 21) {
        r = 15;
        g = 35;
        b = 255;
      } else if (counter > 21 && counter < 25) {
        r = 255;
        g = 15;
        b = 123;
        drawFLAIR(w, h);
      } else {
        smokeScreen(w, h);
        r = 15;
        g = 255;
        b = 199;
      }
  
      drawBOOM (randPos, randPosY, f1, w, h, alpha, r, g, b);
      drawSHOOT(w, h); 
      w = (int)random(10, 20);
      h = w/2;
      alpha = 80;
      f1 = (int)random(4, 40);
      randPos = random(100, 700);
      randPosY = random(100, 700);
  
      counter = (int)random(30);
  //}
  //noLoop();
}

void keyPressed() {
 saveFrame("stetter_project01_v5.tif"); 
}
