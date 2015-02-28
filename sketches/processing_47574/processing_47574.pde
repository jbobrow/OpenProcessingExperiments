
// homeWork (11); 
// copyright Carl Bajandas 2011 Pittsburgh, PA


////////////////////////////////////////////
/////// WORKS IN PROCESSING .... NaN ERROR
///////////////////////////////////////////

float 
x, 
y, 
z, 
boxSize, 
xPos, 
yPos, 
vX, 
vY, 
vZ, 
r01, 
r02, 
r03, 
boxw, 
boxw2, 
boxw3, 
boxh, 
boxh2, 
boxh3, 
boxx, 
boxx2, 
boxx3, 
boxy, 
boxy2, 
boxy3, 
rX, 
rY, 
rZ, 
button, 
button2;



void setup ()
{
  size (500, 500, P3D);
  textMode( SCREEN );
  //noCursor ()      ;
  noStroke ()        ;
  x= width/2         ;
  y= height/2        ; 
  z= 0               ;
  boxSize= width*.0833333;
  vX = 0             ;
  vY = 0             ;
  vZ = 0             ;
  boxw  = width*.63  ;
  boxw2 = width*.63  ;
  boxw3 = 50         ;
  boxh  = 50         ;
  boxh2 = 50         ;
  boxh3 = height*.63 ;
  boxx  = width*.2   ;
  boxx2 = width*.2   ;
  boxx3 = width*.05  ;
  boxy  = height*.85 ;
  boxy2 = height*.05 ;
  boxy3 = height*.2  ;
  r01   = 1.0        ;
  r02   = 1.0        ;
  r03   = 1.0        ;
  button = width*.105 ; 
  button2 = width*.105 ;
}
void draw ()
{
  fThing ();
  moveFthing ();
  topSlider ();   
  sideSlider ();
  lowSlider ();
  buttons ();
  numberInfo ();
}

void moveFthing ()
{
  x = x + vX;
  y = y + vY; 
  z = z + vZ;
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
  else if (key == 'a')
    vZ -= .17; 
  else if (key == 'c')
    vZ += .17; 
  ///////Zoom in / Zoom out     
  else if (key == 'z')
    z = z - 500; 
  else if (key == 'x')
    z = z + 500;    
  ///////return/stop commands 
  else if (key == 's')
    vY = vX = vZ = 0     ;
  // z = 0;
  else if (key == ' ')
  {
    vY = vX = vZ = 0 ;
    x = width/2  ;
    y = height/2 ;
    z = 0 ;
    rX = 0 ;
    rY = 0 ; 
    rZ = 0 ;
    r01   = 1.0        ;
    r02   = 1.0        ;
    r03   = 1.0        ;
  }
}
///////////////////////////////////////
void fThing ()

{
  pushMatrix ();
  translate (x, y, z);
  fill (255, 255);
  background (155);
  ambientLight(200, 200, - 200 );
  directionalLight (51, 102, 126, -1, 0, 0);
  rotateX(radians (rX));
  rotateY(radians (rY));
  rotateZ(radians (rZ));
  for ( float fB = - height*.3 ; fB < height*.3 ; fB=fB + boxSize ) 
  {
    pushMatrix ();
    translate ( -width*.1, fB, 0 );
    box (boxSize); 
    popMatrix ();
  }
  for ( float  fT = - width*.1 ; fT < width*.233 ; fT=fT + boxSize ) 
  {
    pushMatrix ();
    translate ( fT, -width*.3, - width*.1 );
    box (boxSize); 
    popMatrix ();
  }
  for ( float  fT = - width*.1 ; fT < width*.233 ; fT=fT + boxSize ) 
  {
    pushMatrix ();
    translate ( fT, -width*.3, width*.1 );
    box (boxSize); 
    popMatrix ();
  }
  for ( float  fM = - width*.15 ; fM < width*.1 ; fM=fM + boxSize ) 
  {
    pushMatrix ();
    translate ( fM -width*.05, width*.01, width*.1 );
    box (boxSize); 
    popMatrix ();
  }
  for ( float  fM = - width*.15 ; fM < width*.1 ; fM=fM + boxSize ) 
  {
    pushMatrix ();
    translate ( fM -width*.05, width*.01, -  width*.1 );
    box (boxSize); 
    popMatrix ();
  }
  popMatrix ();
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void topSlider() // slider code stolen shamelessly from Golan . . . and altered to a nearly unrecognizeable state. 
{
  // compute the colors from the RGB values
  float rW2 = map(r02, 0, 1, 0, boxw2);     // draw black rectangles in background
  fill (0, 0, 0); 
  rect (boxx2, boxy2, boxw2, boxh2);        // draw  sliders
  fill (255); 
  rect (boxx2, boxy2, rW2, boxh2);          // perform interaction which sets the rotate values
  if ((mousePressed) && (mouseX >  boxx2) && (mouseX < boxx2 + boxw2) && (mouseY > boxy2) && (mouseY < boxy2 + boxh2) )
  {
    r02 = constrain(map(mouseX -boxx, 1, boxw-1, 0, 1), 0, 1);
    rX = map(r02, 0, 1, -360, 360);
  }
}
//boxw2 = 315
// boxy2 = 25
//rW = 0- 315
//boxx2 = 100
//////////////////////////////////////////////////////////
void sideSlider() 

{
  // compute the colors from the RGB values
  float rW3 = map(r03, 0, 1, 0, boxh3);   // draw black rectangles in background
  fill (0); 
  rect (boxx3, boxy3, boxw3, boxh3);  // draw sliders
  fill (255); 
  rect (boxx3, boxy3, boxw3, rW3);  // perform interaction which sets the rotate values
  if ((mousePressed) && (mouseX > boxx3) && (mouseX < boxx3 + boxw3) && (mouseY > boxy3) && (mouseY < boxy3 + boxh3))
  {
    r03 = constrain(map(mouseY-boxy3, 1, boxh3-1, 0, 1), 0, 1);
    rY = map(r03, 0, 1, -360, 360);
  }
}
//  System.out.println (mouseY);
//boxw = 315
// height*.05 = 25
//rW = 0- 315
//boxx = 100
////////////////////////////////////////////////
void lowSlider ()
{
  // compute the colors from the RGB values
  float rW = map(r01, 0, 1, 0, boxw);   // draw black rectangles in background
  fill (0); 
  rect (boxx, boxy, boxw, boxh);  // draw RGB sliders
  fill (255); 
  rect (boxx, boxy, rW, boxh);  // perform interaction which sets the RGB values
  //System.out.println (height*.2);
  if ((mousePressed) && (mouseX >  boxx) && (mouseX < boxx + boxw) && (mouseY > boxy ) && (mouseY < boxy + boxh))
  {
    r01 = map(mouseX-boxx, 1, boxw-1, 0, 1);
    rZ = map(r01, 0, 1, -360, 360);
  }
}
//  System.out.println (mouseY);
//boxw = 315
// height*.05 = 25
//rW = 0- 315
//boxx = 100
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void buttons ()
{
  fill (150);
  ellipse (button, button, button, button); 
  ellipse (button2, height*.905, button2, button2);
  fill (0);
  text ("STOP", button- 14, button-5, button, button);
  text ("RESET", button2 - 16, height*.905 -5, button2, button2);
  if ( mousePressed && ( dist( mouseX, mouseY, button, button) <= button  ))
  {
    vY = vX = vZ = 0     ;
  }
  else if ( mousePressed && ( dist( mouseX, mouseY, button2, height*.905) <= button2 ))
  {
    vY = vX = vZ = 0 ;
    x = width/2  ;
    y = height/2 ;
    z = 0 ;
    rX = 0 ;
    rY = 0 ; 
    rZ = 0 ;
    r01   = 1.0        ;
    r02   = 1.0        ;
    r03   = 1.0        ;
  }
}

void numberInfo ()
{
text (" rotation on 'X' axis " + int (rX) , 300, 150); //        
text (" rotation on 'Y' axis " + int (rY) , 300, 170);
text (" rotation on 'Z' axis " + int (rZ) , 300, 190);

text (" Speed on 'X' axis " +  int (vX*10) , 300, 220);
text (" Speed on 'Y' axis " +  int (vY*10) , 300, 240);
text (" Speed on 'Z' axis " +  int (vZ*10) , 300, 260);

text (" Location on 'X' axis " + int (dist(x, x, width/2, height/2)) , 300, 290);
text (" Location on 'Y' axis " + int (dist(y, y, width/2, height/2)) , 300, 310);
text (" Location on 'Z' axis " + int  (dist(z, z, 0, 0)) , 300, 330);




}

