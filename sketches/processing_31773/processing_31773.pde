
PFont gillsans;
slider platformSpeed;
toggle drawPlatforms;

//PLATFORM CONTROLS====================================
int platMax = 15;
boolean randomPWidth = false;
int numColors = 10;
int numPlatforms = 50;
boolean drawPlats = false;
int moveRate = 10;

int defaultPHue = 200;
int defaultPSat = 100;
int defaultPBright = 100;
int defaultPAlpha = 100;
boolean randomHue = true;
boolean randomBright = false;
boolean randomSat = false;
boolean randomAlpha = false;

//BALL CONTROLS====================================
int defaultHue = 87;
int defaultSat = 100;
int defaultBright = 100;
int defaultAlpha = 0;
int numBalls = 310;
int ballWidth=15;
float ballReturn = 10;//how high it bounces

boolean randomBallHue=true;
int numBallColors=8;
int colorFadeFrames = 24;//# of frames in order to fade to original

//DEFAULT CONTROLS===========================
color defaultBG=color(0);//background RGB

//other VARS=========
bounceBall[] theBalls = new bounceBall[numBalls];
platform[] thePlats = new platform[numPlatforms];
color defaultPColor;
color defaultColor;

void setup() {
  gillsans=loadFont("GillSans-40.vlw");
  platformSpeed=new slider(500, height-20, 300, 15, 1, 500, moveRate, "Platform Speed", true, true);
  drawPlatforms=new toggle(20, 40, 15, drawPlats, "Draw Platforms");
  frameRate(24);
  //smooth();
  size(1080, 800);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
  defaultColor = color(defaultHue, defaultSat, defaultBright, defaultAlpha);
  defaultPColor = color(defaultPHue, defaultPSat, defaultPBright, defaultPAlpha);

  for (int i = 0; i < theBalls.length; i++) {
    theBalls[i] = new bounceBall();
  }

  for (int i = 0; i < thePlats.length; i++) {
    int newY = (height-100)/thePlats.length * i + 100;
    int newX = int(random(width-platMax));
    thePlats[i] = new platform(newX, newY);
  }
}

void draw() {
  background(defaultBG);
  for (int i = 0; i < theBalls.length; i++) {
    theBalls[i].update();
  }
  for (int i = 0; i<thePlats.length; i++) {
    thePlats[i].update();
  }
  /*
  platformSpeed.update();
  drawPlatforms.update();*/
  moveRate=int(platformSpeed.value);
  drawPlats=drawPlatforms.isSelected;
}

//------––––––––––––––//------––––––––––––––//------––––––––––––––//------––––––––––––––
//BOUNCe BALL CLAss

class bounceBall {
  int fallRate = 1;
  float speed = 0;
  int x, y;
  int bWidth = ballWidth;
  
  color bColor = defaultColor;
  int lastSat = defaultSat;
  int lastHue = defaultHue;
  int lastBright = defaultBright;
  int lastAlpha = defaultAlpha;
  
  int hueFR;
  int satFR;
  int brightFR;
  int alphaFR;

  bounceBall() {
    resetBall(); 
  }
  //RESET STUFFF
  void resetBall() {
    y = -bWidth -int(random(10));
    speed = 0;
    x = int(random(width - 40));
  }
  void resetColor() {
    bColor = defaultColor;
    lastSat = defaultSat;
    lastHue = defaultHue;
    lastBright = defaultBright;
    lastAlpha = defaultAlpha;
  }
  
  void update() {
    speed += fallRate; 
    y += speed; //move down

    fadeColor();
    
    if (y>height+bWidth) { 
      resetBall(); 
      resetColor();
    }
    
    hitCheck();

    fill(bColor);
    ellipse(x, y, bWidth, bWidth);
    fill(defaultColor);
  }
  
  void fadeColor() {
    lastSat = checkColor(lastSat, defaultSat, satFR);
    lastBright = checkColor(lastBright, defaultBright, brightFR);
    lastAlpha = checkColor(lastAlpha, defaultAlpha, alphaFR);
    
    if (lastHue > defaultHue+hueFR) {
      lastHue -= hueFR;
    } else if (lastHue < defaultHue-hueFR){
      lastHue += hueFR;
    }
    if (lastHue < 0) lastHue = 0;
    if (lastHue>360) lastHue=360;
    
    bColor = color(lastHue, lastSat, lastBright, lastAlpha);
  }
  
  void hitCheck() {
    for (int i = 0; i < thePlats.length; i++) {//check for bounce
      if (((y <= thePlats[i].y) && (y >= thePlats[i].y - bWidth - speed)) &&
        ((x > thePlats[i].x) && (x < thePlats[i].x + thePlats[i].pWidth))) {
        //checking for speed increases the likelyhood that fast moving balls will hit the lower platforms without 
        //as many "false hits" for a set number
        if (speed > 0) {
          speed = -speed + ballReturn;
          lastHue = thePlats[i].pHue;
          lastSat = thePlats[i].pSat;
          lastBright = thePlats[i].pBright;
          lastAlpha = thePlats[i].pAlpha;
          hueFR = getColorFade(lastHue, defaultHue);
          satFR = getColorFade(lastSat, defaultSat);
          brightFR = getColorFade(lastBright, defaultBright);
          alphaFR = getColorFade(lastAlpha, defaultAlpha);
          bColor=color(lastHue, lastSat, lastBright, lastAlpha);
        }
      }
    }
  }
  
  int checkColor(int currentC, int defaultC, int fade) {
    if ((currentC > defaultC) || (currentC < defaultC)) {
      currentC -= fade;
      if (currentC<0) currentC=0;
      if (currentC>100)currentC=100;
    }
    return currentC;
  }
  
  int getColorFade(int c, int d) {
    return int((c-d)/colorFadeFrames);
  }
}

/*---------------/*---------------/*---------------/*---------------PLATFORMS */

class platform {
  int pWidth = getPlatWidth();
  int pHeight;
  int x, y;
  color pColor;
  int pHue;
  int pBright;
  int pSat;
  int pAlpha;
  int moveDir = 1;

  platform (int sX, int sY) {
    x = sX;
    y = sY;
    pColor = getColor();
    if(int(random(2)) == 1)moveDir *= -1; //random starting direction
  }

  void update() {
    x += moveRate*moveDir;
    if (x <= 0) {
      x =0;
      moveDir *= -1;
    }
    if (x >= width-pWidth) {
      x=width-pWidth;
      moveDir*=-1;
    }
    if (drawPlats) { 
      fill(pColor);
      rect(x, y, pWidth, pHeight);
      fill(defaultColor);
    }
  }

  color getColor() {
    pHue = (randomHue) ? randomColor(360) : defaultPHue;
    pSat = (randomSat) ? randomColor(100) : defaultPSat;
    pBright = (randomBright) ? randomColor(100) : defaultPBright;
    pAlpha = (randomAlpha) ? randomColor(100) : defaultPAlpha;
    return color(pHue, pSat, pBright, pAlpha);
  }

  int getPlatWidth() {
    int pW;
    if (randomPWidth) {
      pW = int(random(platMax));
      pHeight = int(map(pW, 0, platMax, 2, 20));
    } 
    else {
      pW = platMax;
      pHeight = 3;
    }
    return pW;
  }
  void defaultColors() {
      pColor = defaultPColor;
      pHue = defaultPHue;
      pSat = defaultPSat;
      pBright = defaultPBright;
      pAlpha = defaultPAlpha;
  }
  int randomColor(int divider) {
    int which = int(random(numColors));
    which *= int(divider/numColors);
    return which;
  }
}
//////-------------//////-------------//-------------//////----------------------SLIDER CLASS 
class slider {
  int X, Y, W, H;//slider dimentions
  boolean isHorizontal, showValue, isInt;
  float bX, bY, bW, bH;//button dimentions
  color buttonFill;
  float value;
  float Min, Max;
  String label,name;
  slider(int theX, int theY, int Width, int Height, float minValue, float maxValue, float initValue, String sliderName, boolean show, boolean Int) {
    X=theX;
    Y=theY;
    W=Width;
    H=Height;
    Min=minValue;
    Max=maxValue;
    name=sliderName;
    isHorizontal=(W>=H)?true:false;
    bW=(W>=H) ? H-2 : W-2;
    bH=(W>=H) ? H-2 : W-2;
    if (initValue<minValue) {initValue=minValue;}
    if (initValue>maxValue) {initValue=maxValue;}
    bX=(W>=H) ? map(initValue, Min, Max, X, W+X-bW) : X+1;
    bY=(W>=H) ? Y+1 : map(initValue, Min, Max, Y, H+Y-bH);
    buttonFill = color(127);
    value=initValue;
    showValue=show;
    isInt=Int;
  }
  void update() {
    checkMouse();
    stroke(1);
    fill(255);
    rect(X, Y, W, H);
    fill(buttonFill);
    rect(bX,bY,bW,bH);
    drawLabel();
  }
  void drawLabel() {
    label=(showValue) ? name+" = "+value : name;
    fill(0);
    if (isHorizontal) {
      textFont(gillsans, H);
      text(label, X+5, int(Y+(H*.8)));
    } else {
      textFont(gillsans, W);
      translate(X+Y,Y-X);
      rotate(PI/2);
      text(label, X+5, int(Y-(W*.2)));
      rotate(-PI/2);
      translate(-Y-X,X-Y);
    }
    noStroke();
  }
  void checkMouse() {
    if ((mousePressed)&&((mouseX>X)&&(mouseX<X+W)&&(mouseY>Y)&&(mouseY<Y+H))) {
      buttonFill= color(0);
      if (isHorizontal) {
        bX=constrain(mouseX-bW*.5, X, W+X-bW);
        value=constrain(map(bX, X, W+X-bW, Min, Max), Min, Max);
      } else {
        bY=constrain(mouseY-bH*.5, Y, H+Y-bH);
        value=constrain(map(bY, Y, H+Y-bH, Min, Max), Min, Max);
      }
      if (isInt) { value=int(value); }
    }
  }
  void defaultSetting() {
    buttonFill=color(127);
  }
}
//---------//---------//---------//---------//---------//---------Class Toggle
class toggle {
 int X, Y, W, H;
 boolean isSelected;
 String label;
 toggle(int x,int y,int w, boolean s, String name) {
   X=x;
   Y=y;
   W=w;
   isSelected = s;
   label=name;
   println(x+" "+y+" "+w+" "+s+" "+name);
 }
 void checkSelect() {
   if ((mouseX>X)&&(mouseX<X+W)&&(mouseY>Y)&&(mouseY<Y+W)) {
     isSelected=(isSelected) ? false : true;
   }
 }
 void update() {
   stroke(1);
   fill(255);
   ellipse(X,Y,W,W);
   if(isSelected) {
     fill(10);
     noStroke();
     ellipse(X,Y,W-3,W-3);
   }
   fill(255);
   textFont(gillsans, W);
   text(label, W+X, int(W*.5+Y));
   noStroke();
 }
}
void mouseReleased() {
  platformSpeed.defaultSetting();
  drawPlatforms.checkSelect();
}


