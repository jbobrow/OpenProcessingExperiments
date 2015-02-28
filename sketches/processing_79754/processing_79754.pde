
/*Initialize variables*/
float paddleX, paddleY, paddlerX, paddlerY;
int sizeAcross=10, sizeDown=50;
float x,y;
float posX, posY;
float speedX=0;
float speedY=0;
int shapeSize=10;
int dashX, dashY;
int dashWidth=5, dashHeight=10;
boolean rMove;
float r;
void setup()
{
size (400,400);
/*When the game starts assign paddle position. 
Keep them in the middle on the left and right*/
paddleX=0;
paddleY=height/2-40;
paddlerX=0; 
paddlerY=height/2-40;


smooth();
  posX=width/2;
  posY=height/2;
  dashX=width/2-dashWidth;
  dashY=0;
}

void draw()

{
  /* Assign the dashed line position in centre screen*/
  dashX=width/2-dashWidth;
  dashY=0;
           
  background(105,185,0);
  strokeWeight(3);
  stroke(0,120,0);
  fill (0,255,0);
 
  /*Assign Ball*/
  ellipse(posX-2,posY,shapeSize,shapeSize);
  noStroke();
  fill(255);
  
  /* Assign the paddle dimensions */
  rect(paddleX, paddleY, sizeAcross,sizeDown);
  rect(paddlerX+width-sizeAcross, paddlerY, sizeAcross,sizeDown);
  
  /* Set the position of the ball*/
  posX =posX + speedX;
  posY =posY +speedY;
  fill(255,50);
  
  /* Dashed line in the centre of the screen*/
  while(dashY<height)
         {
           noStroke();
           rect(dashX,dashY,dashWidth,dashHeight);
            dashY=dashY+ (dashHeight+5);
         }
  /* 
  The UP and DOWN arrow keys control the right paddle. If a key on the keyboard is pressed and if it's UP or DOWN the right paddle moves. 
  The paddle speed is paddle+2
  The UP and DOWN need to be limited so as the paddle doesn't move off screen.  */
  
  /* If the ball hits the paddle on the left or right it bounces back at negative speed  */
   if( posX >= width-paddlerX -10 && posY >= paddlerY && posY <= paddlerY + sizeDown)
 {
   /* Make the speed from the paddle have a random negative speed so as it's not a predictable speed*/
  speedX=speedX*-random(1,.5);
  /* Check if the ball hits the paddle*/
 }
 if(posX <= 10  && posY >=paddleY && posY <= paddleY + sizeDown)   
/* One the ball hits the paddle it bounces back at a negative speed with negated by a random number generated between ).5 and 1.
This is to avoid the game being too predictable*/
 {
 speedX=speedX*-random(1,.5);
 }    
    
    /*Constraints for the ball. If the ball goes to the top or bottom it bounces back at speed -1.*/  
 if (posY>=height)
  {
    speedY=speedY*-1;
  }
  else if(posY<=0)
  {
    speedY=speedY*-1;
  }

/*If the up arrow key is pressed the right paddle moves up the screen*/
 if (keyPressed)
  {
    if (key == CODED)
    {
      if (keyCode == UP) 
      {
      paddlerY=paddlerY-10;
      /* Limit the paddle moving off the top of the screen*/ 
      
      if (paddlerY<=-5)
      {
        paddlerY=paddlerY+10;
      }
     }
    }
  }
  
/*If the down arrow key is pressed the right paddle moves down the screen*/

if (keyPressed)
   {
     if(keyCode==DOWN)
     {
       paddlerY=paddlerY+10;
      /* Limit the paddle moving off the bottom of the screen*/
       if (paddlerY>=height-50)
       {
         paddlerY=height-52;
         
       }
     }
   }


if (keyPressed)
   
   /* Assign the Q, q, A, a to the left paddle. */
  {
    if (key == 'Q' || key == 'q')
    {
      paddleY=paddleY-10;
       /* Constrain the left paddle from moving off the top of the screen.*/
       if (paddleY<=-5)
        {
          paddleY=paddleY+10;
        }
    }
  }
 
if (keyPressed) 
   {
     if(key== 'A' || key == 'a')
      {
        paddleY=paddleY+10;
      /* Constrain the left paddle from moving off the bottom of the screen.*/
       if (paddleY>=height-50)
         {
           paddleY=height-52;
         }
      }
   }
            
      
    if(posX>=width)
    {
     /* Print message win for left paddle*/
      println("Point to Left Player");
      posX = width/2;
      posY = height/2;
      speedX=0;
      speedY=0;
       /*Declare boolean statement that the ball not exited left of frame so it has right*/
     rMove=false;
    }
    if(posX<=0)
    {
      /* Print message win for right paddle*/
      println("Point to Right Player");
      posX = width/2;
      posY = height/2;
      speedX=0;
      speedY=0;
      /*Declare boolean statement that the ball exited leftt of frame*/
       rMove=true;
    }

  
   if (mousePressed) 
   /*If the ball has exited left of frame then the right paddle has won the point and the ball
   should move to them ie move right*/
        {
        if (rMove==true)
              {
              /*Ball starts at speed*/
             speedX= 2;
             speedY= 2;
              }
   /*If the ball has exited right of frame then the left paddle has won the point and the ball
   should move to them ie move left*/
         else if (rMove==false)
           {
               speedX=-2;
               speedY=-2;
           }
        


}}

