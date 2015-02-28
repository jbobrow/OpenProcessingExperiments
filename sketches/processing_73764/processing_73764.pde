
//Homework 7

//Danielle Dong
//dmdong@andrew.cmu.edu
//copyright Danielle Dong, Carnegie Mellon University, Pittburgh, PA


// INSTRUCTIONS
// there are three bubbles -- two are fakes! 
// pop the real target one with your bubble (the more opaque one) to increase your score
// move your 'fan' (mouse) around to affect where your bubble goes (if you move your fan in a direction, the bubble you control moves faster in that direction)
// do not run into the wall though! it will reset your score, and you want to have it to be as high as you can get it





//global variables
int startTime;
int collisionCount = 0;
float fanX, fanY;
float fanRad;
float fanSpeedX, fanSpeedY;
float bubbleSpeedX1, bubbleSpeedY1, bubbleSpeedX2, bubbleSpeedY2, bubbleSpeedX3, bubbleSpeedY3;
float popSpeedX, popSpeedY;
float bubbleWidth, bubbleHeight;
//didn't define these so automatically start (0,0) and end up somewhere else because of collisionCheck
float bubbleX1, bubbleY1, bubbleX2, bubbleY2, bubbleX3, bubbleY3;;
float popX1, popY1;





void setup ()
{
  size (400, 400);
  smooth ();
  noCursor ();
  
  fanRad = width*.05 ;
  bubbleWidth= width*.15 ;
  bubbleHeight= height*.15 ;

  bubbleSpeedX1 = 1;
  bubbleSpeedY1 = 1;
  bubbleSpeedX2 = 2;
  bubbleSpeedY2 = 2;
  bubbleSpeedX3 = 2;
  bubbleSpeedY3 = 2;
  
  fanX = 0; 
  fanY = 0;
  fanSpeedX = .5;
  fanSpeedY = .5;
  
  popX1 = 0; 
  popY1 = 0;
  popSpeedX = .5;
  popSpeedY = .5;
}





void draw ()
{
  background (9, 27, 95);

  playTimer ();
  targetFan (mouseX, mouseY, fanRad);   //fan,acts as mouse/cursor
  targetPopper (popX1, popY1, bubbleWidth, bubbleHeight);  //popper you have to move
  popMoveWrap (); //
  targetBubble (bubbleX1, bubbleY1, bubbleWidth, bubbleHeight); //target bubble
  bubbleDrift1(); //movement for target bubble
  targetBubble (bubbleX2, bubbleY2, bubbleWidth, bubbleHeight); //FAKE #1
  bubbleDrift2();//FAKE #1 movement
  targetBubble (bubbleX3, bubbleY3, bubbleWidth, bubbleHeight); //FAKE #2
  bubbleDrift3();//FAKE #2 movement
  collisionCheck ();
}










void collisionCheck ()
{
  float d = dist (popX1, popY1, bubbleX1, bubbleY1);
  println (bubbleWidth + bubbleHeight + "  "  + d);

  //text to show score +1 when colliding
  textAlign (CENTER);
  textSize (14);
  fill (225, 225, 225, 50);

  text ("SCORE:", width/2, (height/2)+(.10*height));
  text (collisionCount, width/2, (height/2)+(.15*height));

  if (d < ( (bubbleHeight/2) + (bubbleHeight/2) ) ) //if the distance beween the two is smaller than their radii
  {
    //bubble randomly moves somewhere else
    bubbleX1 = random(width) ;
    bubbleY1 = random (height) ;
    bubbleSpeedX1 = 3;
    bubbleSpeedY1 = 3;
    //fake bubbles move somewhere random too, but speed isn't changed
    bubbleX2 = random(width) ;
    bubbleY2 = random (height) ;
    bubbleX3 = random(width) ;
    bubbleY3 = random (height) ;
    //fan moves somewhere else too
    popX1 = random (50, 350); 
    popY1 = random (50, 350);
    //collision counter increases by 1
    if (frameCount > 10) //accounts for the beginning collision
    {
      collisionCount = collisionCount + 1;
      
      // 'dramatic' collision
      background (245, 10, 10);
      textAlign (CENTER);
      textSize (40);
      fill (225, 225, 225);
      text ("POP", width/2, height/2 );
      background (9, 27, 95);
    }
  }
  if ( (popX1 - (bubbleWidth/2) == 0) || (popX1 + (bubbleWidth/2) >400) || (popY1 - (bubbleHeight/2) == 0) || (popY1 + (bubbleHeight/2) > 400) )
  {
    collisionCount = 0;
  }
}


void playTimer ()
{
  textAlign (CENTER);
  textSize (14);
  fill (225, 225, 225, 50);
  startTime = millis() / 1000 ;
  text ("TIME:", width/2, height/2);
  text (startTime, width/2, (height/2)+(.05*height));
}


void targetFan (float fanX, float fanY, float fanRadius ) 
{
  noStroke();
  fill (255, 255, 255, 50);
  
  ellipse (fanX, fanY, fanRadius*2, fanRadius*2);
  //spinning lines
  pushMatrix();
  translate (fanX, fanY);
  rotate (radians(-frameCount*10));
  strokeWeight(1);
  stroke(255, 255, 255);
  line (0, 0, 0, -fanRadius);
  line (0, 0, fanRadius, 0);
  line (0, 0, 0, fanRadius);
  line (0, 0, -fanRadius, 0);
  popMatrix();
}


void popMoveWrap ()
{
  popX1 = popX1 + popSpeedX;
  popY1 = popY1 + popSpeedY;

  // mouse input, 
  if (pmouseX < mouseX)
  {
    popSpeedX = popSpeedX +.1 ;
  }
  if (pmouseX > mouseX)
  {
    popSpeedX = popSpeedX - .1;
  }
  if (pmouseY < mouseY)
  {
    popSpeedY = popSpeedY +.1;
  }
  if (pmouseY > mouseY)
  {
    popSpeedY = popSpeedY - .1;
  }
  
 //wrapping
  if ( (popX1 - (bubbleWidth/2) ) > width )
  {
    popX1 = (0 - (bubbleWidth/2) ) ;
  }
  if ( (popX1 + (bubbleWidth/2) ) <0 )
  {
    popX1 = (width + (bubbleWidth/2) ) ;
  }
  if ( (popY1 - (bubbleWidth/2) ) > height )
  {
    popY1 = 0 - (bubbleWidth/2) ;
  }
  if ( (popY1 + (bubbleWidth/2) ) < 0 )
  {
    popY1 = height + (bubbleWidth/2) ;
  }
}

void targetPopper (float bubbleX1, float bubbleY1, float bubbleWidth, float bubbleHeight) 
{
  noStroke ();
  fill (255, 255, 255, 80);
  ellipse (bubbleX1, bubbleY1, bubbleWidth, bubbleHeight);
  fill (255, 255, 255, 100);
  ellipse (bubbleX1 - (bubbleWidth*.25), bubbleY1 - (bubbleHeight*.25), bubbleWidth*.2, bubbleHeight*.2);
}


void bubbleDrift3 ()  //FAKE #2
{
  bubbleX3 = bubbleX3 + bubbleSpeedX3 ;
  if (bubbleX3 + (.5*bubbleWidth) > width )
  {
    bubbleSpeedX3 = -bubbleSpeedX3;
  }
  if (bubbleX3 - (.5*bubbleWidth) < 0 )
  {
    bubbleSpeedX3 = -bubbleSpeedX3;
  }  
  bubbleY3 = bubbleY3 + bubbleSpeedY3 ;
  if (bubbleY3 + (.5*bubbleHeight) > height )
  {
    bubbleSpeedY3 = -bubbleSpeedY3;
  }
  if (bubbleY3 - (.5*bubbleHeight) < 0 )
  {
    bubbleSpeedY3 = -bubbleSpeedY3;
  }
}

void bubbleDrift2 ()  //FAKE#1
{
  bubbleX2 = bubbleX2 + bubbleSpeedX2 ;
  if (bubbleX2 + (.5*bubbleWidth) > width )
  {
    bubbleSpeedX2 = -bubbleSpeedX2;
  }
  if (bubbleX2 - (.5*bubbleWidth) < 0 )
  {
    bubbleSpeedX2 = -bubbleSpeedX2;
  }  
  bubbleY2 = bubbleY2 + bubbleSpeedY2 ;
  if (bubbleY2 + (.5*bubbleHeight) > height )
  {
    bubbleSpeedY2 = -bubbleSpeedY2;
  }
  if (bubbleY2 - (.5*bubbleHeight) < 0 )
  {
    bubbleSpeedY2 = -bubbleSpeedY2;
  }
}

void bubbleDrift1 ()
{
  bubbleX1 = bubbleX1 + bubbleSpeedX1 ;
  if (bubbleX1 + (.5*bubbleWidth) > width )
  {
    bubbleSpeedX1 = -bubbleSpeedX1;
  }
  if (bubbleX1 - (.5*bubbleWidth) < 0 )
  {
    bubbleSpeedX1 = -bubbleSpeedX1;
  }  
  bubbleY1 = bubbleY1 + bubbleSpeedY1 ;
  if (bubbleY1 + (.5*bubbleHeight) > height )
  {
    bubbleSpeedY1 = -bubbleSpeedY1;
  }
  if (bubbleY1 - (.5*bubbleHeight) < 0 )
  {
    bubbleSpeedY1 = -bubbleSpeedY1;
  }
}

void targetBubble (float bubbleX1, float bubbleY1, float bubbleWidth, float bubbleHeight) 
{
  noStroke ();
  fill (255, 255, 255, 20);
  ellipse (bubbleX1, bubbleY1, bubbleWidth, bubbleHeight);
  fill (255, 255, 255, 80);
  ellipse (bubbleX1 - (bubbleWidth*.25), bubbleY1 - (bubbleHeight*.25), bubbleWidth*.2, bubbleHeight*.2);
}



