
float backPosX =0;
float backPosY=0;
float speedX=1;
float speedY=1;
float shake=0;

void setup() {
  size(700,400);
}

void draw() {
  background(255);
  noStroke();
  
  rect(backPosX, backPosY, width,height);

  //   println(speedX);
  if (mousePressed== true) {
    backPosX +=mouseX- pmouseX ;
    backPosY += mouseY- pmouseY;
    
  }
  else {

    backPosX=backPosX-speedX;
    backPosY=backPosY-speedY;
    if(backPosX<0 && speedX>0) {
      backPosX=0;
        speedX=0;
        fill(224,64,28);
        
    }
    if(backPosY<0 && speedY>0) {
      backPosY=0; 
      speedY=0;
      fill(229,176,81);
    }
    if(backPosX>0 && speedX<0) {
      backPosX=0; 
      speedX=0;
      fill(39,47,48);
    }
    if(backPosY>0 && speedY<0) {
      backPosY=0; 
      speedY=0;
      fill(247,237,183);
    }
  }
}


void mouseReleased() {
  speedX=backPosX/15;
  speedY=backPosY/15;
}


