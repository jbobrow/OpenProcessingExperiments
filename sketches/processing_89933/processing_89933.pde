
//JiYoung Lee
//jiyoung3
//Homework 7
//copyright@Jiyoung Lee
int count;
int gameStart, gameEnd, fishStartTime, gameTime;
int gamePhase;

float x, y, diam,x1,y1,xSpeed,ySpeed,x1Speed,y1Speed, x3,y3,x3Speed,y3Speed, x2,y2,x2Speed,y2Speed,x4,y4,x4Speed,y4Speed;

void setup( )
{
   size( 400, 400 );
   
   textAlign( CENTER );
   fill( 255 );
   xSpeed=3;
   ySpeed=3;
   x1Speed=3;
   y1Speed=3;
   x=random(width);
   y=random(height);
   x1=random(width);
   y1=random(height);
   x3Speed=3;
   y3Speed=3;
   x3=random(width);
   y3=random(height);
   x2Speed=3;
   y2Speed=3;
   x2=random(width);
   y2=random(height);
    x4Speed=3;
   y4Speed=3;
   x4=random(width);
   y4=random(height);
   
   count = 0;
   gameStart = 0;
   gameEnd = 0;
   gamePhase = 0; 

   gameTime = 10000; 
}

void draw( )
{
  background( 189,220,240 );
  if ( gamePhase == 0 )
  {
    showInstructions( );
  }
  else if ( gamePhase == 1 )
  {
     playGame( );
  }
  else 
  {
    score( );
  }

}


void score( )
{
   fill( 40,50,129 );
   textSize( 40 );
   text("GAME OVER", width/2, 70 );
   textSize( 15 );
   text("You ate " + count + " fishes.", width/2, 100 );
   if ( count < 3 )
   {
      text("Still hungry!! >:( ", width/2, 150 );
   }
   else if ( count < 6 )
   {
      text("Not hungry..but not full.. :/", width/2, 150 );  
   }
   else 
   {
     textSize( 24 ); 
     text("I AM SO FULL!! :D ", width/2, 150 );   
   }
}

void checkTime( )
{
  fill( 40,50,129 );
  text( "Time left: " + ( gameTime/1000 - ((millis( ) - gameStart))/1000), width/2, 50 );
  if ( (millis( )-gameStart) > gameTime )
  {
     gamePhase = 2;
  } 
}

void showScore( )
{
    fill(40,50,129);
    text( "In your tummy, there are  " + count + "  fishes." , width/2, height*.9); 
}


void checkHit( )
{
     float d = dist( x, y, mouseX, mouseY );
     if ( d < diam/2)
     {
       count++;
       fill( 22,71,103 );
       rect( 0, 0, width, height );
       fishStartTime = 0;
     } 
}

void drawFish( )
{
noStroke();
  fill(247,57,172);
  ellipse(mouseX+50,mouseY,100,40);
  
fill(0);
  ellipse(mouseX+9,mouseY-1,5,5);
   
  noStroke();
  fill(247,57,172);
  triangle(mouseX+97,mouseY,mouseX+117,mouseY-20,mouseX+117,mouseY+20);

  
  
}
void moveTarget()
{
        x=x+xSpeed;
        if (x<0)
        {xSpeed=-xSpeed;
        }
        else if (x>400)
        {
          xSpeed=-xSpeed;}
            y = y + ySpeed;
   if ( y < 0 )
   {
     ySpeed = -ySpeed; 
   }
   else if( y > 400 ) 
   {
     ySpeed = -ySpeed;
   }
   
 
     x1=x1+x1Speed;
        if (x1<0)
        {x1Speed=-x1Speed;
        }
        else if (x1>400)
        {
          x1Speed=-x1Speed;}
            y1 = y1 + y1Speed;
   if ( y1 < 0 )
   {
     y1Speed = -y1Speed; 
   }
   else if( y1 > 400 ) 
   {
     y1Speed = -y1Speed;
   }
   
    x3=x3+x3Speed;
        if (x3<0)
        {x3Speed=-x3Speed;
        }
        else if (x3>400)
        {
          x3Speed=-x3Speed;}
            y3 = y3 + y3Speed;
   if ( y3 < 0 )
   {
     y3Speed = -y3Speed; 
   }
   else if( y3 > 400 ) 
   {
     y3Speed = -y3Speed;
   }
   
      
    x2=x2+x2Speed;
        if (x2<0)
        {x2Speed=-x2Speed;
        }
        else if (x2>400)
        {
          x2Speed=-x2Speed;}
            y2 = y2 + y2Speed;
   if ( y2 < 0 )
   {
     y2Speed = -y2Speed; 
   }
   else if( y2 > 400 ) 
   {
     y2Speed = -y2Speed;
   }
   
      x4=x4+x4Speed;
        if (x4<0)
        {x4Speed=-x4Speed;
        }
        else if (x4>400)
        {
          x4Speed=-x4Speed;}
            y4 = y4 + y4Speed;
   if ( y4 < 0 )
   {
     y4Speed = -y4Speed; 
   }
   else if( y4 > 400 ) 
   {
     y4Speed = -y4Speed;
   }
   
   
   
   
   
   
   
       
      
    }

void drawTarget( )
{
    
        
    
       
        diam = 20;
  

    fill(245,212,47) ;
    ellipse( x, y, diam+15, diam-10 );
    triangle(x+16,y,x+21,y-12,x+21,y+12);
    fill(47,129,40);
    ellipse( x1, y1, diam+15, diam-10 );
    triangle(x1+16,y1,x1+21,y1-12,x1+21,y1+12);
    fill(45,25,80);
    ellipse( x3, y3, diam+15, diam-10 );
    triangle(x3+16,y3,x3+21,y3-12,x3+21,y3+12);
      fill(79,25,245);
    ellipse( x2, y2, diam+15, diam-10 );
    triangle(x2+16,y2,x2+21,y2-12,x2+21,y2+12);
      fill(240,65,34);
    ellipse( x4, y4, diam+15, diam-10 );
    triangle(x4+16,y4,x4+21,y4-12,x4+21,y4+12);
  }





void playGame( )
{
   drawTarget( );
   moveTarget();
   drawFish( );
   checkHit( );
   showScore( );
   checkTime( );
}



void showInstructions( )
{
    
  fill(40,50,129);
  textSize( 40 );
  text( "Hungry Fish!!!", width/2, 50 ); 
  
  fill(255);
  textSize( 20 );
  text( "Only eat the ", 120, 150 );
  fill(245,212,47);
   text( "YELLOW FISH!", 250, 150 );  
   fill(255);
   text("Press any key to play the game.", width/2, 200 );
}

void keyPressed( )
{
   if ( gamePhase == 0 )
   {
      gamePhase = 1;
      gameStart = millis( );
   }
}



