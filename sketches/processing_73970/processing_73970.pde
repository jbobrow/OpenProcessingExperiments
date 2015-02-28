
/*
Richard May rwamy@andrew.cmu.edu
Copyright @ October 2012
HW7

Mouse Movement Controls Slider at Bottom of Screen. Try to bounce ball of sldier.
Do not miss or you will loose your streak!!! 
The speed your move your mouse when the ball bounces of the slider transfers into the ball.
Click and drag the mouse to charge up your collider. Hit the black ball with your collider to randomize the balls path.
*/
float hitCount, pad, padLocX, padLocY;
//for pad
float fX, fY, fXSpeed, fYSpeed, fRad, distPad, curVel, slow;
//for falling ball
float count;
//for calculations
float g, cYSpeed,cY,go,reset, noiseTest;
//for collision
int Ccount, Scount, TotWrapCount,TotBounceCount;
//for COUNTS
int S;
float wX,wY,buffX,buffY,acc;



//float
//for collision ball
void setup ()
{
  size (500, 650);
  hitCount = 0;
  pad = .5*width;
  fX = random (0, width);
  fY = random (0, .5*height);
  fXSpeed = 0;
  fYSpeed = 2.5;
  fRad = .025*width;
  count = 0;
  curVel=0;
  slow=.8;
  g = 0;
  cYSpeed=.00125;
  cY = height;
  go=0;
  reset=0;
  Ccount=0;
  Scount=0;
  TotWrapCount = 0;
  TotBounceCount = 0;
  int S = 0;
  wX = random(0,width);
  wY = random (0,height);
  buffX = 0;
  buffY = 0;
  acc = random(0,10);
}
void draw()
{
  Counter();
  collisionBall();
  wrappingRequirement();
  fallingBall();
  cursorPad();
  setWindow();


  stroke(90);
  //text (millis() + "milliseconds", width/2,height/2);
  text (mouseX, width/2, height/2);
  text (pmouseX, width/2, height/2 + 20);
  text(mouseX-pmouseX, width/2, height/2 +40);
  text(hitCount, width/2, height/2 + 60);
  text(padLocX, width/2, height/2 + 80);
}


void wrappingRequirement ()
{
  fill(0,0,255,8);
  buffX = (.25* (mouseX-pmouseX));
  buffY =(.25 * (mouseY-pmouseY));
  wX= wX + acc + buffX;
  wY= wY + acc + buffY;
  ellipse(wX,wY, .5 * width, .5 * height);
  if (wX > height)
  {
    wX = 0;
    acc = random (-5,5);
  }
  if (wX < 0)
  {
     wX=height;
    acc = random (-5,5); 
  }
  if (wY > height)
  {
     wY=0;
    acc = random (-5,5); 
  }
  if (wY<0)
  {
    wY=height;
    acc = random (-5,5);
  }
  
  
  
  
}


void Counter()
{
 int S = second(); 
 fill (0);
 text ("Collision Count " + Ccount, .7 *width, .2*width); 
 text ("Slider Streak " + Scount, .7* width, .3* width);
 text ("Wrap Count " + TotWrapCount, .7 * width, .4 * width);
 text ("Total Bounce Count " + TotBounceCount, .7 * width, .5 * width);
 text ( "Time:"+(millis()/1000), .7 * width, .6 * height);
}

void collisionBall()
{
  noStroke();
  smooth();
  fill (255,0,0,50);
  ellipse (mouseX,cY, (g/2), (g/2));
  
    if (go>0)
    {
      ellipse (mouseX + .5*(mouseX-abs(pmouseX)),cY, (g/2), (g/2));
      cY = cY-cYSpeed;
      cYSpeed ++;
    }
    if (cY< 0-.4*height)
    {
      reset ++;
      cY= height + 20;
      cY = cY - cYSpeed; 
      cYSpeed += cYSpeed;
    }
    if (reset == 10)
    {
      g=0;
      go = 0;
      cY = height;
      cYSpeed = 0;
      ellipse (mouseX,cY, (g/2), (g/2));
      reset = 0;
    }
    
    //COLLISION
    if ( cY - (g/2) <= fX-fRad && cY + (g/2) >= fX+fRad&& fX - fRad <= mouseX + .5*(mouseX-abs(pmouseX)) && fX + fRad >= mouseX + .5*(mouseX-abs(pmouseX)))
   {
     fX = random (0,width);
     fY = random (0,height);
     fXSpeed = random (-10,10);
     fYSpeed = random (-10,10);
     Ccount = Ccount + 1;
     println (Ccount);
     noiseTest = noiseTest + .01;
  float n = noise(noiseTest) * width;
  line(n, 0, n, height);
  
     fill (255,0,0,40);
    rect ( random ( 0,width) , random ( 0,width), random ( 0,width), random ( 0,width));
    rect ( random ( 0,width) + random (.25*width), random ( 0,width), random ( 0,width), random ( 0,width));
    rect ( random ( 0,width), random ( 0,width) + random (.25*width), random ( 0,width), random ( 0,width));
    rect ( random ( 0,width), random ( 0,width), random ( 0,width) + random (.25*width), random ( 0,width));
    rect ( random ( 0,width) + random (.25*width), random ( 0,width), random ( 0,width), random ( 0,width));
    ellipse (mouseX + .5*(mouseX-abs(pmouseX)) + .25*width ,cY, (g/2), (g/2));
    ellipse (mouseX + .5*(mouseX-abs(pmouseX)) - .25*width ,cY, (g/2), (g/2));
   } 
      
}
    
//   if (mouseDragged()) 
//   {
//     g+=g;
//     
//    println ("g");
//}


void mouseDragged()
{
//  if (go = 0)
//  {
  if (g < .2*width)
  {
    g+= 1;
  }
  //g = g+1;
  //println(g);
  //}
}
void mouseReleased ()
{
  go = go + 1;
// ellipse (mouseX,cY, (g/2), (g/2));
//  cY = cY-cYSpeed;
//  cYSpeed += cYSpeed;
}




void fallingBall()
{
  curVel=mouseX-pmouseX;
  distPad = dist(fX, padLocY, mouseX, padLocY);
  //println (distPad);
  fill(0);
  ellipse (fX, fY, fRad, fRad); 
  fY = fY + fYSpeed;
  fX = fX + fXSpeed;

  //wrap
  if (fY - 2*fRad >height)
  {
    fYSpeed = .25 * fYSpeed;
    fXSpeed = .25 * fXSpeed;
    fY = .05*height;
    count++;
    Scount = 0;
    TotWrapCount = TotWrapCount + 1;
    
  }

  //bottom bounce
  if (fY >= height- .5*padLocY)
  {
    if (distPad < 100)
    { 
      TotWrapCount = TotWrapCount + 1;
      Scount = Scount + 1;
      fYSpeed = -fYSpeed -.6;
      hitCount = hitCount + 1;
      fXSpeed= fXSpeed + .125*curVel;
    }
  }

  //top bounce
  if (fY < 0 + fRad)
  { 
    TotWrapCount = TotWrapCount + 1;
    if (-8<abs(fYSpeed) && 0>abs(fYSpeed))
    { 
      fYSpeed = -fYSpeed - slow;
    }
    else 
    {
      fYSpeed = -fYSpeed;
    }
  }

  //left bounce
  if (fX < 0 + fRad)
  {
    TotWrapCount = TotWrapCount + 1;
    if (-8 < abs(fXSpeed) && 0> abs(fXSpeed))
    {
      fXSpeed = -fXSpeed - slow;
    }
    else
    {
      fXSpeed = -fXSpeed;
    }
  }

  //right bounce
  if (fX > width - fRad)
  {
    TotWrapCount = TotWrapCount + 1;
    if (0 < abs(fXSpeed) && 0 > abs(fXSpeed)) 
    {
      fXSpeed = - fXSpeed + slow ;
    }
    else
    {
      fXSpeed = - fXSpeed;
    }
  }
    //for (fy < 30; fy>0; fy--){

    //if (fX 
    //if (fX> mouseX - .5*pad && fX< mouseX+ .5*pad && fY == .1*pad)  
    //  {
    //    fYSpeed = -fYSpeed;
    // }

    //}
  }
  void setWindow ()
  {
    rectMode (CORNER);
    fill(255, 255, 255, 30);
    rect (0, 0, width, height);
  }
  void cursorPad()
  {

    noCursor();
    rectMode (CENTER);
    fill(0, 0, 0, 30);
    padLocX = pad - 2*hitCount;
    padLocY = .1*pad;
    rect (mouseX, height, padLocX, padLocY);
  }


