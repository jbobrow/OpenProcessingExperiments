
// N. Brand (creation)
// Edited from classroom work, with all code not needed taken out 
// and comments added in code.

// Dog Animation

// FUNCTIONS
//=======================
int armAngle =-0;
int angleChange =5;
final int ANGLE_LIMIT =10;

//   SETUP
//==============
void setup ()
{
  size (600, 600) ;  
  frameRate (10);
  smooth () ;
}
//     DRAW
//=======================
void draw()
{
 
   background(150,200,255); // creates blue background for sky
   fill (100,255,100);      // colour to fill rect shape for grass
   rect (0,400, 600, 300);
   sun ();
   //bone ();
  pushMatrix();
  translate(50, 10); // place dog so its always on screen you can move the whole animation using these points
  
  drawdog();
  armAngle += angleChange;
  
  // if the arm has moved past its limit,
  // reverse direction and set within limits.
  if (armAngle > ANGLE_LIMIT || armAngle < 0) // to make tail wag (loop)
  {
    angleChange = -angleChange; // move tail one way
    armAngle += angleChange; // move tail other way
  }
  popMatrix();
}
void drawdog () 
{
  noStroke();
  fill (38,38,30) ;
  ellipse (270, 330, 200, 125); // dog body
 drawDogHead ();
 drawDogNeck ();
// drawtung ();
 drawDogFace ();
 drawDogEar1 ();
 drawDogEar2 ();
 drawDoglegL1 ();
 drawDoglegL2 ();
 drawDogpaw1 ();
 drawbottombody ();
 drawDogrightleg1 ();
 drawDogrightleg2 ();
 drawDogfoot ();
 drawDogpaw2 ();
 drawtail ();
 draweye1 () ;
 draweye2 ();
}
// THE SUN 
//============
void sun ()
{    
  fill (249,250,15) ;
  ellipse (450,75, 110, 110);
} 

//    HEAD
//=============
void drawDogHead ()
{    
  fill (38,38,30) ;
  ellipse (140,250, 90, 90); 
}

//      NECK
//==================
void drawDogNeck ()
{    
  rotate (radians (135)); 
  fill (38,38,30) ;
  rect (50,-350, 35, 70); 
}


//       FACE
//================
void drawDogFace ()
{     
  rotate (radians (90));
  fill (38,38,30) ;
  ellipse (-290,-115, 60, 90); 
}
//         EAR1
//=====================
void drawDogEar1 ()
{    
  rotate (radians (180));
  fill (38,38,30) ;
  ellipse (275,50, 40, 145); 
}
//      EAR2
//======================
void drawDogEar2 ()
{     
  rotate (radians (125));
  fill (38,38,30) ;
  ellipse (-90,-235, 40, 145); 
}
//      FRONT LEG TOP
//========================
void drawDoglegL1 ()
{  
  fill (38,38,30) ;
  ellipse (-125,-390, 40, 100);
}
//      FRONT LEG BOTTOM
//===========================
void drawDoglegL2 ()
{    
  rotate (radians (30));
  fill (38,38,30) ;
  ellipse (-325,-350, 30, 130);
}

//       FRONT PAW
//======================
void drawDogpaw1 ()
{   
  fill (38,38,30) ;
  ellipse (-310,-405, 45, 30); 
}

//       BOTTOM HALF OF BODY
//=================================
void drawbottombody ()
{  
  fill (38,38,30) ;
  ellipse (-415,-200, 180, 100); 
} 
//    BACK LEG TOP
//==============================
void drawDogrightleg1 ()
{   
  rotate(radians(90));
  fill (38,38,30) ;
  ellipse (-235,480, 125, 50); 
} 
//  BACK LEG BOTTOM
//========================
void drawDogrightleg2 ()
{ 
  rotate(radians(100));  
  fill (38,38,30) ;
  ellipse (548,200, 80, 30); 
} 
// DOG FOOT
//================
void drawDogfoot ()
{ 
  fill (38,38,30) ;
ellipse (582,230, 20, 75); // translated to 0, 0
}
//  DOG BACK PAW
//======================
void drawDogpaw2 ()
{   
  rotate(radians(45));
  fill (38,38,30) ;
  ellipse (590,-220, 30, 40); 
}
// DOG EYE
//====================
void draweye1 () 
{
  rotate(radians(90));
  fill (255) ;
  ellipse (-35,-272, 15, 7); 
}
void draweye2 () 
{
  rotate(radians(25));
  fill (255) ;
  ellipse (-180,-230, 15, 7); 
}
// DOG TAIL WAGGING
void drawtail ()
{
  pushMatrix (); 
  translate (425,-300); // pivot point   
  rotate (radians (armAngle -20)); // makes tail wag
  fill (38,38,30) ;
ellipse (0,0, 25, 175); // translated to 0, 0
popMatrix ();
}



//
//void drawtung ()
//{
//  pushMatrix (); 
//  translate (-40,90); // pivot point   
//  rotate (radians (armAngle -80));
//  fill (255,0,100) ;
//ellipse (0,0, 30,10); // translated to 0, 0
//popMatrix ();
//} 














