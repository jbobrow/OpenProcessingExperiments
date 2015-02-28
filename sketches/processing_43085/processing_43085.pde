
 // homeWork (8); 
// copyright Carl Bajandas 2011 Pittsburgh, PA

//////////////////////// GLOBAL \\\\\\\\\\\\\\\\\\\\\\\\\\

float 
d, 
distance, 
centerX, 
centerY, 
xPos, 
yPos, 
xPos2, 
yPos2, 
dia, 
dia2, 
inc, 
deltaX, 
deltaY, 
spaceX, 
spaceY, 
vX2, 
vY2, 
vX, 
vY, 
speedX, 
speedY, 
distSmash;

int
smash,
time;
///////////////////////SETUP\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
void setup ()
{
  size (400, 400)   ;
  smooth         ();
  noFill         ();
  noCursor       ();
  rectMode (CENTER);
  centerX = width/2;
  centerY = height/2;
  dia  = height*.1 ;
  dia2 = width/12   ;
  inc  = 2         ;
  xPos = width/2   ;
  yPos = height/2  ;
  distance = dist ( centerX, centerY, xPos, yPos);
  deltaX = 2       ;
  deltaY = 2       ;
  speedX = 0       ;
  speedY = 0       ;
  vX = 0           ;
  vY = 0           ;
  vX2 = random (3, 5)           ;
  vY2 = random (3, 5)           ; 
  xPos2 = random ( 0 + dia/2, width  - dia/2);
  yPos2 = random ( 0 + dia/2, height - dia/2 );
  smash = 0;
}


///////////////////////DRAW\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

void draw ()
{
  prepScreen ()              ;
  moveShapey ()              ;
  trackShapey ()             ;
  printBox ()                ;
  shapey (xPos, yPos, dia, dia  );
  CFB (xPos2, yPos2, dia, dia);
  mouse ()                   ;
  bounceThing ()             ;
  SMASH ()                   ;
  showStats()                ;
  
}

///////////////////FUNCTIONS CALLED\\\\\\\\\\\\\\\\\\\\\

void mouse ()
{
  strokeWeight (2)                               ;            
  fill (150, 50, 50, 20)                         ;
  ellipse (mouseX, mouseY, height*.05, width*.05);
}

//////////////////////////////////////////////////////////

void prepScreen ()
{
  fill (150, 50)                           ;
  rect (centerX, centerY, width, height);
}

//////////////////////////////////////////////////////////

void SMASH ()
{
  d = dist (xPos, yPos, xPos2, yPos2);
  if (d < dia2)
  {
    background (255, 0, 0);
    xPos2 = random ( 0 + dia/2, width  - dia/2);
    yPos2 = random ( 0 + dia/2, height - dia/2 );

    vX2 = random (3, 5);
    vY2 = random (3, 5);
   
    smash += 1; 
   
  }
}
//////////////////////////////////////
 void showStats() 
 {
 time = millis () / 1000;
 fill (0);
 text ( "Collision Count"+" = "+smash, height*.1, width*.1); 
 text ( "Vertical Speed" + " = " + int (vX), height*.1, width*.15);
 text ( "Horizontal Speed" + " = " + int (vY), height*.1, width*.2);
 text ( "Time" + " = " +time, height*.1, width*.25);
 
    
 }
//////////////////////////////////////////////////////////

void moveShapey ()
{
  xPos = xPos + vX;
  yPos = yPos + vY; //dist (centerX, centerY )/100; use this for tracking
}
void  keyPressed ()
{  
  if (keyCode == RIGHT) 
    vX += .17;
  else if (keyCode == LEFT)
    vX -= .17;
  else if (keyCode == UP)
    vY -= .17;
  else if (keyCode == DOWN)  
    vY += .17;
  else if (key == ' ')
  {
    vY = vX = 0     ;
    xPos = width/2  ;
    yPos = height/2 ;
  }
} 
// PVector - look this up !


/////////////////////////////////////////////////
void trackShapey ()
{
  if ( xPos > height || xPos < 0 || yPos > width || yPos < 0 )
  {
    stroke (0); 
    fill (75);
    ellipse (centerX, centerY, height*.05, width*.05); 
    rect ( centerX + 20, centerY  - height*.1, width*.75, height/5);
    line (centerX, centerY, xPos, yPos) ;
    fill (0);
    text ( "Come back ... we love you !", centerX - 90, centerY - 50);  
    text ( "You are", centerX - 90, centerY - 25);
    text ( "parsecs away from us !!!", centerX + 12, centerY - 25);
    text ( dist (centerX, centerY, xPos, yPos), centerX -47, centerY - 25);
  }
}
///////////////////////////////////////////////
void bounceThing ()

{

  xPos2 += vX2; 
  yPos2 += vY2;


  if ((xPos2 > width- dia/2) || (xPos2 < 0 + dia/2)) 
    vX2 = - vX2;

  if ((yPos2 > height- dia/2 ) || (yPos2 < 0 + dia/2))
    vY2 = - vY2;

  vX2 = vX2*1.0007;
  vY2 = vY2*1.0007;
}


///////////////////////////////////////CALL printBox 

void printBox ()
{
  stroke (30);
  strokeWeight (3);
  fill (25, 25, 90);
  rect (width/2, height, width, height /-5.5);
} 
//////////////////////////////////////////////

void textPrint()
{
  fill(255, 255, 255);
  text("HORIZONTAL SPEED", width/4, height*.9);
  text("VERTICAL SPEED", width/4, height*.95);
  text (speedX*10, width*.65, height*.9);
  text (speedY*10, width*.65, height*.95);
}

/////////////////////////////////////////////////////////

void shapey (float x, float y, float wd, float ht)
{
  noStroke();    // why does this take of the mouse strokeWeight ? 
  fill (200);
  ellipse ( x, y, width/6, height/32);
  ellipse ( x, y, width *.08, height*.05);
}
///////////////////////////////////////////////////////
///////////////////////////////////////// CALL CFB 
////////////////////////////////////////////
////////////////////////////////////////////
////////////////////////////////////////////
void CFB (float x, float y, float wd, float ht)
{

  //// THIS IS THE B \\\\
  beginShape ();
  noFill();
  stroke( 125, 125, 200); // blue 
  curveVertex ( x + .04 * wd, y - .39 *ht);
  curveVertex ( x + .04 * wd, y - .39 *ht);
  curveVertex ( x + .07 * wd, y - .23 *ht);
  curveVertex ( x + .09 * wd, y);
  curveVertex ( x + .07 * wd, y + .23 *ht);
  curveVertex ( x + .04 * wd, y + .39 *ht);
  curveVertex ( x + .14 * wd, y + .39 *ht);
  curveVertex ( x + .33 * wd, y + .31 *ht);
  curveVertex ( x + .40 * wd, y + .20 *ht);
  curveVertex ( x + .42 * wd, y + .08 *ht);
  curveVertex ( x + .32 * wd, y);
  curveVertex ( x + .42 * wd, y - .08 *ht);
  curveVertex ( x + .40 * wd, y - .20 *ht);
  curveVertex ( x + .33 * wd, y - .31 *ht);
  curveVertex ( x + .14 * wd, y - .39 *ht);
  curveVertex ( x + .04 * wd, y - .39 *ht);
  curveVertex ( x + .33 * wd, y - .31 *ht);

  endShape();


  //// THIS IS THE C \\\\

  // this is the C's inner arc

  beginShape ();
  stroke( 125, 200, 125 ); // green 
  curveVertex   ( x + .25 * wd, y - .40 * ht );
  curveVertex   ( x + .25 * wd, y - .40 * ht );
  curveVertex   ( x + .10 * wd, y - .43 * ht );
  curveVertex   ( x - .10 * wd, y - .40 * ht );
  curveVertex   ( x - .28 * wd, y - .25 * ht );
  curveVertex   ( x - .35 * wd, y - .08 * ht );
  curveVertex ( x - .35 * wd, y + .08 * ht );
  curveVertex ( x - .28 * wd, y + .25 * ht );
  curveVertex ( x - .10 * wd, y + .40 * ht );
  curveVertex ( x + .10 * wd, y + .43 * ht );
  curveVertex ( x + .25 * wd, y + .40 * ht );

  // this is the C's outer arc 

  curveVertex   ( x + .25 * wd, y + .40 * ht );
  curveVertex   ( x + .10 * wd, y + .45 * ht );
  curveVertex   ( x - .10 * wd, y + .45 * ht );
  curveVertex   ( x - .30 * wd, y + .35 * ht );
  curveVertex   ( x - .45 * wd, y + .13 * ht );
  curveVertex ( x - .45 * wd, y - .13 * ht );
  curveVertex ( x - .30 * wd, y - .35 * ht );
  curveVertex ( x - .10 * wd, y - .45 * ht );
  curveVertex ( x + .10 * wd, y - .45 * ht );
  curveVertex ( x + .25 * wd, y - .40 * ht );
  curveVertex ( x + .25 * wd, y - .40 * ht );        
  endShape();

  //// THIS IS THE effin F \\\\

  beginShape ();
  stroke (200, 125, 125);
  curveVertex ( x + .01 * wd, y - .30 * ht); 
  curveVertex ( x + .01 * wd, y - .30 * ht); 
  curveVertex ( x - .06 * wd, y - .36 * ht); 
  curveVertex ( x - .10 * wd, y);
  curveVertex ( x - .02 * wd, y + .37 * ht);
  curveVertex ( x - .02 * wd, y + .37 * ht);

  endShape(); 

  //// this is the f's cross \\\\

  beginShape();             
  vertex  ( x - .16 * wd, y - .01 * ht); 
  vertex  ( x - .01 * wd, y - .03 * ht); 
  endShape  ();
}

