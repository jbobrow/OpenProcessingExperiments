

//  subsurf rects

//  by Rob Costin
//  October 3-6 2009

//  robcostin@earthlink.net



//     -----------------------------------------     DECLARE VARIABLES

// static values

int W = screen.width - 40   ;
int H = W * 9 / 16   ;
//  int W = screen.width   ;
//  int H = screen.height   ;
float frameR = 9   ;

int bgc = 255    ;
color bgfade = color ( 0 , 15 , 30 , 55  )    ;

int numrows = 5  ;

int []  intialX = {   -100 - W ,  -50 - W ,  0 -W ,  50 - W  ,  100  -  W  }   ;
int []  intialY  = {   -100  , -50  , -150  ,  -200 ,  -250 }   ;
int []  incX  = {   2  ,  3  ,  4 , 5 , 6 }   ;
int []  incY  = {   1  ,  2  ,  3 , 4 , 5 }   ;
int []  incRotation  = {   2  ,  2  , 2 , 3 , 4  }   ;
int []  horizreps  = { 7  , 8  , 9 , 10  , 11  }   ;

int []  R  = {   0  ,  128  , 120 ,  0 ,   170 }   ;
int []  G  = {   115  , 128 ,  0 ,  170  , 170  }   ;
int []  B  = {   128 ,  0 ,   140 , 170 ,  0 }   ;
int []  T  = {  60 ,  60 ,    60 ,  60 ,   60 }   ;


// initial values,  to be reset during draw

int []  rowStartsX  = {   - W  , -W  ,  -W  , -W  ,  -W}   ;
int []  rowStartsY  = {   0  ,  0  ,  0 ,  0  ,  0 }   ;
int []  rowRotates   = {   0  ,  0  ,  0  ,  0  ,  0 }   ;
float []  horizspace  = {   0  ,  0  ,  0  ,  0  ,  0 }   ;



//     -----------------------------------------     SETUP


void setup () {
  size ( W ,  H ) ;
  smooth() ;
  frameRate (frameR ) ;
}



//     -----------------------------------------     DRAW


void draw() {

  // background ( bgc )   ;
  fill ( bgfade )   ;
  noStroke ()   ;
  rect ( 0 , 0 , W , H )   ;


  for(int row = 0  ; row < numrows ;  row = row + 1 )  {

horizspace [row] = W / horizreps  [row]  ;

    //     ---------------------     build one row


    if ( rowStartsY [row] < H )  {                        // not yet reached bottom of screen, move row a little
      rowStartsX [row] = rowStartsX [row] + incX [row]  ;
      rowStartsY [row] = rowStartsY [row] + incY [row] ;
      rowRotates [row] = rowRotates [row] + incRotation [row]  ;
    }     
    else   {                                             // reached bottom of screen, move row back to intial position
      rowStartsX [row] = intialX [row]   ;
      rowStartsY [row] = intialY [row]   ;
      rowRotates [row] = 0  ;

    }

    for(int i = 0  ; i <   2* horizreps [row] ;  i = i + 1 )  {

      pushMatrix ()   ;
      translate ( rowStartsX [row] + horizspace [row] *i  , rowStartsY [row] )   ;
      rotate ( radians ( rowStartsX [row] ) )  ;
      fill ( R [row]  -  rowStartsY [row]/10,  G [row]  -  rowStartsY [row]/10, B [row] -  rowStartsY [row]/10 )   ;
      noStroke ()   ;
      rect ( 0 , 0 ,  140  , 55 )   ;
      popMatrix ()   ;

    }  // end for

  }  // end for



}  //  end draw




