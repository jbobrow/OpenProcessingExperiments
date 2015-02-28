
//Michelle Guarino, mguarino@andrew.cmu.edu
//copywrite. all rights reserved.

float x, y, wd, ht, xSpeed,ySpeed;
float a, b, dia, aSpeed, bSpeed;
int n;
int t,s;
void setup ()
{
  noStroke();
  smooth ();
  size (600, 600);

  wd= 50;
  ht= 50;
  ySpeed=2;
  xSpeed=10;
  n=0;
  a=0;
  b= 10;
  dia= 50;
  aSpeed=2;
  bSpeed=2;
  
  
  
}

void draw ()
{
background(255,255,255);
bouncingTarget();
circle (x, y, wd, ht);
//println (n);
updateTimer();
showText();
moveellipse();
drawellipse (a, b, dia);

}

void circle (float x, float y, float wd, float ht)
{
  fill (16, 98, 173);
  ellipse (x, y, wd, ht);
}
  

void bouncingTarget ()
{
  background (255,255,255);
  y=ySpeed+y;
  x=xSpeed+x;
    
  //BOUNCING
  if (x > width-wd+40)//too far right
  {
    xSpeed=-xSpeed;//then more left
    x=xSpeed+x;
  
}
  else if (x< 0) //too far left
  {
    xSpeed=-xSpeed;//then move right
      x=xSpeed+x;
  }
   if (y > height-wd+40) {
    ySpeed = -ySpeed;
      y=ySpeed+y;
  } 
   if (y < 0) 
  {
    ySpeed = -ySpeed;
      y=ySpeed+y;
  }
}
void moveellipse ()
{
  //WRAPPING
  a=aSpeed+a;
  if (a > width)//is the target too far to the right?
  {
    a=0; //move it back to the left side
  }
  else if (a < 0)//is the target too far to the left?
  {
   a=width; //move it back to the right side
  }
  
  b=bSpeed+b;
  if (b > height)//is the target too far to the bottom?
  {
    b=0; //move it back to the left top
  }
  
  else if (b < 0)//is the target too far to the top?
  {
   b=height; //move it back to the bottom bottom
  }
  
  
}
 
void drawellipse (float a, float b, float dia)
{
  fill (249, 249, 117);
  ellipse (a,b,dia,dia);
 //FASTER RATE THAN PREVIOUS MOUSE
   if (mouseX>pmouseX)
   {
    aSpeed=aSpeed+.5; 
   }
   else if (mouseX<pmouseX)
   {
    aSpeed=aSpeed-.5; 
   }
   if (mouseY>pmouseY)
   {
    bSpeed=bSpeed+.5; 
   }
   else if (mouseY<pmouseY)
   {
    bSpeed=bSpeed-.5; 
   }


 //COUNT POINTS & CHECKING COLLISION
  if (( a >= (x-20) && a <= (x+20)) && ( b >= (y-20) && b <= (y+20) ))
  {
   background (255,0,0); 
   n=n+1;
   println (n);
   //ONCE HIT CHANGE TO A RANDOM POINT
    x=random(width);
    y=random(height); 
    //ONCE HIT CHANGE TO A RANDOM SPEED
    xSpeed=random(1,40);
    ySpeed=random(1,40); 
   }

//RESTART AT 100 SO YOU CAN ALWAYS SEE ALL OF THE NUMBERS
  if (n==100)
  {
     n=0;
  }
}

void updateTimer() {
if (s != second()) {
   s= second();
   t++; 
}  
}

void showText () {
 fill(209,211,212);
 
 textSize (580);
 text (n,-75,height);
 
 textSize (25);
 text ("time:", 25, 50);
 text (t, 90, 50);
 text ("total points:", 25, 150);

}

                
                
