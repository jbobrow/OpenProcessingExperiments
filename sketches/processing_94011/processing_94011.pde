
PImage dragon;
int bally=320;
int speed=1;
int rectx=200;
int rectw=100;
int recth=30;
int recty=390;
int ballx=220;
int ballw=30;
int ballh=30;
int squares=300;

void setup() {
  size(400, 400);
  dragon=loadImage("dragon.gif");
}

void draw() {
  image(dragon, 1, 1, 400, 400);
  fill(0, 150, 255);
  rect(rectx, recty, rectw, recth);//paddle

  fill(255, 100, 240);
  ellipse(ballx, bally, ballw, ballh);//ball


  if (bally >= recty && ballx > rectx && ballx+ballw < rectx+rectw) {//ball + paddle touching
 speed = speed * -1;
}
  bally=bally+speed;
  
   if(bally<=squares){
    speed=speed*-1;
   
squares=squares-100;
   }
 


  int x=10;//looop for squares
  while (x <=400) {
    int y=10;
    while (y<squares) {
      fill(255,0,0);
      rect(x, y, 50, 50);
      y+=100;
    }
    x+=100;
  }
}

void keyPressed() {///user commands 
  constrain(rectx, 1, 399);
  if (key=='A') {////left
    rectx=rectx-5;
  }

  if (key=='D') {///right
    rectx=rectx+5;
  }
}



