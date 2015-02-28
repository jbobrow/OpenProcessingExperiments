
// declare constants
static float GRAVITY = 0.1;
static float FRICTION = 0.99;

static int SCREENW = 640;
static int SCREENH = 350;

static color BACKGROUNDCOLOR = #0402ac; 
static color GORILLACOLOR = #f9ae62;

static int ARMDELAY = 200; // arm delay in ms

// declare global variables
int recentKey;
float delayTime;
float angle;
boolean acceptInput;
boolean shouldFire;
boolean showStructure;
int[] picture;
player p1;
player p2;
bullet b;
int nBuildings;

int[] gamestartposX;
int[] gamestartposY;

char[][] structure = new char[SCREENW][SCREENH];

PImage gorilla1;
PImage gorilla2;
PImage gorillaThrowR;
PImage gorillaThrowL;
PImage banana1of4;
PImage banana2of4;
PImage banana3of4;
PImage banana4of4;

int gHeight = 37;
int gWidth = 35;


void setup() {
  size(640, 350);
  println("Setup");
  frameRate(60);
  drawBackground();
  showStructure = false;
  drawBuildings();
  int pos1 = round(random(1,3));
  int pos2 = round(random(nBuildings-3,nBuildings));
 
  p1 = new player(gamestartposX[pos1]-0.5*gWidth, gamestartposY[pos1]-gHeight, "tank", true, true);  // LEFT
  p2 = new player(gamestartposX[pos2]-0.5*gWidth, gamestartposY[pos2]-gHeight, "tank", false, false); // RIGHT
  b = new bullet();

  shouldFire = false;

  gorilla1 = loadImage("g_pos3.png");
  gorilla2 = loadImage("g_pos3.png");
  gorillaThrowL = loadImage("g_pos1.png");
  gorillaThrowR = loadImage("g_pos2.png");
  banana1of4 = loadImage("b_pos1of4.png");
  banana2of4 = loadImage("b_pos2of4.png");
  banana3of4 = loadImage("b_pos3of4.png");
  banana4of4 = loadImage("b_pos4of4.png");


  for (int i=0;i<100;i++)
    structure[100][i] = 'X';
    
  // make initial drawing and save this for later reference

  picture = new int[SCREENW*SCREENH];
  loadPixels();
  picture = pixels;  
    
    

}

void draw() {
  //drawBuildings(width, height);
  pixels = picture;
  updatePixels();
  p1.drawPlayer();
  p2.drawPlayer();
  
  if (showStructure) {
    loadPixels();
    for (int i=0;i<SCREENW;i++) {
      for (int j=0;j<SCREENH;j++) {
        if (structure[i][j] == 'X')
          pixels[i+width*j] = color(#FF0000);
      }
    }
    updatePixels();
  }

  // control game flow
  if (!b.isInAir()) 
  {
    if (!p1.wasHit && !p2.wasHit)  // who has the turn
    {
      if (p1.hasTurn())
      {
        // use mouse to select throwing angle and speed
        strokeWeight(5); 
        line(mouseX, mouseY, p1.getXcenter(), p1.getYcenter());   
        strokeWeight(1); 
        // wait for user input
        acceptInput = true;
        angle = 0;
        if ((mouseX-p1.getXcenter())!=0)
          angle =  degrees(atan(abs(mouseY-p1.getYcenter())/abs(mouseX-p1.getXcenter())));   
        if (shouldFire && mouseX > p1.getXcenter() && mouseY < p1.getYcenter()) //(recentKey == 'F')
        {

          delay(200);
          println("Player1 Fire");
          p1.hasTurn = false;
          p2.hasTurn = true;
          b.setPos(p1.getXcenter(), p1.getYcenter());
          b.setPower(dist(mouseX, mouseY, p1.getXcenter(), p1.getYcenter())/10);
          b.setAngle(angle);
          delayTime = millis()+ARMDELAY; 
          // stay in the throwing phase for a while
          b.prepareFire();
        }
      }
      else if (p2.hasTurn())
      {
        strokeWeight(5);
        line(mouseX, mouseY, p2.getXcenter(), p2.getYcenter());       
        strokeWeight(1);
        // wait for user input
        acceptInput = true;
        angle = 0;
        if ((mouseX-p2.getXcenter())!=0)
          angle =  180-degrees(atan(abs(mouseY-p2.getYcenter())/abs(mouseX-p2.getXcenter())));  
        if (shouldFire && mouseX < p2.getXcenter() && mouseY < p2.getYcenter()) //(recentKey == 'F')
        {
          delay(200); // debouncing
          println("Player2 Fire");
          p1.hasTurn = true;
          p2.hasTurn = false;
          b.setPos(p2.getXcenter(), p2.getYcenter());
          b.setPower(dist(mouseX, mouseY, p2.getXcenter(), p2.getYcenter())/10);
          b.setAngle(angle);
          p2.isThrowing(true);
          delayTime = millis()+ARMDELAY; 
          b.prepareFire();
        }
      }
    }
    else  // who won
    {
      if (p1.wasHit())
      {
        fill(BACKGROUNDCOLOR);
        noStroke();
        ellipse(p1.posX,p1.posY,100,100);
        picture = pixels;
      }
      if (p2.wasHit())
      {   
        fill(BACKGROUNDCOLOR);
        noStroke();
        ellipse(p2.posX,p2.posY,100,100); 
        picture = pixels;        
      }
    }
  }
  else // bullet is in the air. Keep drawing it
  {
    if (millis()>delayTime)
    {
      p1.isThrowing(false);
      p2.isThrowing(false);
    }
    // println("Bullet in air");
    b.drawBullet();
  }
}

class bullet {
  float posX;
  float posY;
  float deltaX;
  float deltaY;
  String type; 
  boolean inAir;
  float power;
  float angle;
  int bananacnt; // used to create rotating banana
  float startPosX;
  float startPosY;
  PImage bulletImage;

  void bullet() // bullet does not have a position to begin with
  {
    println("Bullet object created");
    inAir = false;
    posX = 0;
    posY = 0;
    bananacnt = 0;
  }

  void setPos(float x, float y)
  {
    startPosX = x;
    startPosY = y;
    posX = x; 
    posY = y;
    println("Bullet pos set to :" + posX + "," + posY);
  }

  void setPower(float p)
  {
    power = p;
    println("Bullet power set to :" + power);
  }

  void setAngle(float a)
  {
    angle = a; 
    println("Bullet angle set to :" + angle);
  }

  void prepareFire() {
    inAir = true;
    deltaX = power*cos(radians(angle));
    deltaY = -power*sin(radians(angle));
  }


  void drawBullet() {
    //   println(posX + "," + posY + "," + angle + "," + power);
    deltaY *= FRICTION;
    deltaX *= FRICTION;
    deltaY += GRAVITY;
    posX += deltaX;
    posY += deltaY;


    if (posX > width || posY > height || posX < 0)
      inAir = false;

    //fill(#000000);    
    //ellipse(posX, posY, 10, 10);

    // check for collisions based on colors (do this before drawing bullet)
    if (posX < width && posY < height && posX > 0 && posY > 0)
    {

      loadPixels(); // load pixel values
      if (pixels[floor(posX)+width*floor(posY)] == BACKGROUNDCOLOR)
        ;
      else if (dist(posX, posY, startPosX, startPosY) > 50) {  // ignore gorilla (always hits itself in the beginning)
        println("HIT");   
        inAir = false;
        fill(BACKGROUNDCOLOR);
        noStroke();
        ellipse(posX, posY, 20, 20);
        stroke(#000000);
        if (dist(posX,posY,p1.posX,p1.posY) < 40)
        {
           p1.isHit(true);
           newRound();
        }
        else if (dist(posX,posY,p2.posX,p2.posY) < 40)
        {
           p2.isHit(true);
           newRound();
        }
      }
    }
    loadPixels();
    picture = pixels;
    
    if (frameCount%4==0) // framerate: 60 frames/second e.g. 15 = 250ms; 
      bananacnt++;

    if (bananacnt == 5)
      bananacnt = 1;

    bulletImage = banana1of4;  
    switch(bananacnt) {
    case 1:
      bulletImage = banana1of4;
      break;
    case 2:
      bulletImage = banana2of4;
      break;        
    case 3:
      bulletImage = banana3of4;
      break;  
    case 4:
      bulletImage = banana4of4;
      break;
    }    
    image(bulletImage, posX, posY);

    //    check for collisions based on underlying char-array    
    //    if (posX < width && posY < height && posX > 0 && posY > 0)
    //    {
    //    
    //    if (structure[floor(posX)][floor(posY)] == 'X')
    //      println("hit X");
    //      
    //    if (structure[floor(posX)][floor(posY)] == '1')
    //      println("hit 1");
    //      
    //    if (structure[floor(posX)][floor(posY)] == '2')
    //      println("hit 2");  
    //    }
  }

  boolean isInAir() {
    return inAir;
  }

  void setInAir(boolean ia) {
    inAir = ia;
  }
}

class player {
  color colorHasTurn0 = #FF0000;
  color colorHasTurn1 = #00FF00;
  float posX;
  float posY;
  String type;
  color pColor;
  boolean hasTurn;
  boolean wasHit;
  boolean onLeft;
  boolean isThrowing;
  PImage playerImage;

  player(float x, float y, String t, boolean ht, boolean ol) // contructor
  {
    posX = x;
    posY = y;
    type = t;
    hasTurn = ht;
    wasHit = false;
    onLeft = ol;
    isThrowing = false;
  }  

  // return center of playerImage
  float getXcenter() {
    return posX+playerImage.width/2;
  }

  float getYcenter() {
    return posY+playerImage.height/2;
  }  

  void newPos(float x, float y) {
    posX = x;
    posY = y;
  }

  void setStartPosX(float x) {
  }
  

  void drawPlayer() {
    if (hasTurn) {
      //pColor = colorHasTurn1;
      playerImage = gorilla1;
    }
    else
    {
      playerImage = gorilla2;
      //pColor  = colorHasTurn0;
    }
    //fill(pColor);
    //rect(posX, posY, 20, 20);
    // special case when in the throw phase
    if (isThrowing)
    {
      if (onLeft)
        playerImage = gorillaThrowR; // throw right
      else
        playerImage = gorillaThrowL; // throw left
    }

    image(playerImage, posX, posY);
  }

  void isThrowing(boolean it)
  {
    isThrowing = it;
  }

  boolean hasTurn() {
    return hasTurn;
  }

  void setTurn(boolean st) {
    hasTurn = st;
  }

  boolean wasHit() {
    return wasHit;
  }

  void isHit(boolean ih) {
    wasHit = ih;
  }

  // display the player
  void display() {
  }
}

// draw the background (or what is remaining of it)
void drawBackground() {
  background(BACKGROUNDCOLOR);
  // make a couple of objects that can be hit
  fill(#FF0000);
  ellipse(200, 200, 50, 50);
  fill(#00FF00);
  ellipse(100, 100, 50, 50);
}

void keyPressed()
{
  if (acceptInput)
    recentKey = keyCode;

  if (keyCode == 'S') {// show background structure  
    showStructure = true;
  }
}

void keyReleased() {
  recentKey = '!';
  if (keyCode == 'S') {// show background structure  
    showStructure = false;
  }
}

void mousePressed() {
  if (acceptInput)
    shouldFire = true;
}

void mouseReleased() {
  shouldFire = false;
}


void newRound() {
      // make initial drawing and save this for later reference
  drawBackground();
  drawBuildings();
  picture = pixels;
  
  int pos1 = round(random(1,3));
  int pos2 = round(random(nBuildings-3,nBuildings));
 
  p1.newPos(gamestartposX[pos1]-0.5*gWidth,gamestartposY[pos1]-gHeight);
  p2.newPos(gamestartposX[pos2]-0.5*gWidth,gamestartposY[pos2]-gHeight);
    p1.drawPlayer();
  p2.drawPlayer();
  p1.isHit(false);
  p2.isHit(false);
}

void drawBuildings(int scrWidth, int scrHeight) {
  int[] buildColors = { 
    #04aaac, // Blue
    #ac0204, // Red
    #acaaac  // Gray
  };  
  int[] windowColors = { 
    #fcfe54, // Yellow
    #545654  // Gray
  }; 
  int skyBlue=#0402ac;

  background(skyBlue);

  int buildMaxHeight = round(scrHeight*0.5);
  int buildMinHeight = round(scrHeight*0.9);
  int buildMaxWindows = 7;
  int buildMinWindows = 4;
  int buildWindowVSpace = 6;
  int buildWindowHSpace = 8;
  int buildWindowBorder = 3;
  int buildWindowWidth = 4;
  int buildWindowHeight = 7;

  int buildSpace = 1;

  //int buildMaxWidth = (2*buildWindowBorder)+(buildWindowWidth*buildMaxWindows)+(buildWindowVSpace*(buildMaxWindows-1));
  //int buildMinWidth = (2*buildWindowBorder)+(buildWindowWidth*buildMinWindows)+(buildWindowVSpace*(buildMinWindows-1));
  int buildMaxWidth = (2*buildWindowBorder)+(buildWindowWidth*buildMaxWindows)+(buildWindowVSpace*(buildMaxWindows-1));
  int buildMinWidth = (2*buildWindowBorder)+(buildWindowWidth*buildMinWindows)+(buildWindowVSpace*(buildMinWindows-1));

  boolean roomForBuilding = true;
  int buildOverallWidth = 0;
  int thisBuildStartX = 2;

  while (roomForBuilding) {
    int thisBuildColor = buildColors[round(random(0, 2))];
    fill(thisBuildColor);
    noStroke();

    int thisBuildStartY = round(random(buildMaxHeight, buildMinHeight));
    int thisBuildWidth = round(random(buildMinWidth, buildMaxWidth));
    int thisBuildHeight = scrHeight-thisBuildStartY;
    rect(thisBuildStartX, thisBuildStartY, thisBuildWidth, thisBuildHeight);
    
    boolean roomForWindow = true;
    int thisWindowStartX = thisBuildStartX+buildWindowBorder;
    int thisWindowStartY = thisBuildStartY+buildWindowBorder;

    while (roomForWindow) {
      if (thisWindowStartX >= thisBuildWidth-buildWindowWidth) {
        roomForWindow = false;
      }
      else {
        if (random(0,3) >= 1) {
          fill(windowColors[0]);
        }
        else {
          fill(windowColors[1]); 
        }
        rect(thisWindowStartX, thisWindowStartY, buildWindowWidth, buildWindowHeight);
      }
      thisWindowStartX = thisWindowStartX+buildWindowHSpace;
      //thisWindowStartY = thisWindowStartY+buildWindowVSpace;
    }
    
    buildOverallWidth = buildOverallWidth + thisBuildWidth + buildSpace;
    if (buildOverallWidth + buildMaxWidth >= scrWidth) {
      roomForBuilding = false;
    }
    thisBuildStartX = thisBuildStartX + thisBuildWidth + buildSpace;
  }
}

void drawBuildings() {
  int scrHeight = height;
  int scrWidth = width;
  int[] buildColors = { 
    #04aaac, // Blue
    #ac0204, // Red
    #acaaac  // Gray
  };  
  int[] windowColors = { 
    #fcfe54, // Yellow
    #545654  // Gray
  }; 
  int skyBlue=#0402ac;
  gamestartposX = new int[15];
  gamestartposY = new int[15];

  background(skyBlue);

  int buildMaxHeight = round(scrHeight*0.5);
  int buildMinHeight = round(scrHeight*0.9);
  int buildMaxWindows = 7;
  int buildMinWindows = 4;
  int buildWindowVSpace = 6;
  int buildWindowHSpace = 8;
  int buildWindowBorder = 3;
  int buildWindowWidth = 4;
  int buildWindowHeight = 8;//7;
  int buildSpace = 1;
  int buildMaxWidth = (2*buildWindowBorder)+(buildWindowWidth*buildMaxWindows)+(buildWindowVSpace*(buildMaxWindows-1));
  int buildMinWidth = (2*buildWindowBorder)+(buildWindowWidth*buildMinWindows)+(buildWindowVSpace*(buildMinWindows-1));

  boolean roomForBuilding = true;
  int buildOverallWidth = 0;
  int thisBuildStartX = 2;

  int cntBuildings = 0;

  while (roomForBuilding) {
    cntBuildings++;
    println("Building " + cntBuildings + " x=" + thisBuildStartX);
    int thisBuildColor = buildColors[round(random(0, 2))];
    fill(thisBuildColor);
    noStroke();

    int thisBuildStartY = round(random(buildMaxHeight, buildMinHeight));
    int thisBuildWidth = round(random(buildMinWidth, buildMaxWidth));
    int thisBuildHeight = scrHeight-thisBuildStartY;
    rect(thisBuildStartX, thisBuildStartY, thisBuildWidth, thisBuildHeight);
    
    gamestartposX[cntBuildings] = round(thisBuildStartX+0.5*thisBuildWidth);
    gamestartposY[cntBuildings] = thisBuildStartY;
    
    boolean roomForWindow = true;
    int thisWindowStartX = thisBuildStartX+buildWindowBorder;
    int thisWindowStartY = thisBuildStartY+buildWindowBorder;

    int cntWindows = 0;
   
    
    while (roomForWindow) {
      if (thisWindowStartX >= (thisBuildStartX+thisBuildWidth-buildWindowWidth)) {
        roomForWindow = false;
      }
      else {
        // make all rows here
        boolean roomForWindowH = true;
        thisWindowStartY = thisBuildStartY-buildWindowHeight;
        while (roomForWindowH)
        {
          cntWindows++;
          if (random(0,3) >= 1) {
            fill(windowColors[0]);
          }
          else {
            fill(windowColors[1]); 
          }
          thisWindowStartY = thisWindowStartY+2*buildWindowHeight;
          
          if (thisWindowStartY < height)
             rect(thisWindowStartX, thisWindowStartY, buildWindowWidth, buildWindowHeight);
          else
             roomForWindowH = false;

          println("--Window " + cntWindows + " x=" + thisWindowStartX + " y=" + thisWindowStartY);
             
        }
      }
      thisWindowStartX = thisWindowStartX+buildWindowHSpace;
      //thisWindowStartY = thisWindowStartY+buildWindowVSpace;
    }
    
    buildOverallWidth = buildOverallWidth + thisBuildWidth + buildSpace;
    if (buildOverallWidth + buildMaxWidth >= scrWidth) {
      roomForBuilding = false;
    }
    thisBuildStartX = thisBuildStartX + thisBuildWidth + buildSpace;
  }
  
  nBuildings = cntBuildings;
  stroke(1);
}


