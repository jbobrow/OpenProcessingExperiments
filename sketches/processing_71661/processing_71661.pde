
//// creature's local origin
//int localX = 400;
//int y = 400;
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
    line( localX-i, y-span, localX-i, y+span );
 
    if ( ( i % 100 ) == 0 ) {
      stroke( 0, 0, 255, 192 );
    } else {
      stroke( 0, 0, 255, 64 );
    }
    line( localX-span, y-i, localX+span, y-i );
  }
   
  // draw axes
  strokeWeight( 2.5 );
  stroke( 255, 0, 0 );
  line( 0, y, width, y ); 
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
    y = mouseY;
    println( "localX is " + localX + "    y is " + y );
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


// creature's right hand local origin, and right hand offsets
int rHandX  = 288;
int rHandY  = 135;
int rHandTX =  0;
int rHandTY =  0;

//x+288 , y+135

// to make mouse moves relative
int relX = 0;
int relY = 0;

// mousePressed() is called once every time a mouse button is pressed
//     catch relative values to use dragging the right hand around
void mousePressed() {
  relX = mouseX;
  relY = mouseY;
}

//
// mouseReleased() is called once every time a mouse button is pressed
//     set new right hand local origin, and clear offsets
void mouseReleased() {
  rHandX  = rHandX - rHandTX;
  rHandY  = rHandY - rHandTY;
  rHandTX = 0;
  rHandTY = 0;
}

//background colors

int br1 = 255;  int bg1 = 150;  int bb1 = 50;    


void setup() {
  size( 800, 800 );        // size of the window
  smooth();                // antialiasing
}
//**************************************************

void draw_creature( int x, int y ) {

  rectMode(CORNERS);
  ellipseMode(CENTER);
  
strokeWeight(2);
stroke(r1 , g1 , b1);
 
    line( x-150 , y+125 , x-225 , y+175 );       //LEFT ARM
    line( x-225 , y+175 , x-250 , y+125 );
 
    line( x+50  , y+100 , x+225 , y+175 );       //RIGHT ARM
    line( x+225 , y+175 , x+(rHandX-rHandTX) , y+(rHandY-rHandTY));
 
    line( x-75  , y+175 , x-150 , y+250 );
    line( x-150 , y+250 , x-150 , y+325 );       //LEGS  
   
    line( x+25  , y+175 , x+150 , y+250 );        
    line( x+150 , y+250 , x+150 , y+325 );
 
stroke(r1 , g1 , b1);
strokeWeight(2);
fill(r2 , g2 , b2);
rectMode(CENTER);

    rect( x+(rHandX-rHandTX) , y+(rHandY-rHandTY) , 75 , 25 );       //RIGHT HAND

rectMode(CORNERS);
    rect( x-325 , y+125 , x-250 , y+150 );  //LEFT HANDDDDDDDDDD
 
    rect( x+150 , y+325 , x+225 , y+350);        //FEET
    rect( x-225 , y+325 , x-150 , y+350);
 
fill(r3 , g3 , b3);
stroke(r1 , g1 , b1);
strokeWeight(2);
 
    ellipse( x , y-25 , 400 , 650);       //HEAD
 
fill(255);
stroke(r2 , g4 , b4);
strokeWeight(2);
 
    ellipse( x-75 , y-50 , 100 , 300);
    ellipse( x+75 , y-50 , 100 , 300);    //EYES BIG
 
fill(50);
strokeWeight(0);
 
    ellipse( x+75 , y-25 , 50 , 100);     //EYES SMALL
    ellipse( x-75 , y-25 , 50 , 100);
 
fill(r4 , g5 , b5);
 
    ellipse( x , y+100 , 100 , 50);       //NOSE
 
fill(r5 , g6 , b6);
 
    ellipse( x , y+200 , 50  , 100);      //MOUTH
}

//  // draw arms
//  strokeWeight( 7 );
//  noFill();
//  bezier( x-64,  y-74,  x-114,              y-74,  
//          x-114, y-74,  x-(rHandX+rHandTX), y-(rHandY+rHandTY) );   // right arm
//  bezier( x+64,  y-74,  x+114,              y-74,  
//          x+114, y-74,  x+84,               y-30 );                 // left arm
//  strokeWeight( 2 );
//  fill( r5, g5, b5 );
//  ellipse( x-(rHandX+rHandTX), y-(rHandY+rHandTY),  18, 14 );       // right hand
//  ellipse( x+84,               y-30,                18, 14 );       // left hand
// 

//************************************************** 


void draw() {

  
 
 if ( mousePressed  &&  ( mouseButton == LEFT ) ) {
    localX = mouseX;
    localY = mouseY;
  }
 
   if (keyPressed) {
     br1=br1-2;
   }
   if(mouseX < width/3)  {
   background(br1,bg1,bb1);
   } else if (mouseX < 2*width/3) {
    background(bg1,bb1,br1);
   } else {
    background (bb1,br1, bb1);
   } 
   
   
    // drag the right hand around using the offsets??
  if ( mousePressed  &&  ( mouseButton == RIGHT ) ) {
    rHandTX = relX - mouseX;
    rHandTY = relY - mouseY;
    
  }
 

   for ( int j=0; j<100; j+=50 ) {
    for ( int i=-200; i<=200; i+=200 ) {
      draw_creature( localX-i+j, localY+j );

    }
    
    
  
}
  
  
   
  
  
  
  
  
//**********************************************************************************
//**********************************************************************************
//**********************************************************************************
 
  
  
  // draw the grid
  // if ( gridOn ) {
  // draw_grid();
  }

