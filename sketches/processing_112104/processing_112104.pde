
int armAngle =-0;
int angleChange =5;
final int ANGLE_LIMIT =10;

void setup ()
{
  size (500, 800) ;  
  frameRate (10);
  smooth () ;
}
void draw()
{
 background(255);
  pushMatrix();
  translate(-20, 10); // place robot so arms are always on screen
  drawtoon();
  armAngle += angleChange;
  
  // if the arm has moved past its limit,
  // reverse direction and set within limits.
  if (armAngle > ANGLE_LIMIT || armAngle < 0)
  {
    angleChange = -angleChange;
    armAngle += angleChange;
  }
  popMatrix();
}
void drawtoon () 
{
  noStroke();
  pushMatrix ();
  translate (200,75 );
  noStroke() ;
  fill (38,38,30) ;
  ellipse (0, 15, 65, 135);   // head shape and position
  ellipse (0, 190, 90, 200); // body shape and position
  rect (-8, 50, 20, 70); // neck shape and possition
  drawLeftArm1 ();
  drawLeftArm2 ();
  drawRightRam1 ();
  drawRightArm2 ();
  drawLeftLeg1 ();
  drawRightLeg1 ();
  drawLeftLeg2 ();
  drawRightLeg2 ();
  drawHand1 ();
  drawLefteye ();
  drawRighteye ();
  drawHand2 ();
  drawMouth ();
  drawfoot1 ();
  drawfoot2 ();
  popMatrix();
}

void   drawRightRam1 ()// change it back to left arm
{
  pushMatrix (); 
  translate (-40, 150); // pivot point   
  rotate (radians (45));
  fill (38,38,30) ;
ellipse (0,0, 40, 145); // translated to 0, 0
popMatrix ();
}
void   drawRightArm2 ()
{
   pushMatrix (); 
  translate (-90, 140); // pivot point   
  rotate (radians (180));
  fill (38,38,30) ;
  ellipse (0,0, 30, 130); // translated to 0, 0
  popMatrix ();
}
void drawLeftArm1 ()
{
  pushMatrix (); 
  translate (50, 150); // pivot point   
  rotate (radians (135));
  fill (38,38,30) ;
  ellipse (0, 0, 40, 125); // translated to 0, 0
  popMatrix ();
}
void drawLeftArm2 ()
{
  pushMatrix (); 
  translate (77, 233); // pivot point, setting point   
  rotate (radians (10));
  fill (38,38,30) ;
ellipse (0,0, 30, 130); // translated to 0, 0
popMatrix ();
}

void drawRightLeg1 ()
{
  pushMatrix ();
  translate (25, 280); // pivot point   
  rotate (radians (165)); // angle rotated
  fill (38,38,30) ; // colour
  ellipse (0,-0, 50, 300); // shape and position of leg piece1
  popMatrix ();
}

void drawLeftLeg1 ()
{
  pushMatrix (); 
  translate (-25, 280); // pivot point   
  rotate (radians (185)); // angle rotated
  fill (38,38,30) ; // colour
  ellipse (0,-0, 50, 300); // shape and position of leg piece1
  popMatrix ();
}
void drawLeftLeg2 ()
{
  pushMatrix ();
  translate (-35, 450); // pivot point   
  rotate (radians (0)); // angle rotated
  fill (38,38,30) ; // colour
  ellipse (0,-0,40, 200); // shape and position of leg piece1
  popMatrix ();
}

void drawRightLeg2 ()
{
  pushMatrix ();
  translate (45, 450); // pivot point   
  rotate (radians (10)); // angle rotated
  fill (38,38,30) ; // colour
  ellipse (0,-0,40, 195); // shape and position of leg piece1
  popMatrix ();
}
 void drawHand1 ()
 {
    pushMatrix ();
  translate (-90, 90); // pivot point   
  rotate (radians (armAngle)); // angle rotated
  fill (38,38,30) ; // colour
  ellipse (0,0,30, 80); // shape and position of hand
  popMatrix ();
 }
 
 void drawLefteye ()
{ 
  // pushMatrix ();
  translate (-15,0); // pivot point   
  rotate (radians (15)); // angle rotated
  fill (255) ; // colour
  ellipse (0,0,20, 10); // shape and position of hand
  //popMatrix ();
}
void drawRighteye ()
{

translate (30,-10); // pivot point   
  rotate (radians (-30)); // angle rotated
  fill (255) ; // colour
  ellipse (0,0,20, 10); // shape and position of hand
  
}
 void drawHand2 ()
 {
   pushMatrix ();
  translate (-20,310); // pivot point   
 // rotate (radians (armAngle)); // angle rotated
  fill (38,38,30) ; // colour
  ellipse (0,0,30, 80); // shape and position of hand
  popMatrix ();
 }
  void drawMouth ()
 {
   pushMatrix ();
  translate (-27,40); // pivot point   
  rotate (radians (105)); // angle rotated
  fill (255) ; // colour
  ellipse (0,0,10, 30); // shape and position of hand
  popMatrix ();
 }
  void drawfoot1 ()
 {
   pushMatrix ();
  translate (-210,510); // pivot point   
  rotate (radians (70)); // angle rotated
  fill (38,38,30) ; // colour
  ellipse (0,0,40, 70); // shape and position of hand
  popMatrix ();
 }
  void drawfoot2 ()
 {
   pushMatrix ();
  translate (-110,540); // pivot point   
  rotate (radians (160)); // angle rotated
  fill (38,38,30) ; // colour
  ellipse (0,0,40, 70); // shape and position of hand
  popMatrix ();
 }
 
 

  
  


