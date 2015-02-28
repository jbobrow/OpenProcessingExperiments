
// Painting with a living RGB world.
// by Juho Santasalo

// Press 1, 2 or 3 to change brush size, R, G or B to change color. Spacebar resets the screen.
// To tweak the rules of life, check variables in function livePixel();

int wid = 200;
int hei = 110;
int[][] worldR=new int[wid][hei];
int[][] worldG=new int[wid][hei];
int[][] worldB=new int[wid][hei];
boolean blurMode = false;

int i,u,x,y,drawCol,r,g,b,brushSize;


void setup() {
  size(wid*4,hei*4);
  background(0,0,0);
  noStroke();
  drawCol = 1;
  brushSize = 1;
  resetRGB();
}

// function returns a random integer number weighted by a normal distribution
int normalRandom(int rnd) {
  return(int((random(rnd)+random(rnd)+random(rnd)+random(rnd)+random(rnd)+random(rnd)+random(rnd)+random(rnd)+random(rnd)+random(rnd))/10));
}

void resetRGB() {
  for (y = 0; y<hei;y++) {

    for (x = 0; x<wid;x++) {
      worldR[x][y] = 0;
      worldG[x][y] = 0;
      worldB[x][y] = 0;
    }
  }
}

// Screen fading function. This fades the RGB field by random RGB values between zero and "strength".
void fadeRGB(int strength) {
  int decay;
  for (y = 0; y < hei; y++) {

    for (x = 0; x < wid; x++) {
      decay = int(normalRandom(strength));
      if(worldR[x][y] > 0) worldR[x][y] = worldR[x][y] - decay;
      if(worldG[x][y] > 0) worldG[x][y] = worldG[x][y] - decay;
      if(worldB[x][y] > 0) worldB[x][y] = worldB[x][y] - decay;
      
      // When a cell becomes saturated with a color, we take it back to a certain value
      // Try turning these three lines into comments...
      if(worldR[x][y] > 250) worldR[x][y] = 200;
      if(worldG[x][y] > 250) worldG[x][y] = 200;
      if(worldB[x][y] > 250) worldB[x][y] = 200;

    }
  } //End of Fading
}
/*
cell:
 (0) (1) (2)
 (3) (4) (5)
 (6) (7) (8)
 */
// Pixel living function. 
void livePixel(int px, int py) {

  // Determine the rate of growth and the chance of spreading to a nearby cell.
  float chanceOfSpread = 0.5;
  float growthSpeed = 0.5;
  int growthCap = 0;

  //Determine who's the winner of the colors...
  int winner=max(worldR[px][py],worldG[px][py],worldB[px][py]);
  int chanceWin=0;
  
  // Check if it's a tie - and randomize the winner between the tied colors if it is.
  if (worldR[px][py]==worldG[px][py] && worldG[px][py] == worldB[px][py]) chanceWin = int(random(3))+1;
  if (worldR[px][py]==worldG[px][py] && worldG[px][py] > worldB[px][py]) chanceWin = int(random(2))+1;
  if (worldG[px][py]==worldB[px][py] && worldB[px][py] > worldR[px][py]) chanceWin = int(random(2))+2;
  if (worldR[px][py]==worldB[px][py] && worldB[px][py] > worldG[px][py]) chanceWin = int(random(2))*2+1;

// If red color is the strongest, it spreads.
  if (winner==worldR[px][py] || chanceWin==1) {
    if(chanceOfSpread >= random(1)) {
      int cell = int(random(9));
      if(cell == 0) worldR[px-1][py-1] = worldR[px-1][py-1] + int((normalRandom(worldR[px][py])*growthSpeed-growthCap));
      if(cell == 1) worldR[px][py-1] = worldR[px][py-1] + int((normalRandom(worldR[px][py])*growthSpeed-growthCap));
      if(cell == 2) worldR[px+1][py-1] = worldR[px+1][py-1] + int((normalRandom(worldR[px][py])*growthSpeed-growthCap));
      if(cell == 3) worldR[px-1][py] = worldR[px-1][py] + int((normalRandom(worldR[px][py])*growthSpeed-growthCap));
      if(cell == 4) worldR[px][py] = worldR[px][py] + int((normalRandom(worldR[px][py])*growthSpeed-growthCap));
      if(cell == 5) worldR[px+1][py] = worldR[px+1][py] + int((normalRandom(worldR[px][py])*growthSpeed-growthCap));
      if(cell == 6) worldR[px-1][py+1] = worldR[px-1][py+1] + int((normalRandom(worldR[px][py])*growthSpeed-growthCap));
      if(cell == 7) worldR[px][py+1] = worldR[px][py+1] + int((normalRandom(worldR[px][py])*growthSpeed-growthCap));
      if(cell == 8) worldR[px+1][py+1] = worldR[px+1][py+1] + int((normalRandom(worldR[px][py])*growthSpeed-growthCap));
    }
  }
// If green color is the strongest, it spreads.
  if (winner==worldG[px][py] || chanceWin==2) {

    if(chanceOfSpread >= random(1)) {
      int cell = int(random(9));
      if(cell == 0) worldG[px-1][py-1] = worldG[px-1][py-1] + int((normalRandom(worldG[px][py])*growthSpeed-growthCap));
      if(cell == 1) worldG[px][py-1] = worldG[px][py-1] + int((normalRandom(worldG[px][py])*growthSpeed-growthCap));
      if(cell == 2) worldG[px+1][py-1] = worldG[px+1][py-1] + int((normalRandom(worldG[px][py])*growthSpeed-growthCap));
      if(cell == 3) worldG[px-1][py] = worldG[px-1][py] + int((normalRandom(worldG[px][py])*growthSpeed-growthCap));
      if(cell == 4) worldG[px][py] = worldG[px][py] + int((normalRandom(worldG[px][py])*growthSpeed-growthCap));
      if(cell == 5) worldG[px+1][py] = worldG[px+1][py] + int((normalRandom(worldG[px][py])*growthSpeed-growthCap));
      if(cell == 6) worldG[px-1][py+1] = worldG[px-1][py+1] + int((normalRandom(worldG[px][py])*growthSpeed-growthCap));
      if(cell == 7) worldG[px][py+1] = worldG[px][py+1] + int((normalRandom(worldG[px][py])*growthSpeed-growthCap));
      if(cell == 8) worldG[px+1][py+1] = worldG[px+1][py+1] + int((normalRandom(worldG[px][py])*growthSpeed-growthCap));
    }
  }
// If blue color is the strongest, it spreads.
  if (winner==worldB[px][py] || chanceWin==3) {

    if(chanceOfSpread >= random(1)) {
      int cell = int(random(9));
      if(cell == 0) worldB[px-1][py-1] = worldB[px-1][py-1] + int((normalRandom(worldB[px][py])*growthSpeed-growthCap));
      if(cell == 1) worldB[px][py-1] = worldB[px][py-1] + int((normalRandom(worldB[px][py])*growthSpeed-growthCap));
      if(cell == 2) worldB[px+1][py-1] = worldB[px+1][py-1] + int((normalRandom(worldB[px][py])*growthSpeed-growthCap));
      if(cell == 3) worldB[px-1][py] = worldB[px-1][py] + int((normalRandom(worldB[px][py])*growthSpeed-growthCap));
      if(cell == 4) worldB[px][py] = worldB[px][py] + int((normalRandom(worldB[px][py])*growthSpeed-growthCap));
      if(cell == 5) worldB[px+1][py] = worldB[px+1][py] + int((normalRandom(worldB[px][py])*growthSpeed-growthCap));
      if(cell == 6) worldB[px-1][py+1] = worldB[px-1][py+1] + int((normalRandom(worldB[px][py])*growthSpeed-growthCap));
      if(cell == 7) worldB[px][py+1] = worldB[px][py+1] + int((normalRandom(worldB[px][py])*growthSpeed-growthCap));
      if(cell == 8) worldB[px+1][py+1] = worldB[px+1][py+1] + int((normalRandom(worldB[px][py])*growthSpeed-growthCap));
    }
  }
  //End of making the pixel live.
}

// Blob drawing function. This is used for painting.
void drawBlob(int bx, int by, int bstrength, int bcolor) {
  for (u = 0; u < bstrength; u++) {
    for (i = 0; i < bstrength; i++) {
      x = bx - bstrength/2 + normalRandom(bstrength);
      y = by - bstrength/2 + normalRandom(bstrength);
      if(x > 0 && x < wid && y > 0 && y < hei) { //Quick check we're not accessing out of bounds
        if(bcolor == 1) {
          r = int(random(150)+105);
          g = int(random(50));
          b = int(random(50));
        }
        if(bcolor == 2) {
          r = int(random(50));
          g = int(random(150)+105);
          b = int(random(50));
        }
        if(bcolor == 3) {
          r = int(random(50));
          g = int(random(50));
          b = int(random(150)+105);
        }
        if(bcolor == 0) {
          r = int(random(10));
          g = int(random(10));
          b = int(random(10));
        }

        worldR[x][y]=r;
        worldG[x][y]=g;
        worldB[x][y]=b;
      }
    }
  }
}
void keyPressed(){
    
  if(key == 'r' || key == 'R') {
      drawCol = 1;
      println("RED");
    }
    if(key == 'g' || key == 'G') {
      drawCol = 2;
      println("GREEN");
    }
    if(key == 'b' || key == 'B') {
      drawCol = 3;
      println("BLUE");
    }
    if(key == ' ') {
      resetRGB();
      println("RESET");
    }
    if(key == '1') {
      brushSize = 1;
      println("Brush size 1");
    }
    if(key == '2') {
      brushSize = 2;
      println("Brush size 2");
    }
    if(key == '3') {
      brushSize = 3;
      println("Brush size 3");
    }
    if(key == 'x' || key == 'X') {
      drawCol = 0;
      println("WIPE MODE");
    }
    if(key == 's' || key == 'S') {
      if(blurMode) {blurMode = false; println("BLUR MODE OFF");}
      else {blurMode = true; println("BLUR MODE ON");}
      
    }
  }


void draw() {

  //Draw the RGB dimensions...
  for (y = 0; y<hei;y++) {

    for (x = 0; x<wid;x++) {
      fill(worldR[x][y],worldG[x][y],worldB[x][y]);
      rect(x*4,y*4, 4, 4);
    }
  } //End of Drawing



  // Check if the mouse is pressed
  if(mousePressed == true) {
    // If the mouse is pressed - FIRE!

    if(mouseX/4 > 0 && mouseX/4 < wid && mouseY/4 > 0 && mouseY/4 < hei) {
      // but first check that we're not accessing an area outside of the world - i.e. we don't crash
      if (brushSize == 1) drawBlob(mouseX/4, mouseY/4, 20, drawCol);
      if (brushSize == 2) drawBlob(mouseX/4, mouseY/4, 50, drawCol);
      if (brushSize == 3) drawBlob(mouseX/4, mouseY/4, 90, drawCol);
    }
  }

  //Let the RGB dimensions live a little bit...
  for (y = 1; y<hei-1;y++) {

    for (x = 1; x<wid-1;x++) {
      if(worldR[x][y] > 1 || worldG[x][y] > 1 || worldB[x][y] > 1) livePixel(x, y);
    }
  } 

  //Fade the RGB dimensions by a little bit...
  fadeRGB(5);
  if(blurMode)filter(BLUR,2);
}


