
float bob=300;
float mary=100;
float posX = 320;
float posY = 240;
float enemyPosX = 40;
float enemyPosY = 40;
float circleSize = 40;
float playerEase = 20;
float enemyEase = 40;

void setup(){
size(640,480);
frameRate(60);
smooth();
background(0);
}

void draw(){
  
  if(mousePressed){
    posX = tween(posX,mouseX,playerEase);
    posY = tween(posY,mouseY,playerEase);
    strokeWeight(5);
    stroke(255,0,0);
    point(mouseX,mouseY);
    strokeWeight(40);
    line(320,240,mouseX,mouseY);
  }
  
  stroke(255,0,0,128);
  strokeWeight(70);
  point(bob,mary);
  mary++;
  stroke(255,0,0,128);
  strokeWeight(20);
  point(400,mary);
  mary+=random(0,2);
  stroke(255,0,0,128);
  strokeWeight(40);
  point(200,mary);
  mary++;

  stroke(255,0,0);
point(mouseX,mouseY);
  noStroke();
  fill(0,20);
  rectMode(CORNER);
  rect(0,0,width,height);
  
  noStroke();
  fill(255,0,0);
  strokeWeight(1);
  stroke(0,0,255);
  ellipseMode(CENTER);
  ellipse(posX,posY,circleSize,circleSize);
  enemyPosX = tween(enemyPosX,posX,enemyEase);
  enemyPosY = tween(enemyPosY,posY,enemyEase);

  //chase2
  strokeWeight(4);
  stroke(255,0,0);
  ellipse(enemyPosX,enemyPosY,circleSize,circleSize);
  strokeWeight(2);
  stroke(0,0,255);
  fill(255,0,0);
  ellipse(enemyPosX,enemyPosY,circleSize,circleSize);
 
 
}

//[[user:N1ckFG|1329336287]][[user:N1ckFG|1329336287]]
 
float tween(float v1, float v2, float e) {
  v1 += (v2-v1)/e;
  return v1;
}
 
boolean hitDetect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
  w1 /= 2;
  h1 /= 2;
  w2 /= 2;
  h2 /= 2; 
  if(x1 + w1 >= x2 - w2 && x1 - w1 <= x2 + w2 && y1 + h1 >= y2 - h2 && y1 - h1 <= y2 + h2) {
    return true;
  } 
  else {
    return false;
  }
}
 

