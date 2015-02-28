

//HW 8-Computer Game
//Coral Pais, Carnegie Mellon University, Pisburgh
// Reproduction of the following code without consent is strictly prohibited


float bx, by, bw, bh;
float ax, ay, aw, ah, ady;
float rx, ry, rw, rh, rdy, rdx;
float cx1, cy1, cdx1, cdy1,cw, ch, cdx,cdy;
float cx2, cy2, cdx2, cdy2;
float sx, sy, sw, sh;
int shootarrow, collision, score, gamePhase, WelcomeTime, gameTime, collisionTime, shootTime;

PImage bow, arrow,bird, cloud1, cloud2, lightning, landscape, sun, sign;
PFont welcomeText1, welcomeText2, gameText, scoreText;


void setup( )
{
   size( 700, 700 );
   fill( 255 );
   
   
   bx=300;            //Bow
   by=height-40;
   bw=200;
   bh=40;
   
   
   ax=bx;            //Arrow
   ay=height-70;
   aw=30;
   ah=100;
   ady=5;
   
   rx=100;            //Bird
   ry=100;
   rw=120;
   rh=36;
   rdx=2;
   rdy=0;
   
   cx1=50;            //Cloud 1
   cy1=150;
   cdx1=0.25;
   cdy1=0.5;
   
   cx2=350;            //Cloud 2
   cy2=200;
   cdx2=-0.75;
   cdy2=0.25;
   
   cw=200;
   ch=100;
   
   sx=0;
   sy=0;
   sw=150;
   sh=150;
   
   shootarrow=0;
   collision=0;
   score=0;
   WelcomeTime=0;
   gameTime= 60000;
   shootTime=0;
   gamePhase=0;
   collisionTime=0;
   
   bow=loadImage ("bow.png");
   arrow=loadImage ("arrow.png");
   bird=loadImage ("bird.png");
   cloud1=loadImage ("cloud.png");
   cloud2=loadImage ("cloud.png");
   lightning = loadImage ("Lightning.png");
   landscape= loadImage ("landscape.png");
   sun= loadImage ("sun.png");
   sign= loadImage ("sign.png");
   
   welcomeText1= loadFont ("BuxtonSketch-48.vlw");
   welcomeText2= loadFont ("Stencil-48.vlw");
   gameText= loadFont ("SegoeMarker-48.vlw");
   scoreText= loadFont ("SnapITC-Regular-48.vlw");
   
   
}

void draw( )
{
  prepScreen ( );
  
  if ( gamePhase == 0 )
  {
    WelcomeScreen( );
  }
  else if ( gamePhase == 1 )
  {
     playGame( );
  }
  else 
  {
    ScoreReport( );
  }
}

void prepScreen ( )
{
  
  image (landscape, 0,0, width, height);
  
}

void WelcomeScreen ( )
{
   textAlign(CENTER);
   textFont (welcomeText2, 40);
   text( "THE HUNTER GAME ", width/2, 80 );
   textAlign(LEFT);
   textFont (welcomeText1, 30);
   text( "Instructions: ", 25, 360 );
   text( "1. Move the mouse to move the position of the arrow ", 25, 385 );
   text( "2. Click to shoot the bird", 25, 410 );
   text( "3. Increase the speed of the arrow using the Up and Down keys ", 25, 435 );
   text("Press start to begin game.", 25, 480 );
      
   image (sign, 75,550, 100, 100);
   text("START", 85, 583 );
   
   
   
   
}

void playGame ( )
{
  drawFigure ( bow, bx-bw/2 ,by, bw, bh );
  drawFigure (arrow, ax-aw/2 ,ay, aw, ah );
  drawFigure ( cloud1, cx1 ,cy1, cw, ch);
  drawFigure (cloud2, cx2 ,cy2, cw, ch );
  drawFigure(sun, sx ,sy, sw, sh );
  drawFigure (bird, rx ,ry, rw, rh );
  
  displayStats ( );
  
  moveBow ( );
  moveArrow ( );
  moveBird ( );
  moveCloud1 ( );
  moveCloud2 ( );
  
  checkCollision ( );
  checkTime ( );
   
  
}

void ScoreReport( )
{
   fill (255);
   textAlign (CENTER);
   textFont (scoreText, 30);
   text("Score: " + score , width/2, 350 );
   text("Press Space to Restart ", width/2, 450 );
}

void drawFigure (PImage figure, float posx, float posy, float figw, float figh )
{
    image (figure, posx, posy, figw, figh);
  
}


void displayStats ( )
{
  fill( 85, 34,0 );
  textFont (gameText, 25);  
  text( "Timer:  " + (gameTime-shootTime)/1000  , 35, 70 );
  text( "Score:  " + score , 40, 95 );
  textFont (gameText, 20);
  text( "Arrow Speed: " + int (ady) , 10, height-40 );
  
     
    
}


void moveBow ( ) 
{
  bx=mouseX;
      
}



void moveArrow ( )
{
  if (shootarrow==0)
  {
    ax=bx;
  }
  
  if (shootarrow==1 && collision==0)
  {
    ay=ay-ady;
  }
  
  if (collision ==1)
  {
    ay=ay+2;
  }
  
  if (ay+ah<0 )
  {
    ay=height-70;
    shootarrow=0;
    collision=0;
           
  }
  
  if (ay >height)
  {
    if (collision ==1)
     {
       score++;
     }
    rx=random (0,width-rw);
    ry=100;
    rdx=random (2,5);
    shootarrow=0;
    ay=height-70;
    collision=0;
    
  }
  
  
}

void moveBird ( )
{
  
  rx+=rdx;
  
  if (rx+rw> width ||  rx<0 && collision==0)
  {
    
    rdx=-rdx;
  }
  
  if (collision ==1)
  {
    rdx=0;
    ry=ry+2;
  }
  
   
}



void moveCloud1 ( )
{
  cx1+=cdx1;
  if (cx1 > width)
  {
    cx1=-(cw);
  }
  
  if (cx1 + (cw) <0)
  {
    cx1=width;
  }
  
  cy1+=cdy1;
  
  if ( cy1 >height )
  {
    cy1=- ch;
  }
  
  if ( cy1+ ch<0 )
  {
    cy1=height;
  }
  
   
  
}

void moveCloud2 ( )
{
  cx2+=cdx2;
  if (cx2 > width)
  {
    cx2=-(cw);
  }
  
  if (cx2 + (cw) <0)
  {
    cx2=width;
  }
  
  cy2+=cdy2;
  
  if ( cy2 >height )
  {
    cy2=- (ch);
  }
  
  if ( cy2+ (ch)<0 )
  {
    cy2=height;
  }
  
   
  
}


void checkCollision ( )
{
  
  //Cloud 1 and Cloud 2
  float d = dist( cx1, cy1, cx2, cy2 );
     if ( d <= cw && d<=ch )
   {
     
     image (lightning, cx1,cy1, 280, 400);
     cdx=cdx1;
     cdx1=cdx2;
     cdx2=cdx;
     cdy=cdy1;
     cdy1=cdy2;
     cdy2=cdy;
   }
  
  
  //Bird and Arrow
  if ( ry <= ay && ay<= (ry+rh/2) && rx<=ax && ax<=(rx+rw) )
  {
    // DO stop timer
    collision=1;
    collisionTime= millis ( )-WelcomeTime-shootTime;
  } 
  
  
}

void checkTime ( )
{
  if (collision==0)
  {
    shootTime=millis ( )-collisionTime-WelcomeTime;
  }

  if ( shootTime >= gameTime)
  {
    gamePhase=2;
    
  }
  
  
}



void mousePressed ( )
{
  
  if ( gamePhase == 0 )
   {
     if (mouseX>= 75  && mouseX<= 175 && mouseY>= 560 && mouseY<= 590 )
        {
          gamePhase = 1;
          WelcomeTime = millis( );
         }
   }
   
   
   else if ( gamePhase ==1)
      {
        if (mousePressed)
        {
          shootarrow=1;
        }
      }
    
}


void keyPressed ( )
{
  
   
   
   if ( gamePhase ==1)
   { 
     if (keyCode==UP)
      {
        if (ady<10.0)
          ady=ady+1;
    
      }
  
      else if (keyCode==DOWN)
       {
         if (ady>0)
          ady=ady-1;
        }
        
     }
    
    
    if (gamePhase ==2)
    {
      if (key== ' ')
      {
         shootarrow=0;
         collision=0;
         score=0;
         WelcomeTime=0;
         gameTime= 60000;
         gamePhase=0;
         collisionTime=0;
         shootTime=0;
         
         
         //position
         
           bx=300;            
           ay=height-70;
           ady=5;
           rx=100;            
           ry=100;
           rdx=2;
           rdy=0;
           cx1=50;            
           cy1=150;
           cx2=350;            
           cy2=200;
      }
      
    }
  
}
  


