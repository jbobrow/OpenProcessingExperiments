
//declare global variables
int height = 700; //vertical height of screen
int width = 800; //horizontal height of screen
float xLoc = 100; //horizontal position of sprite
float yLoc = 100; //vertical position of sprite
int s; //current second
int h; //current hour
int lastSecond; //previous second
ArrayList bullets; //all the bullets currently on screen

void setup()
{
  size(width, height);
  background(0);
  noStroke();
  smooth();
  bullets = new ArrayList();
}

int i = width;
int sCount = 0;
Bullet b;
int col = 0;

void draw()
{
  h = hour();
  
  //switches backgrounds depending on hour
  //currently colors, but will be actual drawn backgrounds
  switch(h) {
   case 0: 
      col = 0;
      break;
   case 1: 
     col = 10;
     break;
   case 2: 
      col = 20;
      break;
   case 3: 
      col = 30;
      break;
   case 4:
      col = 40;
      break;
   case 5: 
      col = 0;
      break;
   case 6: 
     col = 30;
     break;
   case 7: 
      col = 40;
      break;
   case 8: 
      col = 50;
      break;
   case 9:
      col = 60;
      break;
   case 10: 
      col = 70;
      break;
   case 11: 
     col = 80;
     break;
   case 12: 
      col = 90;
      break;
   case 13: 
      col = 100;
      break;
   case 14:
      col = 110;
      break;
   case 15: 
      col = 120;
      break;
   case 16: 
     col = 130;
     break;
   case 17: 
      col = 140;
      break;
   case 18: 
      col = 150;
      break;
   case 19:
      col = 160;
      break;
    case 20: 
     col = 170;
     break;
   case 21: 
      col = 180;
      break;
   case 22: 
      col = 190;
      break;
   case 23:
      col = 200;
      break;  
  }
  background(col,0,0);
  
  fill(255);
  
  s = second();
  sCount = s;
  if( s == 0 ) sCount = 0;
  if( s != lastSecond){
    for(int i = 0; i < sCount; i++){
      bullets.add(new Bullet(int(random(width, width + 200)) , int(random(0,height)) ));
    }
    lastSecond = s;
    sCount++;
  }else{ 
    for( int i = 0; i < bullets.size(); i++ ) {
      b = (Bullet) bullets.get(i);
      b.update();
    }
  }
  
  //player character sprite placeholder
  fill(255,255,0);
  ellipse(xLoc, yLoc, 20,20);
  
  if( bullets.size() > 2000 ){
    bullets.remove(0);
  }
}

//controls for player character
void keyPressed()
{
  if(key == CODED){
    if( keyCode == UP) {
      yLoc = yLoc - 20;
    }
    else if( keyCode == DOWN){
      yLoc = yLoc + 20;
    }
    else if( keyCode == KeyEvent.VK_LEFT ){
      xLoc = xLoc - 20;
    }
    else if( keyCode == KeyEvent.VK_RIGHT ){
      xLoc = xLoc + 20;
    }
  }
}

void keyReleased()
{
  //nothing here yet
}


class Bullet{
 int xPos, yPos, speed, m;
 boolean goUp;
 
 Bullet(int x, int y){
   yPos = y;
   xPos = x;
   speed = 0;
   m = minute();
   goUp = false;
   //num = n;
 }
 
 void update() {
   
   ellipse(xPos, yPos, 20, 20);
   
   if( 0 <= m && m < 15)
   {
     xPos = xPos - speed/15;
     
     if(goUp == false)
       {
         yPos = yPos - int(random(0,20)) ;
         goUp = true;
       }
       
     if(goUp == true) 
     {
       yPos = yPos + int(random(0,20)) ;
       goUp = false;
     }
       
       speed++;
   }
   else if( 15 <= m && m < 30)
   {
     xPos = xPos + int(random(0, 15) ) - 2* speed/15;
     
     /*if(goUp == false)
       {
         yPos = yPos - int(random(0,10)) ;
         goUp = true;
       }
       
     if(goUp == true) 
     {
       yPos = yPos + int(random(0,10)) ;
       goUp = false;
     } */
     
       speed++;
   }
   else if( 30 <= m && m < 45)
   {
     xPos = xPos - speed/15;
     
     if(goUp == false)
       {
         yPos = yPos - int(random(0,30)) ;
         goUp = true;
       }
       
     if(goUp == true) 
     {
       yPos = yPos + int(random(0,30)) ;
       goUp = false;
     }
     
       speed++;
   }
   else if( 45 <= m && m < 60)
     {
       xPos = xPos - speed/15;
       
       if(goUp == false)
       {
         yPos = yPos - int(random(0,20)) ;
         goUp = true;
       }
       
     if(goUp == true) 
     {
       yPos = yPos + int(random(0,20)) ;
       goUp = false;
     }
     
       speed++;
     }
 }
}
