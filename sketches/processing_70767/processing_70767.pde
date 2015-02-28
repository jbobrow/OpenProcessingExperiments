
Comet[] comets;
int lineX1[];
int lineX2[];
int lineY1[];
int lineY2[];
int starX[];
int starY[];
int arrayCount;
int shading;
int touchstoneX;
int touchstoneY;
int prevTouchstoneX;
int prevTouchstoneY;
boolean activate;
boolean restart;

void setup() {
  size(500, 500);

  arrayCount = 0;
  activate = false;
  restart = false;

  comets = new Comet[4];
  lineX1 = new int[9001];
  lineX2 = new int[9001];
  lineY1 = new int[9001];
  lineY2 = new int[9001];
  starX = new int [9];
  starY = new int [9];

  touchstoneX = 0;
  touchstoneY = 0;

  for (int i = 0; i < starX.length; i++) {
    starX[i] = int(random (0, 500)); 
    starY[i] = int(random (0, 500));
  }

  comets[0] = new Comet(random(0, 500), random(750, 1250), 0, random (2, 4), -1);
  comets[1] = new Comet(random(0, 500), random(-250, -750), 0, random (2, 4), 1);
  comets[2] = new Comet(random(-250, -750), random(0, 500), random (2, 4), 0, 1);
  comets[3] = new Comet(random(750, 1250), random(0, 500), random(2, 4), 0, -1);
}

void draw() {
  stroke (255, 255, 255);
  fill(0, 0, 0, 35);
  rect(0, 0, 500, 500);

  fill(125, 125, 150, 100);
  for (int i = 0; i < comets.length; i++) {
    comets[i].update();
    comets[i].lineCheck();
  }

  int shading = int(random(150, 255));
  fill(shading, shading, shading);

  for (int i = 0; i < starX.length; i++) {
    ellipse (starX[i], starY[i], 10, 10);
  }

  for (int i = 0; i < starX.length; i++) {
    if (mouseX > (starX[i] - 5) && mouseX < (starX[i] + 5) && mouseY > (starY[i] - 5) && mouseY < (starY[i] + 5)) {
      if (activate == false) {
        touchstoneX = starX[i];
        touchstoneY = starY[i];
        activate = true;
      }
      else {
        prevTouchstoneX = touchstoneX;
        prevTouchstoneY = touchstoneY;
        touchstoneX = starX[i];
        touchstoneY = starY[i];
        lineX1[arrayCount] = prevTouchstoneX;
        lineY1[arrayCount] = prevTouchstoneY;
        lineX2[arrayCount] = starX[i];
        lineY2[arrayCount] = starY[i];
        arrayCount = arrayCount +1;
      } 
    }
  }

  for (int i = 0; i < lineX1.length; i++) {
    line(lineX1[i], lineY1[i], lineX2[i], lineY2[i]);
  }


  if (activate == true) {
    line(touchstoneX, touchstoneY, mouseX, mouseY);
  }

  if (keyPressed && key == ENTER) {
    restart = true;
  }

  if (restart == true) {
    fill (0, 0, 0);
    rect(0, 0, width, height);

    arrayCount = 0;
    activate = false;
    restart = false;

    touchstoneX = 0;
    touchstoneY = 0;

    for (int i = 0; i < starX.length; i++) {
      starX[i] = int(random (0, 500)); 
      starY[i] = int(random (0, 500));
    }

    comets[0] = new Comet(random(0, 500), random(750, 1250), 0, random (2, 4), -1);
    comets[1] = new Comet(random(0, 500), random(-250, -750), 0, random (2, 4), 1);
    comets[2] = new Comet(random(-250, -750), random(0, 500), random (2, 4), 0, 1);
    comets[3] = new Comet(random(750, 1250), random(0, 500), random(2, 4), 0, -1);

    for (int i = 0; i < lineX1.length; i++) {
      lineX1[i] = 0;
      lineX2[i] = 0;
      lineY1[i] = 0;
      lineY2[i] = 0;
    }
  }
}


class Comet {

  //Properties
  float x;
  float y;
  float velX;
  float velY;
  int posNeg;

  //Constructor
  Comet (float _x, float _y, float _velX, float _velY, int _posNeg) {
    this.x = _x;
    this.y = _y;
    this.posNeg = _posNeg;
    this.velX = _velX * posNeg;
    this.velY = _velY * posNeg;
    
  }



  //Functions
  void update() {
    ellipse(x, y, 20, 20);
    x = x + velX;
    y = y + velY;
    
    if(x > 1250 || x < -750){
       x = random (500, 750) * -posNeg; 
       y = random (0, 500) * -posNeg;
       velX = random(2, 4) * posNeg;
    }
    
    if(y > 1250 || y < -750){
      y = random (500, 750) * -posNeg;
      x = random (0, 500) * -posNeg;
      velY = random (2, 4) * posNeg;
    }
  }
  
  void lineCheck(){
    for (int i = 0; i < lineX1.length; i++) {
      if(x > (lineX1[i] - 1) && x < (lineX2[i] + 1) && y > (lineY1[i] - 1) && y < (lineY2[i] + 1)){
        lineX1[i] = 0;
        lineX2[i] = 0;
        lineY1[i] = 0;
        lineY2[i] = 0;
        fill(255, 255, 0, 150);
        rect(0, 0, width, height);
      }
      if(x > (lineX1[i] - 1) && x < (lineX2[i] + 1) && y > (lineY2[i] - 1) && y < (lineY1[i] + 1)){
        lineX1[i] = 0;
        lineX2[i] = 0;
        lineY1[i] = 0;
        lineY2[i] = 0;
        fill(255, 255, 0, 150);
        rect(0, 0, width, height);
      }
      if(x > (lineX2[i] - 1) && x < (lineX1[i] + 1) && y > (lineY1[i] - 1) && y < (lineY2[i] + 1)){
        lineX1[i] = 0;
        lineX2[i] = 0;
        lineY1[i] = 0;
        lineY2[i] = 0;
        fill(255, 255, 0, 150);
        rect(0, 0, width, height);
      }
      if(x > (lineX2[i] - 1) && x < (lineX1[i] + 1) && y > (lineY2[i] - 1) && y < (lineY1[i] + 1)){
        lineX1[i] = 0;
        lineX2[i] = 0;
        lineY1[i] = 0;
        lineY2[i] = 0;
        fill(255, 255, 0, 150);
        rect(0, 0, width, height);
      }
    }
  }
}
