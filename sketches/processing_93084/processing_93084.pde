
/* shirley wang homework 7
      copyright sijiaw 2013 */
      
int count, countS, time, countdown, gameTime, startTime, gamePhase, endGame;

float bx = 200;
float by = 200;
float bxSpeed = 2;
float bySpeed = -3;
float bz = 30;

float sx = 350;
float sy = 350;
float sxSpeed = 6;
float sySpeed = -7;

float sx2 = 200;
float sy2 = 200;
float sx2Speed = 4;
float sy2Speed = -4;

float sx3 = 30;
float sy3 = 30;
float sx3Speed = 5;
float sy3Speed = -2;

float sx4 = 400;
float sy4 = 400;
float sx4Speed = 7;
float sy4Speed = -7;

float sx5 = 100;
float sy5 = 350;
float sx5Speed = 3;
float sy5Speed = -4;

float swattersize = 30;


void setup ( ) {
  
  size ( 500, 500);
  smooth ( );
  textAlign ( CENTER );
  
  gamePhase = 0;
  gameTime = 30000;
  startTime = 0;
  
  
  
}

void draw ( ) {
  background ( 255 );
  if (gamePhase == 0){
    instruction ( );
  }
    
  else if (gamePhase == 1) {
    playgame ( );
  }
  else {
    endGame ( );
  }
  
  
}
void instruction ( ) {
  fill ( 0 );
  textSize ( 12);
  text ( "Hit the fly as many times as you can.", width/2, height/3.4 );
  text ( "Make sure you don't hit any spiders!", width/2, height/3 );
  text ( "Press any key to start.", width/2, height/2);
}

void endGame ( ) {
  fill ( 0 );
  textSize ( 35 );
  text ( "Game over!", width/2, height/3); 
  textSize ( 18 );
  text ( "Press any key to restart.", width/2, height/2);
  numberhitflies ( );
  numberhitspiders ( );
  
}

void numberhitflies ( ) {
  if (count <= 5 ) {
    text ( "Too bad, you hit it " + count + " times.", width/2, height/1.5); 
  }
  else if (count < 20 && count > 5) {
    text ( "Cool, " + count + " hits.", width/2, height/1.5);
  }
  else if (count >= 20) {
    text ( "Impressive! " + count + "! You're a pro!", width/2, height/1.5);
  }
  
}

void numberhitspiders ( ) {
    if ( countS >= 2) {
      text ( "But you killed " + countS + " spiders! :( ", width/2, height/ 1.1);
    }
    if ( countS < 1) {
      text ( "And you didn't kill any spiders! :)", width/2, height/ 1.1);
    }
}

void timeRemaining ( ) {
  time = gameTime/1000;
  countdown = gameTime/1000 - ((millis ( ) - startTime )) / 1000;
  fill ( 0 );
  if ( countdown < 10) {
    fill ( 255, 0, 0 );
  }
  textSize ( 20 );
  text ( countdown, width/ 2, height/12);
  
  if ( ( millis ( ) - startTime) > gameTime ) {
      gamePhase = 2;
  }
}

void keyPressed ( ) {
  if (gamePhase == 0) {
    gamePhase = 1;
    startTime = millis ( );
    count = 0;
  }
  if (gamePhase == 2) {
    gamePhase = 0;
  }
}


void drawFly ( float x, float y, float z) {
  float bz = 30;
  pushStyle ( );
  PImage fly = loadImage ( "fly-icon.png");
  imageMode ( CENTER );
  image ( fly, x, y, z, z);
  popStyle ( );
   
}

void moveFly ( ) {
  bx = bx + bxSpeed;
  by = by + bySpeed;
  
  if (bx > width || bx < 0) {
    bxSpeed= -bxSpeed;
  }
    
  if (by > height || by < 0 ) {
    bySpeed = -bySpeed;
  }
}
    
void spider1 ( ) {
    PImage spider = loadImage ( "spider.png");
    image ( spider, sx, sy);
}

void movespider1 ( ){
  sx = sx + sxSpeed;
  sy = sy + sySpeed;
  
  if (sx > width || sx < 0) {
    sxSpeed= -sxSpeed;
  }
    
  if (sy > height || sy < 0 ) {
    sySpeed = -sySpeed;
  }
}

void spider2 ( ) {
    PImage spider = loadImage ( "spider.png");
    image ( spider, sx2, sy2);
}

void movespider2 ( ){
  sx2 = sx2 + sx2Speed;
  sy2 = sy2 + sy2Speed;
  
  if (sx2 > width || sx2 < 0) {
    sx2Speed= -sx2Speed;
  }
    
  if (sy2 > height || sy2 < 0 ) {
    sy2Speed = -sy2Speed;
  }
}

void spider3 ( ) {
    PImage spider = loadImage ( "spider.png");
    image ( spider, sx3, sy3);
}

void movespider3 ( ){
  sx3 = sx3 + sx3Speed;
  sy3 = sy3 + sy3Speed;
  
  if (sx3 > width || sx3 < 0) {
    sx3Speed= -sx3Speed;
  }
    
  if (sy3 > height || sy3 < 0 ) {
    sy3Speed = -sy3Speed;
  }
}

void spider4 ( ) {
    PImage spider = loadImage ( "spider.png");
    image ( spider, sx4, sy4);
}

void movespider4 ( ){
  sx4 = sx4 + sx4Speed;
  sy4 = sy4 + sy4Speed;
  
  if (sx4 > width || sx4 < 0) {
    sx4Speed= -sx4Speed;
  }
    
  if (sy4 > height || sy4 < 0 ) {
    sy4Speed = -sy4Speed;
  }
}

void spider5 ( ) {
    PImage spider = loadImage ( "spider.png");
    image ( spider, sx5, sy5);
}

void movespider5 ( ){
  sx5 = sx5 + sx5Speed;
  sy5 = sy5 + sy5Speed;
  
  if (sx5 > width || sx5 < 0) {
    sx5Speed= -sx5Speed;
  }
    
  if (sy5 > height || sy5 < 0 ) {
    sy5Speed = -sy5Speed;
  }
}

void flyswatter ( ) { 
     PImage j = loadImage ( "flyswatter.png");
     image ( j, mouseX, mouseY);
    
   }


void flyswatterhit ( ) {
  
  float h = dist ( bx, by, mouseX, mouseY );
  //float h2 = dist ( mouseX, mouseY );
  float bz = 20;
  
  PImage hit = loadImage ("flyswatterhit.png");
  
  if ( mousePressed && h < 15 ) {
    fill ( 0 );
    count++;
    image ( hit, mouseX, mouseY);
    
  }
  
  float s1 = dist ( sx, sy, mouseX, mouseY );
  if ( mousePressed && s1 < 15) {
      countS++;
  }
  float s2 = dist ( sx2, sy2, mouseX, mouseY );
  if ( mousePressed && s2 < 15) {
      countS++;
  }
  float s3 = dist ( sx3, sy3, mouseX, mouseY );
  if ( mousePressed && s3 < 15) {
      countS++;
  }
  float s4 = dist ( sx4, sy4, mouseX, mouseY );
  if ( mousePressed && s4 < 15) {
      countS++;
  }
  float s5 = dist ( sx5, sy5, mouseX, mouseY );
  if ( mousePressed && s5 < 15) {
      countS++;
  }
  
  
  
}


void playgame ( ) {
  
  flyswatter ( );
  flyswatterhit ( );
  
  drawFly (bx, by, bz );
  moveFly ( );
  
  spider1 ( );
  movespider1 ( );
  
  spider2 ( );
  movespider2 ( );
  
  spider3 ( );
  movespider3 ( );
  
  spider4 ( );
  movespider4 ( );
  
  spider5 ( );
  movespider5 ( );
  
  timeRemaining ( );
  
}



