
final int _width = 400;
final int _height = 500;


final int GW = 50;
float PWp1 = (float)_width / GW;
float PW = PWp1 - 1;
float PWon2 = PW/2.0;

boolean[][] b = new boolean[GW][GW];

float bX = _width/2.0;
float bY = _width*0.75;
float vX = 1.0;
float vY = -1.3;


float barWidth = 100;
float barY = _height-70;
float maxBarVelocityChange = 3.5;


boolean gameOver = false;
int framesSinceGO = 0;
int framesForHelp = 300;

void setup() {
  //vX *= 0.1;
  //vY *= 0.1;

  size(_width, _height);

  fill(255);
  noStroke();
  
  background(0);
  text("Loading...", 20, 20);
  
  getMap("http://i.imgur.com/TLoeXjr.png");
}


void draw() {
  if (!gameOver) {

    background(0);

    drawMap();

    drawBall();
    collideBall();
    moveBall();

    drawBar();
  } else {
    fill(255, 0, 0);
    text(":(", random(_width), random(_height));
    
    if (framesSinceGO++ > framesForHelp) {
      fill(0);
      text("Press space to respawn", 20, _height-20);
      fill(255);
      text("Press space to respawn", 20, _height-20);
    }
  }
}

void restart() {
  gameOver = false;
  bX = _width/2.0;
  bY = _width*0.75;
  vX = 1.0;
  vY = -1.3;
}

void drawBar() {
  rect(mouseX-barWidth/2, barY, barWidth, PW);
}

void collideBall() {

  // bounce of walls
  if (bX < PWon2)
    vX = abs(vX);
  if (bX > _width-PWon2)
    vX = -abs(vX);
  if (bY < PWon2)
    vY = abs(vY);
  if (bY > _height-PWon2)
    onBottomHit();


  if (bY > barY && bY < (barY + PW)) {
    if (bX > (mouseX - barWidth/2) && (bX < (mouseX + barWidth/2))) {
      vY = -abs(vY);
      float distFromCtr = (bX - mouseX) / barWidth;
      vX = maxBarVelocityChange * distFromCtr;
    }
  }

  // bounce of cells in map
  int bL = (int)((bX-PWon2)/PWp1);
  int bR = (int)((bX+PWon2)/PWp1);
  int bT = (int)((bY-PWon2)/PWp1);
  int bB = (int)((bY+PWon2)/PWp1);

  bL = constrain(bL, 0, GW-1);
  bR = constrain(bR, 0, GW-1);
  bT = constrain(bT, 0, GW-1);
  bB = constrain(bB, 0, GW-1);

  boolean TL = b[bT][bL];
  boolean TR = b[bT][bR];
  boolean BL = b[bB][bL];
  boolean BR = b[bB][bR];

  int collCount = 0;
  if (TL) collCount++;
  if (TR) collCount++;
  if (BL) collCount++;
  if (BR) collCount++;



  if (collCount == 4) {
    // collisions all around
    vX *= -1;
    vY *= -1;
    b[bT][bL] = false;
    b[bT][bR] = false;
    b[bB][bL] = false;
    b[bB][bR] = false;
  } else if (collCount == 3) {
    // three collisions
    if (TL && BL) {
      // x ?
      // x ?
      if (vX < 0) {
        // moving left
        vX = abs(vX);
        if (BR) vY = -abs(vY);
        if (TR) vY = abs(vY);
        b[bT][bL] = false;
        b[bT][bR] = false;
        b[bB][bL] = false;
        b[bB][bR] = false;
      } else if (vX > 0) {
        // moving right
        vX = -abs(vX);
        b[bT][bL] = false;
        b[bB][bL] = false;
      }
    } else if (TR && BR) {
      // ? x
      // ? x
      if (vX > 0) {
        // moving right
        vX = -abs(vX);
        if (BL) vY = -abs(vY);
        if (TL) vY = abs(vY);
        b[bT][bL] = false;
        b[bT][bR] = false;
        b[bB][bL] = false;
        b[bB][bR] = false;
      } else if (vX < 0) {
        // moving left
        vX = abs(vX);
        b[bT][bR] = false;
        b[bB][bR] = false;
      }
    } else if (BL && BR) {
      // ? ? 
      // x x 
      if (vY > 0) {
        // moving down
        vY = -abs(vY);
        if (TL) vX = abs(vX);
        if (TR) vX = -abs(vX);
        b[bT][bL] = false;
        b[bT][bR] = false;
        b[bB][bL] = false;
        b[bB][bR] = false;
      } else if (vY < 0) {
        // moving up
        vY = abs(vY);
        b[bB][bL] = false;
        b[bB][bR] = false;
      }
    } else if (TL && TR) {
      // x x 
      // ? ? 
      if (vY < 0) {
        // moving up
        vY = abs(vY);
        if (BL) vX = abs(vX);
        if (BR) vX = -abs(vX);
        b[bT][bL] = false;
        b[bT][bR] = false;
        b[bB][bL] = false;
        b[bB][bR] = false;
      } else if (vY > 0) {
        // moving down
        vY = -abs(vY);
        b[bT][bL] = false;
        b[bT][bR] = false;
      }
    }
  } else if (collCount == 2) {
    // two collisions
    if ((TL && TR) || (BL && BR)) {
      // horizontal
      vY *= -1;
      b[bT][bL] = false;
      b[bT][bR] = false;
      b[bB][bL] = false;
      b[bB][bR] = false;
    } else if ((TL && BL) || (TR && BR)) {
      // vertical
      vX *= -1;
      b[bT][bL] = false;
      b[bT][bR] = false;
      b[bB][bL] = false;
      b[bB][bR] = false;
    } else if ((TL && BR) || (TR && BL)) {
      // diagonal
      vX *= -1;
      vY *= -1;
      b[bT][bL] = false;
      b[bT][bR] = false;
      b[bB][bL] = false;
      b[bB][bR] = false;
    }
  } else if (collCount == 1) {
    // one collision
    if (TL) {
      // top left
      vX = abs(vX);
      vY = abs(vY);
      b[bT][bL] = false;
    }
    if (TR) {
      // top right
      vX = -abs(vX);
      vY = abs(vY);
      b[bT][bR] = false;
    }
    if (BL) {
      // bottom left
      vX = abs(vX);
      vY = -abs(vY);
      b[bB][bL] = false;
    }
    if (BR) {
      // bottom right
      vX = -abs(vX);
      vY = -abs(vY);
      b[bB][bR] = false;
    }
  }


  /*
  
   
   MOVING / (down left)
   
   (4)
   . . 
   . . up right
   
   (3)
   .   
   . . up right
   
   . 
   . . up left
   
   . . 
   .   down right
   
   . . 
   . down left
   
   (2)
   . . 
   up left
   
   
   . . up left
   
   .   
   .   down right
   
   . 
   . up right
   
   .   
   .   up right
   
   . 
   . down right
   
   (1)
   .   
   down right
   
   . 
   up right
   
   
   .   up right
   
   
   . up left
   
   (0)
   
   down left
   
   
   
   
   
   
   
   */



  /*
  // original method
   if (vX > 0) {
   // moving right
   if (b[bT][bR] || b[bB][bR]) {
   b[bT][bR] = false;
   b[bB][bR] = false;
   if (!b[bT][bL])
   vX = -abs(vX);
   }
   } else if (vX < 0) {
   // moving left
   if (b[bT][bL] || b[bB][bL]) {
   b[bT][bL] = false;
   b[bB][bL] = false;
   vX = abs(vX);
   }
   }
   if (vY < 0) {
   // moving up
   if (b[bT][bL] || b[bT][bR]) {
   b[bT][bL] = false;
   b[bT][bR] = false;
   vY = abs(vY);
   }
   } else if (vY > 0) {
   // moving down
   if (b[bB][bL] || b[bB][bR]) {
   b[bB][bL] = false;
   b[bB][bR] = false;
   vY = -abs(vY);
   }
   }
   */
}

void onBottomHit() {
  gameOver = true;
  framesSinceGO = 0;
}

void moveBall() {
  bX += vX;
  bY += vY;
}

void drawBall() {
  rect(bX-PWon2, bY-PWon2, PW, PW);
}

void drawMap() {
  for (int y=0; y<GW; y++) {
    for (int x=0; x<GW; x++) {
      if (b[y][x]) {
        rect(x*PWp1, y*PWp1, PW, PW);
      }
    }
  }
}

void getMap(String filename) {

  // load and appropriate image
  PImage mapImg;
  mapImg = loadImage(filename);
  mapImg.resize(GW, GW);
  mapImg.filter(THRESHOLD, 0.5);
  mapImg.loadPixels();

  // convert pixels into boolean array
  int i = 0;
  for (int y=0; y<GW; y++) {
    for (int x=0; x<GW; x++) {
      b[y][x] = (mapImg.pixels[i] == -1);
      i++;
    }
  }

  mapImg = null;
}

void keyPressed() {
  if (key == ' ') {
    if (gameOver) {
      fill(random(128, 255), random(128, 255), random(128, 255));
      restart();
    }
  }
}
