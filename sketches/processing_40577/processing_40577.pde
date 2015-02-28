
//Homework 8
//copyright Maitri Shah Pittsburgh PA


PImage cloud;
float x,y,dia;
float deltaX, deltaY;

PImage bomb;
float bombX, bombY, bombDia;
float deltaBx, deltaBy ;

//float warningDist;

float amtCollision;
//float collisionDist;

float m;


void setup( )
{
 size( 500, 500);
 noStroke ( );
 smooth ( );
 noCursor ( );
 
 
 cloud = loadImage("cloud-md.png");
 x = width/2;
 y = height/3;
 dia = 60;
 deltaX = random(2,7) ;
 deltaY = random(2,7) ;
 
 bomb = loadImage("bomb.png");
 bombX = height/2;
 bombY = height/2;
 bombDia = 50;
 
 deltaBx = 0;
 deltaBy = 0;

 //warningDist = dist(width/2, bombX, height/2, bombY);
 
 amtCollision = 0;
 //collisionDist = dist(bombX, x, bombY, y);
 

}

void draw ( )
{
 prepScreen ( );
 
 drawCircle ( );
 moveCircle ( );
 bounceCircle ( );

 drawBomb( );
 warningBomb ( );
 moveBomb( );
 
 collision( );
  
 showSpeed ( );

}


//-----------------------------------------------------------

void showSpeed ( ) //why does this suddenly become textMode(CENTER) when the bomb goes off the page?
{
   m = millis( );
  
   fill (0);
   textAlign(CORNER);
   textSize(13);
   text( "Horizontal Speed" + int(deltaBx) , 10,height-50);
   text( "Vertical   Speed" + int(deltaBy) , 10, height-30 );
   text("Elapsed Time" + int(m/1000)+ "Seconds" , 10, 20 );
   text("No. of Cloud Bursts" + amtCollision , 10, 50 );
}

//-------------------------------------------------------------------------------------------------------------

void collision ( )
{
  float collisionDist;

  collisionDist = dist(bombX, bombY, x, y);

  if (collisionDist <= dia)
   {
    amtCollision = amtCollision + 1;
    
    fill(random(255), random(255), random(255) );
    ellipseMode(CENTER);
    ellipse(width/2, height/2, width, height);
    
    fill(0);
    textAlign(CENTER);
    textSize(35);
    text("CLOUD BURST", width/2, height/2);
    
    bombX = height/2;
    bombY = width/2;
    
    deltaX = deltaX + 1;
    deltaY = deltaY + 1;
   }
  
}



//-------------------------------------------------------------------------------------------------------------

void warningBomb ( ) //warning distance for a square? or the circle?
{
  float warningDist;
  warningDist = dist(width/2, bombX, height/2, bombY);
  
  if( (bombX > width + bombDia) || (bombX < 0 - bombDia) || 
        (bombY > height + bombDia) || (bombY < 0 - bombDia) )
   {
     fill(255,0,0);
     rect(width/4, height/4, width/2, height/2);
     
     textAlign (CENTER);
     fill(0);
     String s = "WARNING!\nThe bomb is off the screen by\n" + (warningDist - width/2) + 
                " pixels\n\nPress SpaceBar\n to bring Bomb back"  ;
     text( s, width/2, height/2.5);
     
     strokeWeight(1);
     stroke(255,0,0);
     line ( width/2, height/2, bombX, bombY);
     noStroke ( );
     
     }
     
   if(keyPressed == true)
     {
       if ( keyCode == ' ')
        {
          bombX = width/2;
          bombY = height/2; 
       
          deltaBx = 0;
          deltaBy = 0;
        }
   
     }
}

//-------------------------------------------------------

void moveBomb ( )
{
  bombX = bombX + deltaBx ;
  bombY = bombY + deltaBy ;
}

//--------------------------------------------------------

void keyPressed ( )
{
  if (keyCode == RIGHT )
   {
    deltaBx = deltaBx + 1;
   } 

 if (keyCode == LEFT )
  {
   deltaBx = deltaBx - 1; 
  }
 
 if (keyCode == DOWN )
  {
    deltaBy =  deltaBy + 1;
  }
 
 if (keyCode == UP )
  {
    deltaBy = deltaBy - 1; 
  }
  
  
  if ( keyCode == ' ')
   {
     bombX = width/2;
     bombY = height/2; 
       
     deltaBx = 0;
     deltaBy = 0;
    }
 
}

//----------------------------------------------------------

void drawBomb( )
{
 imageMode( CENTER ) ;
 image ( bomb, bombX, bombY, bombDia, bombDia ) ;
}



//---------------------------------------------------------
//all circle things >>
//---------------------------------------------------------

void moveCircle ( )
{
  x = x + deltaX ;
  y = y + deltaY ;

}

//---------------------------------------------------------

void bounceCircle ( )
{
   if ( (x > width - dia) || ( x < 0 + dia) )
   {
     deltaX = - deltaX ;

   }

   if ( (y > height - dia) || ( y < 0 + dia) )
   {
    deltaY = -deltaY ;
   }
}

//--------------------------------------------------------

void drawCircle ( )
{

  imageMode( CENTER ) ;
  image ( cloud, x, y, dia, dia ) ;

}

//-------------------------------------------------------

void prepScreen ( )
{
 fill (120, 255, 255, 50);
 rect ( 0, 0 , width , height );
}



