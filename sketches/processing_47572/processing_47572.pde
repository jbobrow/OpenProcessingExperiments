
// homeWork (10); 
// copyright Carl Bajandas 2011 Pittsburgh, PA

// Radian : A unit of angle, equal to an angle at the center of a circle whose arc is equal in length to the radius.


float x,y, boxSize;

///////////////////////////
///// THIS WORKS IN PROCESSING ? ITS GIVING ME A NaN ERROR
///////////////////////////

void setup ()
{
  size (200, 200, P3D);
  noCursor ();
  noStroke ();
  x= width/2 ;
  y= height/2 ;
  boxSize= width*.0833333;
}
void draw ()
{
  
    translate(x, y, 0); 
    effects  (); 
    fBack    ();
    fTop     ();
    fTop2    ();
    fMid     ();
    fMid2    ();
}
void effects ()
{

  //translate(50, 50,0); 
  fill (255, 255, 255);
  background (155);
  ambientLight(200, 200, - 200 );
  directionalLight (51, 102, 126, -1, 0, 0);
  rotateY(radians (mouseX*1.5));
  rotateX(radians (mouseY*1.5));
 // box ( height*.05 );
//
//  translate ( 0, height/3, 0 );
//  box (height*.05 );
//
//  translate ( 0, (- height/3)*.5, 0 );
//  box (height*.05 );
}


void fBack ()
{
 for ( float fB = - height*.3 ; fB < height*.3 ; fB=fB + boxSize ) 
  {
    pushMatrix ();
    translate ( -width*.1 , fB ,0 );
    box (boxSize); 
    popMatrix ();
  }
  
} 
  
 void fTop ()
{
 for ( float  fT = - width*.1 ; fT < width*.233 ; fT=fT + boxSize ) 
  {
    pushMatrix ();
    translate ( fT , -width*.3 ,- width*.1 );
    box (boxSize); 
    popMatrix ();
  }
  
} 

 void fTop2 ()
{
 for ( float  fT = - width*.1 ; fT < width*.233 ; fT=fT + boxSize ) 
  {
    pushMatrix ();
    translate ( fT , -width*.3 , width*.1 );
    box (boxSize); 
    popMatrix ();
  }
  
} 

//////////////////////////////////////////////////////////////////////////
void fMid ()
{

 for ( float  fM = - width*.15 ; fM < width*.1 ; fM=fM + boxSize ) 
  {
    pushMatrix ();
    translate ( fM -width*.05 , width*.01 ,  width*.1 );
    box (boxSize); 
    popMatrix ();
  }
  
  
} 
void fMid2 ()
{
 for ( float  fM = - width*.15 ; fM < width*.1 ; fM=fM + boxSize ) 
  {
    pushMatrix ();
    translate ( fM -width*.05 , width*.01 , -  width*.1 );
    box (boxSize); 
    popMatrix ();
  }
  
} 
