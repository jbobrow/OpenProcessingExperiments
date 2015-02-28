
int whiteX = 55;
int whiteY = 200;
boolean revWhiteX = false;
boolean revWhiteY = false;

int blackX = 450;
int blackY = 200;
boolean revBlackX = true;
boolean revBlackY = false;

void setup() {
  size(500, 500);
}

void draw() {
  background(116, 216, 240);
  //polkadots
  fill(126, 226, 245);
  noStroke();
  for(int i = 0; i < 25; i++ ) {
    for(int j = 0; j < 25; j++ ) {
      if(i%2 == 0) {
        if(j%2 == 0) {
         ellipse(i*20+10, j*20+10, 20, 20);
         }
      }else if(j%2 == 1) {
        ellipse(i*20+10, j*20+10, 20, 20);
      }
    }
    }
 //words
 textSize(75);
 for(int i = 0; i <8; i++) {
 if(i == 7) {
   fill(255);
 }else{
   fill(255, i*10);
 }
 text("SLOW KITTY", 25, i*9+50, 500, 500);
 } 
 for(int i = 0; i <8; i++) {
 if(i == 7) {
   fill(0);
 }else{
   fill(0, i*10);
 }
 text("FAST KITTY", 35, 200+i*20, 500, 500);
 } 
  //white one
  noStroke();
  fill(255);
  ellipse(whiteX, whiteY, 40, 40);
  //eyeballs
  fill(0);
  if(revWhiteX) {
    ellipse(whiteX-12, whiteY, 5, 5);
  }else{
    ellipse(whiteX+12, whiteY, 5, 5);
  }
  if(revWhiteY) {
    ellipse(whiteX, whiteY-12, 5, 5);
  }else{
    ellipse(whiteX, whiteY+12, 5, 5);
  }
  
  //ears
  fill(255);
  if(revWhiteX) {
    triangle(whiteX+27, whiteY, whiteX+18, whiteY+7, whiteX+18, whiteY-7);
  }else{
    triangle(whiteX-27, whiteY, whiteX-18, whiteY+7, whiteX-18, whiteY-7);
  }
  if(revWhiteY) {
    triangle(whiteX, whiteY+27, whiteX+7, whiteY+18, whiteX-7, whiteY+18);
  }else{
    triangle(whiteX, whiteY-27, whiteX+7, whiteY-18, whiteX-7, whiteY-18);
  }
  //white directions
  if(whiteX >= 480) {
    revWhiteX = true;
  }
  if(whiteX <= 20) {
    revWhiteX = false;
  }
  if(whiteY >= 480) {
    revWhiteY = true;
  }
  if(whiteY <= 20) {
    revWhiteY = false;
  }
  if(revWhiteX) {
    whiteX-=1;
  }else{
    whiteX+=1;
  }
  if(revWhiteY) {
    whiteY-=1;
  }else{
    whiteY+=1;
  }
  //black one
  fill(0);
  ellipse(blackX, blackY, 40, 40);
  //eyeballs
  fill(255);
  if(revBlackX) {
    ellipse(blackX-12, blackY, 5, 5);
  }else{
    ellipse(blackX+12, blackY, 5, 5);
  }
  if(revBlackY) {
    ellipse(blackX, blackY-12, 5, 5);
  }else{
    ellipse(blackX, blackY+12, 5, 5);
  }
  //ears
  fill(0);
  if(revBlackX) {
    triangle(blackX+27, blackY, blackX+18, blackY+7, blackX+18, blackY-7);
  }else{
    triangle(blackX-27, blackY, blackX-18, blackY+7, blackX-18, blackY-7);
  }
  if(revBlackY) {
    triangle(blackX, blackY+27, blackX+7, blackY+18, blackX-7, blackY+18);
  }else{
    triangle(blackX, blackY-27, blackX+7, blackY-18, blackX-7, blackY-18);
  }
  //black directions
  if(blackX >= 480) {
    revBlackX = true;
  }
  if(blackX <= 20) {
    revBlackX = false;
  }
  if(blackY >= 480) {
    revBlackY = true;
  }
  if(blackY <= 20) {
    revBlackY = false;
  }
  if(revBlackX) {
    blackX-=4;
  }else{
    blackX+=4;
  }
  if(revBlackY) {
    blackY-=5;
  }else{
    blackY+=5;
  }
  //cat bumpin
 if(abs(whiteX-blackX) <= 35 && abs(whiteY-blackY) <= 35) {
   if(whiteX > blackX) {
     revWhiteX = false;
     revBlackX = true;
   }else{
     revWhiteX = true;
     revBlackX = false;
   }
   if(whiteY > blackY) {
     revWhiteY = false;
     revBlackY = true;
   }else{
     revWhiteY = true;
     revBlackY = false;
   }
   
   /*if(revWhiteX) {
     revWhiteX = false;
   }else{
     revWhiteX = true;
   }
   if(revWhiteY) {
     revWhiteY = false;
   }else{
     revWhiteY = true;
   }
   if(revBlackX) {
     revBlackX = false;
   }else{
     revBlackX = true;
   }
   if(revBlackY) {
     revBlackY = false;
   }else{
     revBlackY = true;
   }*/
 } 
}
