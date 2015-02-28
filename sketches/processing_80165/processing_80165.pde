
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/80165*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage snowball, snowballL, snowballT, baby, cupid, kitty, granny, b1, b2, b3, win, lose;

int numOfSb= 1;
Snowball[] snowballs = new Snowball[1];

int cupid1 = round(random(60, 180));
int cupidLoc = 0;
int cupidStay= 0;

int ballX = 540;
int ballY = 620;
int gLocX = 550;
int gLocY= 355;
int kLocX=1100;
int kLocY=385;
int bLocY=400;
int bLocX=200;
int cLocX=100;
int cLocY=100;

int sizeX = 800;
int sizeY = 800;
int sp = 10;
int score = 0;

class Snowball {
  int ballTx, ballTy, sp; 
  Snowball(int x, int y, int s) {
    ballTx = x;
    ballTy = y; 
    sp = s; 
  }
  
  void update() {
    
      if (ballTy > 370){
        image(snowball, ballTx, ballTy);
        ballTy-=15;
      }
        
        if (dist(ballTx, ballTy, gLocX, gLocY)<50){
           ballTy = -200;
           ballTx = -200;
          sp = 0;
          
          if(cLocX==gLocX){
          fill(200,0,0);
          rect(0,0,width,height);
          score--;
          } else {
          fill(0,200,200);
          rect(0,0,width,height);
          score++;
          }
    }
    if (dist(ballTx, ballTy, bLocX, bLocY)<50){
           ballTy = -200;
           ballTx = -200;
           sp = 0;
           
          if(cLocX==bLocX){
          fill(200,0,0);
          rect(0,0,width,height);
          score--;
          } else {
          fill(0,200,200);
          rect(0,0,width,height);
          score++;
          }
    }
    
    if (dist(ballTx, ballTy, kLocX, kLocY)<50){
           ballTy = -200;
           ballTx = -200;
          sp = 0;
          
          if(cLocX==kLocX){
          fill(200,0,0);
          rect(0,0,width,height);
          score--;
          } else {
          fill(0,200,200);
          rect(0,0,width,height);
          score++;
          }
    }
  }
}

void setup(){
  size(1280,720);
  snowballT= loadImage("snowballL.gif");
  snowballL= loadImage("snowballL.gif");
  snowball = loadImage("snowball.gif");
  baby = loadImage("baby.gif");
  cupid = loadImage("cupid.gif");
  kitty = loadImage("kitty.gif");
  granny = loadImage("granny.gif");
  b1 = loadImage("topLayer.gif");
  b2 = loadImage("midLayer.gif");
  b3 = loadImage("rearLayer.gif");
  win = loadImage("win.gif");
  lose = loadImage("lose.gif");
  snowballs[0] = new Snowball(-200,-200,10);
}

void mouseClicked () {
  Snowball b = new Snowball(ballX+50, ballY, sp);
  snowballs = (Snowball[]) append(snowballs, b);
  numOfSb++;
  
}

int cupidCount = 60;

void draw() {
  if (score == - 5) {
    image(lose, 0,0);
  } else if (score == 20) {
    image(win, 0, 0);
  } else {
    
  cupidCount--;
  image(b3, 0, 0);
  image(kitty, 1100,385);
  image(granny, 550, 355);
  image(b1, 0, 0);
  image(baby, 200, 400);
  
  if (cupidCount == 0) {
    cupidLoc = ceil(random(0,3));
    cupidCount = 80;
  }
  
  switch(cupidLoc){
    case 1:
    image(cupid, bLocX, bLocY);
    cLocX=bLocX;
    cLocY=bLocY;
    break;
    
    case 2:
    image(cupid, gLocX, gLocY);
    cLocX=gLocX;
    cLocY=gLocY;
    break;
    
    case 3:
    image(cupid, kLocX, kLocY);
    cLocX=kLocX;
    cLocY=kLocY;
    break;
    
  }
  
  for (int i = 0; i<numOfSb; i++){
    snowballs[i].update();
  }
    
  image(snowballL, ballX, ballY);
  
  if (keyPressed == true) {
    if (key == 'd' || key == 'D'){
      if (ballX<1205) { ballX=ballX+15; } 
    }
    
    if (key == 'a' || key == 'A'){
      if (ballX>80) { ballX=ballX-15; }
    }
  }
}
}

 



