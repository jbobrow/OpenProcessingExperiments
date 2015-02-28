
//HW8
//Yingri Guan @  Pittsburgh All Rights Reserved
//Thanks to http://abzhakim.blogspot.com/ for the forest background

//'r' to randomize red riddinghood and wolf's positions
//Control the speed of the red:
//'f' speed up x direction
//'F' speed up y direction
//'s' slow down x direction
//'S' slow down y direction
//Control the speed of the wolf:
//'a' speed up x direction
//'A' speed up y direction
//'d' slow down x direction
//'D' slow down y direction

ArrayList mushrooms;
int mushNum = 15;

int count;
int startTime, endTime, targetDisplayTime,  targetStartTime, totalTargetTime, gameTime;
int gamePhase;
float x1, y1, sz1, xspeed1, yspeed1, tempx1, tempy1;
float x2, y2, sz2, xspeed2, yspeed2, tempx2, tempy2; //dv is the change in speed
boolean collide = true;

PImage img1,img2, bg;

void setup()
{
  bg = loadImage("forest.png");
 size(1000,387); 

  
 img1 = loadImage("red ridding hood.png"); 
 img2 = loadImage("wolf.png"); 
  
 //red
 x1=random(20,40);
 y1=random(20,40);
 sz1=60;
 xspeed1=3;
 yspeed1=5;
 tempx1 = xspeed1;
 tempy1 = xspeed1;
 //wolf
 x2=200;
 y2=200;
 sz2=80;
 xspeed2=0;
 yspeed2=0;
 tempx2 = xspeed2;
 tempy2 = yspeed2;
 
 //record game
   textSize( 12 );
   textAlign( LEFT );
   fill( 255 );
   count = 0;
   startTime = 0;
   endTime = 0;
   gamePhase = 0; 
   targetDisplayTime = 100000;  // time
   gameTime = 100000;   // time
   
  mushrooms = new ArrayList();
  smooth();
  for(int i=0; i<mushNum; i++){
  mushrooms.add(new Mushroom());
  }
 
}

void draw()
{
  image(bg,0,0);
//  x1=mouseX;
//  y1=mouseY;
//  x2=200;
//  y2=200;
    
  if ( gamePhase == 0 )
  {
    showInstructions( );
  }
  else if ( gamePhase == 1 )
  {
     playGame( );
     score();
  }
  else if( gamePhase == 2)
  {
    text("Game Over!", width/2, 100);
  }
  
  //saveFrame("game-######.png");
//if (collide = true)
//  {
//  drawRed();
//  }
//  drawWolf();
//  moveRed();
//  moveWolf();
//  checkCollision();
//  score();
}

//game score
void score( )
{
   fill( 255, 0, 0 );
   text("Number of times the wolf is hit by red ridding hood: " + count/2 ,680 , 360 );
   if ( count < 5 )
   {
      text("Try to stop the wolf from being hit", 680, 375 );
   }
   else if ( count < 10 )
   {
      text("The wolf is in pain!",680, 375 );  
   }
   else 
   {
      text("Save the wolf", 680, 375 );   
   }
   
}

void checkTime( )
{
  fill( 255, 0, 0 );
  text( "Time Remaining: " + ( gameTime/1000 - ((millis( ) - startTime))/1000), 800, 50 );
  if ( (millis( )-startTime) > gameTime )
  {
     gamePhase = 2;
  } 
}

void showScore( )
{
    fill( 255 );
    text( "Hits " + count, width/2, height*.9); 
}


void moveRed()
{
 x1= x1 - xspeed1;
 y1 = y1 + yspeed1; 
 
 if((x1>width-sz1) || (x1<0))
 {
   xspeed1 = xspeed1 * -1;
 }

if ((y1>height-sz1) || (y1<0))
  {
  yspeed1 = yspeed1 * -1;
  }
}

//red riddinghood
void drawRed(){  
  image(img1,x1,y1);
}

//user controlled
void moveWolf()
  {
//   x2+=xspeed2;
//   y2+=yspeed2;

   x2=x2+xspeed2;
   y2=y2+yspeed2;

   if (x2>width-sz2 || x2<0)
  {
   
   xspeed2=-xspeed2;
  }
  
  if (y2>height-sz2 || y2<0)
  {
   
   yspeed2=-yspeed2;
  }
  }

void drawWolf(){
  //wolf
  
  //teeth
  image(img2,x2,y2);
  }
  
  //bezier(x2+5, y2-20, x2, y2-20, x2-10, y2-10, x2 -20, y2);
  //translate(width/2, height/2);
//  rotate(PI/3.0);
//  ellipse( x2+40 ,y2+15, 50, 15);


void checkCollision()
{
 float d= dist(x1,y1,x2,y2);
 if(d<(sz1/2+sz2/2))
 {  count+=1;
    
    xspeed1 = xspeed2;
    xspeed2 = tempx1;
    yspeed1 = yspeed2;
    yspeed2 = tempy1;
    
    
mushrooms.add(new Mushroom());
for (int i = 0; i < mushrooms.size(); i++ ) { 
    Mushroom m = (Mushroom) mushrooms.get(i);
    m.run();
    m.gravity();
    m.display();
}
    
    
 }
}

void keyPressed()
{
  //control the speed of the wolf
  if ( keyCode == UP)
  {
    xspeed2 += 1;
  }
   
  else if ( keyCode == DOWN)
  {
    xspeed2 -= 1;
  }
   
  else if ( key == LEFT)
  {
    yspeed2 += 1;
  }
   
  else if ( key == RIGHT)
  {
    yspeed2 -= 1;
  }
  
//   else if ( key == 'r')
//  {
//    x1 = random(0, width-200);
//    y1 = random(0, height-177);
//    xspeed1 = random(1, 5);
//    yspeed1 = random(1, 5);
//     
//    x2 = random( 0, width);
//    y2 = random (200, 300);
//    xspeed2 = random( 1, 5);
//    yspeed2 = random( 1, 5);
//  }
  
//  else if(key == CODED) {
//    if(keyCode ==UP){
//      y2--;
//    } else if (key == DOWN) {
//      y2++;
//    } 
//    if (key == LEFT) {
//      x2--;
//    } else if (key == DOWN) {
//      x2++;
//    } 
//}
//}
}

void playGame()
{
  if (collide = true)
  {
  drawRed();
  }
  drawWolf();
  moveRed();
  moveWolf();
  checkCollision();
  score();
  checkTime();
}

void showInstructions( )
{
   text( "The wolf if about to be hit by the red ridding hood", width/3, 50 ); 
   text("Press the mouse to start the game.", width/3, 100 );
}

//void gameOver()
//{
//  if ( count >10)
//   {
//  background(0);
//  text("Game Over!", width/3, 100 );
//  
//}
//}

void mousePressed( )
{
   if ( gamePhase == 0 )
   {
      gamePhase = 1;
      startTime = millis( );
   }else if( gamePhase == 2)
   {gamePhase = 0;
   }
}

PImage img3;
// A simple Mushroom class
class Mushroom {
  
  float mx;
  float my;
  float w,h;
  float mxspeed;
  float myspeed;
  
  Mushroom() {
    mx = random(x1-100,x1+100);
    my = random(y1-100,y2+100);
    w = random(20,100);
    h = random(20,100);
    mxspeed = random(-1,1);
    myspeed = random(-2,0);
    img3 = loadImage("mushroom.png");

  }
  void run() {
    mx = mx + mxspeed;
    my = my + myspeed;
  }
  
  void gravity() {
    myspeed += 0.1;
  }
  
  void display() {
    image(img3, mx,my, w, h);
  }
}


