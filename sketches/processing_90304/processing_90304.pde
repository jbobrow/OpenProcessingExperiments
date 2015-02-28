
int pH = 100;
int pX = 60;
int pW = 30;
int pY = 200;
int pSpeed = 0;
int win =3;
float a=0;
float del=1.57;
float b=0.003;



int pHr = 100;
int pXr = 660;
int pWr = 30;
int pYr = 200;
int pSpeedr = 0;

int ballX = 100;
int ballY = 250;
int R = 15;
int xSpeed = 6;
int ySpeed = 6;
char keychk;
int bar =1;
int bY =0;
int bX =0;
int right=0;
int left=0;
int e = 1; //<div of ball radius-1,2,3 change for 
//ball passing through paddle

void setup() {
  size(750, 500);
  textSize(20);
  strokeWeight(4);
  
}
void draw() {
   noFill();

  a = (a+b) % TWO_PI; 
  float clr1 = (sin(a)+1)*128;
  float clr2 = (sin(a+del)+1)*128;
  float clr3 = (sin(a+del*2)+1)*128;
  background(clr1,clr2,clr3);
  text(left,10,25);
  text(right,730,25);
  pY +=pSpeed;
  rect(pX, pY, pW, pH);
////rrrrrrr  
  pYr +=pSpeedr;
  rect(pXr, pYr, pWr, pHr);
////rrrrrrrrr  
      
if (ballX<375&&((mouseY-pmouseY)*ySpeed)<=0||((pSpeed*ySpeed)<=0)){
bY=2; bX=0;
} 
else if(ballX<375&&((mouseY-pmouseY)*ySpeed)>=0||((pSpeed*ySpeed)>=0)){
bY=-1; bX=3;
}
//////rrrrrrrrr
else if (ballX>375&&((mouseY-pmouseY)*ySpeed)<=0||((pSpeedr*ySpeed)<=0)){
bY=2; bX=0;
} 
else if(ballX>75&&((mouseY-pmouseY)*ySpeed)>=0||((pSpeedr*ySpeed)>=0)){
bY=-1; bX=3;
}
///////rrrrrrr
else{bY=0; bX=0;}


println("bY="+bY+" bX="+bX+" xSpeed="
+xSpeed+" ySpeed="+ySpeed+" left="+left+" right="+right);

if (ySpeed<0){ySpeed=constrain(ySpeed,-20,-6);}
  else if(ySpeed>0){ySpeed=constrain(ySpeed,6,20);}
if (xSpeed<0){xSpeed=constrain(xSpeed,-20,-6);}
  else if(xSpeed>0){xSpeed=constrain(xSpeed,6,20);}

if (pY<=0||(pY+pH)>=height) {
    pSpeed=0;
    }
////////////bounce
/////lpaddleface
  if (xSpeed<0&&ballY>=pY&&ballY<=(pY+pH)
    &&(ballX-R)<=(pX+pW)&&(ballX-R/2)>(pX+pW)) {
    xSpeed=-xSpeed+bX; ySpeed=ySpeed+bY;
  }
  /////rrrr\/rpaddleface
   else if (xSpeed>0&&ballY>=pYr&&ballY<=(pYr+pHr)
    &&(ballX+R)>=pXr&&(ballX+R/2)<(pXr+pWr)) {
    xSpeed=-xSpeed+bX; ySpeed=ySpeed+bY;
  }
  /////rrrr/\rpaddleface
 
 /////lbackpaddle
  else  if (xSpeed>0&&ballY>=pY&&ballY<=(pY+pH)
    &&(ballX+R)>=pX&&(ballX+R/2)<pX) {
    xSpeed=-xSpeed+bX; ySpeed=ySpeed+bY;
  }

   /////rrrrr\/rbackpaddle
  else  if (xSpeed<0&&ballY>=pYr&&ballY<=(pYr+pHr)
    &&(ballX-R)<=(pXr+pWr)&&(ballX-R/2)>(pXr+pWr)) {
    xSpeed=-xSpeed+bX; ySpeed=ySpeed+bY;
  }
  //////rrrr/\rbackpaddle

  else if ((ballX-R)<=0&&ySpeed>=0) {
      ballX=375;ballY=250; xSpeed=-6; ySpeed=0; right=right+1;}
  else if ((ballX-R)<=0&&ySpeed<=0) {
      ballX=375;ballY=250; xSpeed=-6; ySpeed=0;right=right+1;}
  else if ((ballX+R)>width&&ySpeed>=0) {
      ballX=375;ballY=250; xSpeed=6; ySpeed=0;left=left+1;}
  else if ((ballX+R)>width&&ySpeed<=0) {
      ballX=375;ballY=250; xSpeed=6; ySpeed=0;left=left+1;}
  if (left>=10)win=0;
  else if (right>=10)win=1;
  if (left==10||left==0&&win==0){text("LEFT WINS!!!",350,50);left=0; right=0; b=.3;}    
  else if (right==10||right==0&&win==1){text("RIGHT WINS!!!",350,50);left=0; right=0;b=.3;}    
  else {b=0.003;}


////ltoppaddle
  if (ySpeed>0&&ballY<pY&&(ballY+R)>=pY&&
    (ballX-R/e)<=(pX+pW)&&(ballX+R/e)>=pX) {
    ySpeed=-ySpeed;
  }
  
  /////rrrr\/rtoppaddle
  else if (ySpeed>0&&ballY<pYr&&(ballY+R)>=pYr&&
    (ballX-R/e)<=(pXr+pWr)&&(ballX+R/e)>=pXr) {
    ySpeed=-ySpeed;
  }
  ///////rrrr/\rtoppaddle
  
  
///lbottompaddle
  else if (ySpeed<0&&ballY>(pY+pH)&&(ballY-R)<=(pY+pH)&&
    (ballX-R/e)<=(pX+pW)&&(ballX+R/e)>=pX) {
    ySpeed=-ySpeed;
  }
  
  ////rrrrrbottompaddle\/rrrrr
  else if (ySpeed<0&&ballY>(pYr+pHr)&&(ballY-R)<=(pYr+pHr)&&
    (ballX-R/e)<=(pXr+pWr)&&(ballX+R/e)>=pXr) {
    ySpeed=-ySpeed;
  }
  ////rrrrrbottompaddle/\rrrrr
  
  
  else if ((ballY-R)<=0||(ballY+R)>=height) {
    ySpeed=-ySpeed;
  }


  ballX +=xSpeed;
  ballY +=ySpeed;
  ellipse(ballX, ballY, 30, 30);
}

void mouseMoved() {
  pYr=constrain(mouseY, 0, (height-pHr));
}

void keyPressed() {
  keychk=key;
  if (key == 'q'&&pY>0) {
    pSpeed = -15;
  }
  else if (key =='a'&&(pY+pH)<height)
  {
    pSpeed = 15;
  }
  else if (key==' ') {
    bar=abs(bar-1);
    
  }
}

void keyReleased() {
  if (key==keychk) {
    pSpeed = 0;
  }
}






