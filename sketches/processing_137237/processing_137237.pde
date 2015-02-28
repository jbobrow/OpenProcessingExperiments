
PImage bg2, coin, pipe, ground, ground2;
PImage bg, flyright, flyleft, fastleft, fastleft2;
PImage fastleft3, fastright, fastright2, fastright3;
PImage rightup, leftup, leftjump, rightjump, leftfall, rightfall;
PImage duckleft, duckright,marioleft, mariowalkleft;
PImage mariowalkleft2, marioright,mariowalkright,mariowalkright2;
PImage LtoR,RtoL;
int PointsCounter = 0,LR =0,once=1,jumpon=0,jumptime=0,onejump=0, stime=0, i=0;;
float x=100, y=670, speed=0,slow = 0, jump, g=670;
int n=415;


boolean keyup = false;
boolean keyright = false;
boolean keyleft = false;
boolean keydown = false;
boolean keyuplook = false;
boolean keyfast = false;



void setup()
{
  size(600,720);
  



  
   marioleft = loadImage("marioleft.png");
   mariowalkleft = loadImage("mariowalkleft.png");
   mariowalkleft2 = loadImage("mariowalkleft2.png");
   marioright = loadImage("marioright.png");
   mariowalkright = loadImage("mariowalkright.png");
   mariowalkright2 = loadImage("mariowalkright2.png");
   LtoR = loadImage("LtoR.png");
   RtoL = loadImage("RtoL.png");
   duckleft = loadImage("duckleft.png");
   duckright = loadImage("duckright.png");
   leftjump = loadImage("leftjump.png");
   rightjump = loadImage("rightjump.png");
   leftfall = loadImage("leftfall.png");
   rightfall = loadImage("rightfall.png");
   rightup = loadImage("rightup.png");
   leftup = loadImage("leftup.png");
   fastleft = loadImage("fastleft.png");
   fastleft2 = loadImage("fastleft2.png");
   fastleft3 = loadImage("fastleft3.png");
   fastright = loadImage("fastright.png");
   fastright2 = loadImage("fastright2.png");
   fastright3 = loadImage("fastright3.png");
   flyright = loadImage("flyright.png");
   flyleft = loadImage("flyleft.png");
   bg = loadImage("bg.png");
   ground = loadImage("ground.png");
   ground2 = loadImage("ground2.png");
   pipe = loadImage("pipe.png");
   coin = loadImage("coin.png");
   bg2 = loadImage("bg2.jpg");
   


       
  


background(250);
image(marioright,x, y); 
}

void draw()
{
  if (speed == -0.01) speed =0;
  if (x < 400 || x > 800)
  {
   g=670;
  }
  
   if (x > 400 && x < 800)
  {
    g=600;
  }
  
  if (speed <0.1 && speed > -0.1)
 { 
  slow = 0;
  once=0;
 }
  
  
  if (y==600 && x > 390 && x <404)
  {
  jumpon=1;
  speed = -1;
  }
  
  if (y==600 && x < 820 && x >797)
  {
  jumpon=1;
  speed = 1;
  }
  
  if(y<=600)
  if(x > 400 && x < 800)
  {
    {
  x=x+speed;
  }
  }
  
  if(x > 400 && x < 800)
  {
  }
  else
  {
  x=x+speed;
  }
 if ( x >= 400 && x <= 410 && y >600 ) x= 399;
 if ( x <= 800 && x >=790 && y >600 ) x= 801;
 
 
  y=y-jump;

  if (speed >= 0.01) speed-=0.02;
  if (speed <= -0.01) speed+=0.02;


     if (keyup)
    {
  
     jumpon=1;   
     jumptime++;
    
    }
    
    if (keyup == false)
    {
     
      onejump=0;
      jumptime=0;
    }
    
     if (keyfast)
     {
       stime++;
     }
      if (keyfast == false)
     {
       stime=0;
     }
    

   if(keydown == false)
   {
   
   if (keyleft)
   {
     once=1;
     
     
     if (keyfast)
     {
     if (speed > -2.3) speed-=0.08;
     }
     
     if (keyfast ==false)
     {
        if (speed > -1.3) speed-=0.05;
     }
     
     
    LR=0;
    
    
    
    if(keyfast)
    {
    
    
     if (frameCount%16 > 0 && frameCount%16 < 4)
  {
    background(250);
    image(marioleft,x, y);   
  } 
    
  if (frameCount%16 > 4 && frameCount%16 < 8)
{
    background(250); 
    image(mariowalkleft,x, y);
}  
  if (frameCount%16 > 8 && frameCount%16 < 12)
{
    background(250);
    image(mariowalkleft2,x, y);
}

  if (frameCount%16 > 12 && frameCount%16 < 16)
{
    background(250); 
    image(mariowalkleft,x, y);
} 
    }






  if(keyfast==false)
    {
    
    
     if (frameCount%32 > 0 && frameCount%32 < 8 )
  {
    background(250);  
    image(marioleft,x, y);   
  } 
    
  if (frameCount%32 > 8 && frameCount%32 < 16)
{
    background(250); 
    image(mariowalkleft,x, y);
}  
  if (frameCount%32 > 16 && frameCount%32 < 24)
{
    background(250); 
    image(mariowalkleft2,x, y);
}

  if (frameCount%32 > 24 && frameCount%32 < 32)
{
    background(250); 
    image(mariowalkleft,x, y);
} 
    }
    
    
        if (speed < -2.3 && stime > 200)
    {
          if (frameCount%16 > 0 && frameCount%16 < 4 )
  {
    background(250);   
    image(fastleft,x, y);   
  } 
    
  if (frameCount%16 > 4 && frameCount%16 < 8)
{
    background(250); 
    image(fastleft2,x, y);
}  
  if (frameCount%16 > 8 && frameCount%16 < 12)
{
    background(250); 
    image(fastleft3,x, y);
}

  if (frameCount%16 > 12 && frameCount%16 < 16)
{
    background(250); 
    image(fastleft2,x, y);
} 
    }






if (speed > 0 && y == g)
{
    slow=0;
    background(250); 
    image(RtoL,x, y);
}
}



   if (keyright)
   {
     once=1;
     
     
     
     if (keyfast)
     {
     if (speed < 2.3) speed+=0.08;
     }
     
     if (keyfast ==false)
     {
        if (speed < 1.3) speed+=0.05;
     }





LR=1;

         if(keyfast)
    {
    
    
     if (frameCount%16 > 0 && frameCount%16 < 4)
  {
    background(250); 
    image(marioright,x, y);   
  } 
    
  if (frameCount%16 > 4 && frameCount%16 < 8)
{
    background(250); 
    image(mariowalkright,x, y);
}  
  if (frameCount%16 > 8 && frameCount%16 < 12)
{
    background(250);
    image(mariowalkright2,x, y);
}

  if (frameCount%16 > 12 && frameCount%16 < 16)
{
    background(250); 
    image(mariowalkright,x, y);
} 
    }
    
   






  if(keyfast==false)
    {
    
    
     if (frameCount%32 > 0 && frameCount%32 < 8 )
  {
    background(250); 
    image(marioright,x, y);   
  } 
    
  if (frameCount%32 > 8 && frameCount%32 < 16)
{
    background(250); 
    image(mariowalkright,x, y);
}  
  if (frameCount%32 > 16 && frameCount%32 < 24)
{
    background(250);
    image(mariowalkright2,x, y);
}

  if (frameCount%32 > 24 && frameCount%32 < 32)
{
    background(250); 
    image(mariowalkright,x, y);
} 
    }
    
    
    if (speed > 2.3 && stime > 200)
    {
          if (frameCount%16 > 0 && frameCount%16 < 4 )
  {
    background(250);  
    image(fastright,x, y);   
  } 
    
  if (frameCount%16 > 4 && frameCount%16 < 8)
{
    background(250); 
    image(fastright2,x, y);
}  
  if (frameCount%16 > 8 && frameCount%16 < 12)
{
    background(250); 
    image(fastright3,x, y);
}

  if (frameCount%16 > 12 && frameCount%16 < 16)
{
    background(250); 
    image(fastright2,x, y);
} 
    }
      
    
    
    
    
    

if (speed < 0 && y == g)
{
  slow=0;
  once =0;
    background(250);
    image(LtoR,x, y);
}
   }





if (keyleft == false && keyright == false) 
{
  if (LR==1)
  {
    
    
         if (frameCount%32 > 0 && frameCount%32 < 8 )
  {
    background(250);  
    image(marioright,x, y);   
  } 
    
  if (frameCount%32 > 8 && frameCount%32 < 16)
{
    background(250);  
    image(mariowalkright,x, y);
}  
  if (frameCount%32 > 16 && frameCount%32 < 24)
{
    background(250); 
    image(mariowalkright2,x, y);
}

  if (frameCount%32 > 24 && frameCount%32 < 32)
{
    background(250);
    image(mariowalkright,x, y);
}
    
    
    
 
  }
  
  
  
  
  if (LR==0)
  {
  
    
         if (frameCount%32 > 0 && frameCount%32 < 8 )
  {
    background(250); 
    image(marioleft,x, y);   
  } 
    
  if (frameCount%32 > 8 && frameCount%32 < 16)
{
    background(250); 
    image(mariowalkleft,x, y);
}  
  if (frameCount%32 > 16 && frameCount%32 < 24)
{
    background(250); 
    image(mariowalkleft2,x, y);
}

  if (frameCount%32 > 24 && frameCount%32 < 32)
{
    background(250); 
    image(mariowalkleft,x, y);
}
    
    
    
  
  }
  
  
  
}   
   }
    
    
    
    

if (speed <0.1 && speed > -0.1 && LR ==0)
 { 
  background(250);
  image(marioleft,x, y);
 }
 
 
 if (speed <0.1 && speed > -0.1 && LR==1)
 { 
 background(250); 
 image(marioright,x, y);
 }
 
 if (jumpon == 1)
 {
 
    if (jump < 0) jumpon=0;
   
   
      if(y==g && jumpon == 1) 
     {
       if (onejump == 1)
       {
     if (keyfast) jump = 5;
     if (keyfast == false) jump = 4;
     } 
     }
     onejump=0;
     
   
     if (jumptime > 10) jump-=0.08;
     if (jumptime > 0 && jumptime < 10 ) jump-=0.12; 
     if (jumptime == 0) jump-=0.3;
     
        
 }
 
 
  if (jump < 0 && jump >- 3  ) jump-=0.1; 
  if (jump < 0 && y>g-5) 
  {
  jump=0;
  y=g;
  }
 
  
  
  if (jump > 0)
  {

if (LR==1)
  {
   background(250);  
   image(rightjump,x, y);
  }
  
    if (LR==0)
  {
   background(250); 
   image(leftjump,x, y);
  }
}


  if (jump < -2)
  {

if (LR==1)
  {
   background(250);
   image(rightfall,x, y);
  }
  
    if (LR==0)
  {
   background(250);
   image(leftfall,x, y);
  }
}


 if (jump != 0)
 {
   
   
   
   if(LR == 0)
   {
     if (speed < -2 && stime > 200)
    {
    background(250);  
   image(flyleft,x, y);
    }
   }
      if(LR == 1)
   {
       if (speed > 2 && stime > 200)
    {
    background(250); 
   image(flyright,x, y);
    }
    
 }
 }
 
 
 

   if (keyuplook)
   {
     
     if(LR==1)
      {
     if (speed < 0.1 && speed > -0.1)
     {
       if (y == g)
       {
     background(250); 
   image(rightup,x, y);
       }
     }
   }
   
   
   
   if(LR==0)
      {
     if (speed < 0.1 && speed > -0.1)
     {
       if (y == g)
       {
     background(250);
   image(leftup,x, y);
       }
     }
   }
   
   
   
   
   }
   
   
   
    if (keydown)
   {
      if(LR==1)
      {
      background(250);  
      image(duckright,x, y+13);
      }
      if(LR==0)
      {
      background(250); 
      image(duckleft,x, y+13);
      }
   }
   
   
   
   

   
  for(int n=415 ; n < 780; n+= 32)
   {
    image(pipe,n, 652);
   }
   
   
 
   
   for(int n=415 ; n < 780; n+= 32)
   {
    image(pipe,n, 626);
   }
   
  
   
   

 
  

  

 
 
   if (keyup == false)
    {
      onejump=1;
     
    }
 
 
 
 

/*
textSize(10);
text(slow,30,10);
text(speed,10,30);
text(x,10,50);
text(once,10,70);
text(jump,10,90);
text(y,10,110);
text(jumptime,10,130);
text(stime,10,170);
 
 
textSize(50);
text(PointsCounter,300,200);
*/


if (speed == -0.01) speed =0;
if (speed == 0.01) speed =0;



   

  
  

  
 

  for(i=0;i<700;i+=16)
  {
  image(ground,i,670+28);
  }
  for(i=0;i<700;i+=16)
  {
  image(ground2,i,670+28+16);
  }
 }
 
 
 void keyPressed() {
   if (key == 'a') keyup = true; 
   if (key == 's') keyfast = true; 
  if (key == CODED) {
    if (keyCode == UP) keyuplook = true; 
    if (keyCode == DOWN) keydown = true; 
    if (keyCode == LEFT) keyleft = true; 
    if (keyCode == RIGHT) keyright = true; 
  }
}
 
void keyReleased() {
  if (key == 'a') keyup = false;
  if (key == 's') keyfast = false;
  if (key == CODED) {
    if (keyCode == UP) keyuplook = false; 
    if (keyCode == DOWN) keydown = false; 
    if (keyCode == LEFT) keyleft = false; 
    if (keyCode == RIGHT) keyright = false; 
  }
}


