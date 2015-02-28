
PShape word;
float up, down, left, right, targetUp, 
targetDown, targetLeft, targetRight, wordW, wordH;
float upNum, downNum, leftNum, rightNum;
float clickNum, wordX, wordY, targetX, targetY, targetW, targetH;



void setup(){

  size(400, 400);
  word = loadShape("word.svg");
  smooth();
  shapeMode(CENTER);
  wordW = 280;
  targetW = 280;
  wordH = 160;
  targetH = 160;
  wordX = width/2;
  targetX = width/2;
  wordY = height/2;
  targetY = height/2;
  
}

void draw(){
  
  background(255);
  
  shape(word, wordX, wordY, wordW, wordH);
  background(255, 50);
  shape(word, wordX + random(0, clickNum*1.5), wordY+random(0, clickNum*1.5), wordW, wordH);
  
  fill(0);
  rect(0, 0, width, up);
  rect(0, height - down, width, down);
  rect(0, 0, left, height);
  rect(width - right, 0, right, height); 
  
  update();
}

void mouseClicked(){
  
  clickNum++;

  if(clickNum%4 == 1){
   upNum ++; 
    //if(upNum > 3){
     //targetY = height/2 + 20;
     //targetH = targetH-40;
  // }
  }
  if(clickNum%4 == 2){
   rightNum++; 
   // if(rightNum > 3){
    // targetX = width/2 - 10;
    // targetW = targetW - 20;
  // }
  }
  if(clickNum%4 == 3){
    downNum++;
    // if(downNum > 3){
    // targetY = height/2 - 20;
   //  targetH = targetH - 40;
  // }
  }
  if(clickNum%4 == 0){
   leftNum++; 
   //  if(leftNum > 3){
    // targetX = width/2 + 10;
   //  targetW = targetW - 20;
 //  }
  }

  targetUp = 40*upNum;
  targetDown = 40*downNum;
  targetLeft = 20*leftNum;
  targetRight = 20*rightNum;
  
  println("up: "+upNum);
  println("right: "+rightNum);
  println("down: " + downNum);
  println("left: " + leftNum);
}

void update(){
 
  up = up + (targetUp - up) * 0.05;
  down = down + (targetDown - down) * 0.05;
  right = right + (targetRight - right) * 0.05;
  left = left + (targetLeft - left) * 0.05;
  
  wordX = wordX + (targetX - wordX) * 0.05;
  wordY = wordY + (targetY - wordY) * 0.05;
  wordH = wordH + (targetH - wordH) * 0.05;
  wordW = wordW+ (targetW - wordW) * 0.05;
}


