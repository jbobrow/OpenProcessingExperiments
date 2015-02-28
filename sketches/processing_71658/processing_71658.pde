
//// creature's local origin
//int localX = 400;
//int localY = 400;
//
//int r1 =  224;    int g1 =  200;    int b1 =  154;
//int r2 =  237;    int g2 =  223;    int b2 =  177;
//int r3 =  255;    int g3 =  234;    int b3 =  215;
//int r4 =  232;    int g4 =  219;    int b4 =  184;
//int r5 =  137;    int g5 =  211;    int b5 =  173;
//                  int g6 =   99;    int b6 =   99;

 
/* 
// switch to turn grid on/off
boolean gridOn = false;   // start "off"
 
//
// keyTyped() is called once every time a key is pressed
//     ignoring CTRL, SHIFT, ALT
void keyTyped() {
  if ( key == 'g'  || key == 'G' ) {
    gridOn = !gridOn;
  }
}
 
//
// draw_grid() is used to overlay a grid
//
void draw_grid() {
 
  // grid parameters
  int span      = 500;    // how far each way from the local origin
  int increment = 25;     // how close the lines are
                          // note: should be a factor of 100
  // draw grid
  strokeWeight( 1 );
  for ( int i=-span; i<=span; i+=increment ) {
    if ( ( i % 100 ) == 0 ) {
      stroke( 255, 0, 0, 192 );
    } else {
      stroke( 255, 0, 0, 64 );
    }
    line( localX-i, localY-span, localX-i, localY+span );
 
    if ( ( i % 100 ) == 0 ) {
      stroke( 0, 0, 255, 192 );
    } else {
      stroke( 0, 0, 255, 64 );
    }
    line( localX-span, localY-i, localX+span, localY-i );
  }
   
  // draw axes
  strokeWeight( 2.5 );
  stroke( 255, 0, 0 );
  line( 0, localY, width, localY ); 
  stroke( 0, 0, 255 );
  line( localX, 0, localX, height );
}
 
*/ 

//
// setup() is called once at the beginning to initialize
//

 
 
//
// draw() is called once per frame to draw
//

/* 
/*  // move the local origin??
  if ( gridOn  &&  mousePressed  &&  ( mouseButton == LEFT ) ) {
    localX = mouseX;
    localY = mouseY;
    println( "localX is " + localX + "    localY is " + localY );
*/  
 
 
 
 
//**********************************************************************************
//**********************************************************************************
//**********************************************************************************

int localX = 400;
int localY = 400;

int r1 =  224;    int g1 =  200;    int b1 =  154;
int r2 =  237;    int g2 =  223;    int b2 =  177;
int r3 =  255;    int g3 =  234;    int b3 =  215;
int r4 =  232;    int g4 =  219;    int b4 =  184;
int r5 =  137;    int g5 =  211;    int b5 =  173;
                  int g6 =   99;    int b6 =   99;

//background colors

int br1 = 255;  int bg1 = 150;  int bb1 = 50;    


void setup() {
  size( 800, 800 );        // size of the window
  smooth();                // antialiasing
}
 
void draw() {
  
 
 if ( mousePressed  &&  ( mouseButton == LEFT ) ) {
    localX = mouseX;
    localY = mouseY;
  }
 
 if(mouseX < width/3)  {
  background(br1,bg1,bb1);
 } else if (mouseX < 2*width/3) {
  background(bg1,bb1,br1);
 } else {
  background (bb1,br1, bb1);
 } 
 
 if (keyPressed) {
   br1=br1-2;
 }

   
rectMode(CORNERS);
ellipseMode(CENTER);

 
strokeWeight(2);
stroke(r1 , g1 , b1);
 
    line( localX-150 , localY+125 , localX-225 , localY+175 );       //LEFT ARM
    line( localX-225 , localY+175 , localX-250 , localY+125 );
 
    line( localX+50  , localY+100 , localX+225 , localY+175 );       //RIGHT ARM
    line( localX+225 , localY+175 , localX+250 , localY+125 );
 
    line( localX-75  , localY+175 , localX-150 , localY+250 );
    line( localX-150 , localY+250 , localX-150 , localY+325 );       //LEGS  
   
    line( localX+25  , localY+175 , localX+150 , localY+250 );        
    line( localX+150 , localY+250 , localX+150 , localY+325 );
 
stroke(r1 , g1 , b1);
strokeWeight(0);
fill(r2 , g2 , b2);
 
    rect( localX+250 , localY+125 , localX+325 , localY+150 );       //HANDS
    rect( localX-325 , localY+125 , localX-250 , localY+150 );
 
    rect( localX+150 , localY+325 , localX+225 , localY+350);        //FEET
    rect( localX-225 , localY+325 , localX-150 , localY+350);
 
fill(r3 , g3 , b3);
 
    ellipse( localX , localY-25 , 400 , 650);       //HEAD
 
fill(255);
stroke(r2 , g4 , b4);
strokeWeight(2);
 
    ellipse( localX-75 , localY-50 , 100 , 300);
    ellipse( localX+75 , localY-50 , 100 , 300);    //EYES BIG
 
fill(50);
strokeWeight(0);
 
    ellipse( localX+75 , localY-25 , 50 , 100);     //EYES SMALL
    ellipse( localX-75 , localY-25 , 50 , 100);
 
fill(r4 , g5 , b5);
 
    ellipse( localX , localY+100 , 100 , 50);       //NOSE
 
fill(r5 , g6 , b6);
 
    ellipse( localX , localY+200 , 50  , 100);      //MOUTH
 
  
  
  
  
  
  
  
//**********************************************************************************
//**********************************************************************************
//**********************************************************************************
 
  
  
  // draw the grid
  // if ( gridOn ) {
  // draw_grid();
  // }
 }
