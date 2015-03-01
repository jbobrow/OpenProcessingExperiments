
int ballX = 75;
int ballY = 0;
int width = 32;
int handHeight = 64;
int ballWidth = 32;
int wallX = 0;
int wallY = 0;
int wallWidth = 32;
int wallHeight = 480;
float gravity = 0.9;
float ballDX = 1;
float ballDY = 0;
String output = "123";
int handX = 350;
int handY = 100;
int lastKeyPressed = 2;
int handSpeed = 0;

int screenHeight = 480;
void setup() {  //setup function called initially, only once
  size(720, screenHeight );
}

void draw() {  //draw function loops 

   ballDY += gravity;
   
  if(ballY > screenHeight - ballWidth) {
       if(abs(ballDY) > 0.2) {
           ballDY *= -1;
           ballDY *= .8;
       } else {
       ballDY = 0;
   }
  }
   
   if(collide(ballX, ballY, ballWidth, ballWidth, handX, handY, width, handHeight ) ||
      collide(ballX, ballY, ballWidth, ballWidth, wallX, wallY, wallWidth, wallHeight)) {
       output = "OK";
       ballDX *= -1;
       //ballDY *= -1;
   }
   if(lastKeyPressed== 1) {
       if(handY > width)
           handSpeed = 7;
       
   }
   
   if(lastKeyPressed == 0) {
       handSpeed = -7;
   } 
   fill(0);
  
   ballX += ballDX;
   lastKeyPressed = keyCode;
   handY += handSpeed;
   ballX += (int)ballDX;
   ballY += (int)ballDY;
   background(255);
   fill(255,0,0);
   ellipse(ballX, ballY, ballWidth, ballWidth);
   fill(0);
   rect(wallX, wallY, wallWidth, wallHeight);
   fill(0,255,0);
   rect(handX, handY, width , handHeight );
    text(output, 200, 200);
}

void keyReleased() {
    lastKeyPressed = 2;
    handSpeed = 0;
}

void keyPressed() {
    if(keyCode == DOWN) {
        lastKeyPressed = 1;
    } 
    
    if(keyCode == UP) {
        lastKeyPressed = 0;
    }
    
}


boolean collide(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2) {
    return (abs(x1 - x2) * 2 < (width1 + width2)) &&
           (abs(y1 - y2) * 2 < (height1 + height2));
}
