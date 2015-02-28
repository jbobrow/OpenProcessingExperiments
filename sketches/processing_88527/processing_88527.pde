
int frameMax = 10;
int frame = 0;
int miniFrame = 0;
int miniMax = 30;
int walkCyc = 0;
int explFrame = 7;
void setup(){
  size(800, 800);
}
void draw(){
  drawBackGround();
  drawPlane(frame);
  drawTree(frame);
  if(frame < explFrame){
  drawLandMine(frame);
  drawManWalk(frame, walkCyc);
  }
  else if(frame == explFrame)
  {
    drawExplosion();
  }
  miniFrame++;
  if(miniFrame >= miniMax){
    frame++;
    miniFrame = 0;
    walkCyc++;
  }
  if(walkCyc >= 4){
    walkCyc = 0;
  }
  if(frame >= frameMax){
    frame = 0;
  }
  println(frame);
}
void drawBackGround(){
  background(0, 191,255);
  fill(173, 255,47);
  rect(-1, 300, 900, 900);
}
void drawTree(int frameNum){
  int initLoc = 600;
  int offset = frameNum * 100;
  int loc = initLoc - offset;
  fill(160, 82, 45);
  rect(loc, 100, 50, 200);
  fill(46, 139,87);
  ellipse(loc + 25, 65, 100, 100);
}
void drawManWalk(int frameNum, int walkNum){
  fill(0);
  int initLoc = 100;
  int heightOffset = 30;
  loc = initLoc + (frameNum * 100);
  if(walkNum == 1 || walkNum == 3)
  {
    rect(loc, 600 + heightOffset , 10, 150 - heightOffset);
    ellipse(loc + 10, 580 + heightOffset, 70, 70);
    rect(loc - 40, 640 + heightOffset, 90, 10);
    fill(220, 220, 220);
    ellipse(loc + 5, 750, 50, 50);
  }
  else{
    
  rect(loc, 600, 10, 150);
  ellipse(loc + 10, 580, 70, 70);
  rect(loc - 40, 640, 90, 10);
  fill(220, 220, 220);
  ellipse(loc + 5, 750, 50, 50);
  }
  fill(0);
  if(walkNum == 0){
    rect(loc + 5, 746, 25, 6); 
  }
 else if(walkNum == 1){
  rect(loc + 3, 746, 6, 28);  
 }
 else if(walkNum == 2){
   rect(loc - 20, 746, 25, 6);
 }
 else{
   rect(loc + 2, 725, 6, 25);
 }
}
void drawLandMine(int frameNum){

    fill(200, 200, 200);
    rect(690, 750, 20, 5);
    ellipse(700, 750, 20, 10);
    if(frameNum % 2 == 1){
      noStroke();
      fill(255, 0, 0);
      ellipse(700, 750, 5, 5);
      stroke(0);
    }
}
void drawExplosion(){
  fill(255, 0, 0);
  for(int i = 0; i <= 5; i++){
    if(i == 0){
      fill(255, 0, 0);
    }
    else if(i == 1){
      fill(255, 165, 0);
    }
    else if(i == 2){
      fill(255, 99, 71);
    }
    else if(i == 3){
      fill(210, 105, 30);
    }
    else if(i == 4){
      fill(178, 34, 34);
    }
    else{
      fill(255, 69, 0);
    }
    triangle((500 +(random(50, 200))), (700 + random(0, 150)), (600 + random(100, 150)), (710 + random(0, 50)), (410 + random(200, 300)), (600 + random(50, 200)));
  }
}
void drawPlane(int frameNum){
  int initLoc = 400;
  int loc = initLoc - (50 * frameNum);
  fill(137, 137, 137);  
  quad(loc + 15, 100, loc + 20, 100, loc + 35, 85, loc + 30, 85);
  ellipse(loc, 100, 40, 10);
  fill(170, 170, 170);
  ellipse(loc, 100, 15, 5);
  fill(0, 0, 205);
  triangle(loc - 20, 100, loc - 10, 100, loc - 10, 95);
}



