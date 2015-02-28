
float center;
float centerChangeX;
float centerChangeY;
float randColor1;
float randColor2;
float randColor3;
float arcStart;
float arcStop;
float moveTop;
float moveRight;
void setup(){
  size(500, 500);
  center = 1.5;
  moveTop = 25;
  moveRight = 25;
}
void draw(){
  background(255);
  noStroke();
  for(int i = 1; i <= 10; i++){
    fill(random(i, 255));
    ellipse((i * 50), (i * 50), (i * 50), (i * 50));
    ellipse(450 - (i * 40), 450 - (i * 50), (i * 50), (i * 50));
  }
  fill(0, 0, 0);
  ellipse(250, 250, 25, 25);
  randColor1 = random(1, 256);
  randColor2 = random(1, 256);
  randColor3 = random(1, 256);
  arcStart = radians(random(0, 360));
  arcStop = radians(random(0, 360));
  fill(randColor1, randColor2, randColor3);
  centerChangeX = random(1, 100);
  centerChangeY = random(1, 100);
  ellipse(250, 250, (center * centerChangeX), (center * centerChangeY));
  arc(50, 50, 50, 50, arcStart, arcStop);
  arc(450, 450, 50, 50, arcStart, arcStop);
  arc(50, 450, 50, 50, arcStart, arcStop);
  arc(450, 50, 50, 50, arcStart, arcStop);
  rect(50, 50, 400, 5);
  rect(50, 450, 400, 5);
  rect(50, 50, 5, 400);
  rect(450, 50, 5, 405);
  if(moveTop <= 425){
     moveTop += 25;
  }
  else{
    moveTop = 25;
  }
  if(moveTop % 2 == 1){
    rect(moveTop, 45, 25, 15);
    rect(moveTop, 445, 25, 15);
    
  }
  else{
    triangle(moveTop - 10, 50 , moveTop + 10, 50, moveTop, 15);
    triangle(moveTop - 10, 450 , moveTop + 10, 450, moveTop, 15);
  }
  if(moveRight <= 425){
    moveRight += 25;
  }
  else{
    moveRight = 25;
  }
  if(moveRight % 2 == 1){
    rect(45, moveRight, 15, 25);
    rect(445, moveRight, 15, 25);
  }
  else{
    triangle(50, moveRight - 10, 50, moveRight + 10, 50, moveRight);
    triangle(450, 450 - moveRight - 10, 450, 450 - moveRight + 10, 450, 450 - moveRight);
  }
}


