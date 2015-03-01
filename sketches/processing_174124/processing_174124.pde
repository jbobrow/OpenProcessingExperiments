
int timeInterval = 20;
int sizeHor = 50;
int sizeVert = 40;
int timer;
int[] wormX, wormY;
int wormSize = 16;
int xVel, yVel;
int wormLength = 3;
int state;
int expandSquareX, expandSquareY;
int spiderX, spiderY;
int spiderVelX, spiderVelY;
//int wid_, hei_;



void setup(){
  timer = 0;
  wormX = new int[wormLength];
  wormY = new int[wormLength];
  timeInterval = 20;
  //wid_ = ;
  //hei_ = ;
  //size(wormSize * (sizeHor + 1), wormSize * (sizeVert + 1));
  size(800, 600);
  state = 3;
  //score = 0;
  
  for(int i = 0; i < wormLength; i++){
    wormX[i] = width/2;
    wormY[i] = height/2 + i * wormSize;
  }
  createExpandSquare();
  createSpider();
  
  xVel = 0;
  yVel = -1;
  
}

void draw(){
  background(255);
  fill(0);
  wormDisplay();
  expandSquareDisplay();
  spiderDisplay();
  onTimer();
}

void wormDisplay(){
  rectMode(CENTER);
  stroke(0);
  strokeWeight(2);
  fill(0, 220);
  rect(wormX[0], wormY[0], wormSize, wormSize, wormSize/3);
  fill(0, 50);
  for(int i = 1; i < wormX.length; i++){
    rect(wormX[i], wormY[i], wormSize, wormSize, wormSize/3);
  }
}

void expandSquareDisplay(){
  stroke(0, 255, 0);
  strokeWeight(2);
  fill(0, 255, 0, 120);
  rect(expandSquareX, expandSquareY, wormSize, wormSize, wormSize/3);
}

void spiderDisplay(){
  stroke(255, 0, 0);
  strokeWeight(2);
  fill(255, 0, 0, 120);
  rect(spiderX, spiderY, wormSize, wormSize, wormSize/3);
}

void onTimer(){
    timer++;
    timer %= 4 * timeInterval;
    if(checkCollision()){
      state = 0;
    }
    if((timer % timeInterval == 0) && state != 0){
      if(expandHit()){
      //println(wormY[0] + " " + expandSquareY);
      createExpandSquare();
      expandSnake();
      if(wormX.length % 5 == 0){
        speedUp(0.9);
      }
      }
      if(spiderHeadCollision()){
        spiderEat();
        speedUp(0.7);
        createSpider();
      }
      for(int i = wormX.length - 1; i > 0; i--){
        wormX[i] = wormX[i-1];
        wormY[i] = wormY[i-1];
      }
      wormX[0] += wormSize * xVel;
      wormX[0] = mod(wormX[0], width);
      wormY[0] += wormSize * yVel;
      wormY[0] = mod(wormY[0], height);
    }
    if(timer == 0){
      spiderX += wormSize * spiderVelX;
      spiderX = mod(spiderX, width);
      spiderY = mod(spiderY, height);
      spiderY += wormSize * spiderVelY;
      spiderVelX = int(random(-2, 2));
      spiderVelY = int(random(-2, 2));
    }
}

void keyPressed(){
  if(key == 'w'){
    yVel = -1;
    xVel = 0;
  }
  if(key == 's'){
    yVel = 1;
    xVel = 0;
  }
  if(key == 'a'){
    xVel = -1;
    yVel = 0;
  }
  if(key == 'd'){
    xVel = 1;
    yVel = 0;
  }
}

int mod(int a, int b){
  return a > 0 ? a % b : a % b + b;
}

boolean checkCollision(){
  boolean answer = false;
  for(int i = 1; i < wormX.length; i++){
    if(wormX[0] == wormX[i] && wormY[0] == wormY[i] 
            || spiderX == wormX[i] && spiderY == wormY[i]){
 // if(spiderX == wormX[i] && spiderY == wormY[i]){
      answer = true;
    }
  }
  return answer;
}

boolean spiderHeadCollision(){
  return (spiderX == wormX[0] && spiderY == wormY[0] || spiderX == wormX[1] && spiderY == wormY[1] );
}

void spiderEat(){
  for(int i = 0; i < 5; i++){
    expandSnake();
    
  }
}

boolean expandHit(){
  return (expandSquareX == wormX[wormX.length - 1] && expandSquareY == wormY[wormY.length - 1]);
}

void speedUp(float factor){
  timeInterval = int(factor * timeInterval);
}


void expandSnake(){
  //createExpandSquare();
  wormX = append(wormX, 2 * wormX[wormX.length - 1] -  wormX[wormX.length - 2]);
  wormY = append(wormY, 2 * wormY[wormY.length - 1] -  wormY[wormY.length - 2]);
}
void createExpandSquare(){
  expandSquareX = int(wormSize * (int(random(0, sizeHor)) + 0.5));
  expandSquareY = int(wormSize * (int(random(0, sizeVert)) + 0.5));
}

void createSpider(){
  spiderX = int(wormSize * (int(random(0, sizeHor)) + 0.5));
  spiderY = int(wormSize * (int(random(0, sizeVert)) + 0.5));
  boolean  safeStart = true;
  for(int i = 0; i < wormX.length; i++){
    if(abs(spiderX - wormX[i]) < 2 * (wormX.length - i) 
                  && abs(spiderY - wormY[i]) < 2 * (wormX.length - i)){
      safeStart = false;
      break;
    }
  }
  while(!safeStart){
    spiderX = int(wormSize * (int(random(0, sizeHor)) + 0.5));
    spiderY = int(wormSize * (int(random(0, sizeVert)) + 0.5));
    safeStart = true;
    for(int i = 0; i < wormX.length; i++){
      if(abs(spiderX - wormX[i]) < 2 * (wormX.length - i) * wormSize 
                && abs(spiderY - wormY[i]) < 2 * (wormX.length - i)*wormSize){
        safeStart = false;
        break;
      }
    }
  }
  spiderVelX = int(random(-1, 2));
  spiderVelY = int(random(-1, 2));
}


void mouseClicked(){
  setup();
}


