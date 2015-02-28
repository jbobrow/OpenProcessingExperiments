
void setup() {
  size(500, 500);
  background(0, 10, 100, 150);
}

float centerX = 250;
float centerXLeft = 150;
float centerXRight = 350;
float centerY = 250;
float centerYUp = 100;
float centerYDown = 280;
int i = 2000;
void draw() {

  if (mousePressed == true) {
    centerXLeft = centerX-random(150);
    centerXRight = centerX+random(350);
    centerYUp = centerY-random(100);
    centerYDown = centerY+random(40);
    drawCloud();
    i = 2000;
  }
}
void drawCloud() {

  float randX = random(500);
  float randY = random (500);
  float randomTest;
  float cutOff;
  float size = 50;


  for (; i>0; i--) {
    randX = random(500);
    randY = random(500);
    randomTest = random(1.0);
    
    float probability = 1.0f;
    if( randX < centerX )
      probability = min( probability, map( randX, centerXLeft, centerX, 0.0, 1.0 ) );
    if( randX >= centerX )
      probability = min( probability, map( randX, centerX, centerXRight, 1.0, 0.0 ) );
    if( randY < centerY )
      probability = min( probability, map( randY, centerYUp, centerY, 0, 1 ) );
    if( randY >= centerY )
      probability = min( probability, map( randY, centerY, centerYDown, 1, 0 ) );
    float distToCenter = sqrt(((randX-centerX) * (randX-centerX)) + ((randY-centerY) * (randY-centerY)));
    probability = min( probability, map( distToCenter, 0, 150, 1.0, 0.0 ) );
    
    if( randomTest > probability )
      continue;

    /*    fill(255,12);
     ellipse(randX,randY,size,size);
     if (size>1){
     randX = randX + random(-size,size);
     randY = randY + random(-size/2, size/4);
     cutOff = random(10);
     size -= cutOff;
     if(size<1){
     size = 1;
     }
     */
     
     noStroke();
        fill(random(255), 10);
        size = random(random(100));
        ellipse(randX, randY, size, size);

    /*if (randX>centerXLeft&&randX<centerXRight&&randY>centerYUp&&randY<centerYDown) {
      if (randY>centerX-50&&randY<centerX+50&&randY>centerY-50&&randY<centerY+10) {
        noStroke();
        fill(255, 10);
        size = random(4);
        ellipse(randX, randY, size, size);
        drawCloud();
      }
      if (randomTest>0.5) {
        noStroke();
        fill(255, 10);
        size = random(7);
        ellipse(randX, randY, size, size);
      }
    }*/
  }
}



