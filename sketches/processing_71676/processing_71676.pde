
// creature's local origin
int localX = 200;
int localY = 305;


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


//
// setup() is called once at the beginning to initialize
//
void setup() {
  size( 512, 512 );        // size of the window
  smooth();                // antialiasing 
}


//
// draw() is called once per frame to draw
//
void draw() {
  background( 255 );       // white background

  // move the local origin??
  if ( gridOn  &&  mousePressed  &&  ( mouseButton == LEFT ) ) {
    localX = mouseX;
    localY = mouseY;
    println( "localX is " + localX + "    localY is " + localY );
  }

//--------------------------------
rectMode(CORNERS);
ellipseMode(CORNERS);
background(128);
      //Face Shape
fill(255,128,128);
ellipse(localX-70,  localY-125,  localX+70,  localY+115  );
stroke(128);
fill(128);
rect(localX-70,     localY+55,     localX+70,     localY+75);
ellipse(localX-100,     localY+25,     localX-45,     localY+135);
ellipse(localX+40,     localY+25,     localX+95,     localY+135);
        //eyes 
fill(0);
noStroke();
ellipse(localX-60,     localY-5,     localX-30,     localY+15);
ellipse(localX+30,     localY-5,     localX+60,     localY+15);
ellipse(localX-30,     localY-55,     localX+30,     localY-35);
      //Pupils
fill(255);
ellipse(localX-50,     localY-5,     localX-40,     localY+5);
ellipse(localX+40,     localY-5,     localX+50,     localY+5);
ellipse(localX-10,     localY-55,     localX+10,     localY-35);
      //Nostrils
fill(0);
ellipse(localX-15,     localY+25,     localX-5,     localY+45);
ellipse(localX+5,     localY+25,     localX+15,     localY+45);
      //line
stroke(0);
line(localX+60,     localY-85,     localX+60,     localY-155);
line(localX+60,     localY-155,    localX+100,    localY-155);
line(localX+100,    localY-155,    localX+100,    localY-95);
line(localX-60,     localY-85,     localX-60,     localY-155);
line(localX-60,     localY-155,    localX-100,    localY-155);
line(localX-100,    localY-155,    localX-100,    localY-95);
//face Lines
line(localX-20,     localY+55,     localX-30,     localY+25);
line(localX-30,     localY+25,     localX-60,     localY+20);
line(localX+20,     localY+55,     localX+30,     localY+25);
line(localX+30,     localY+25,     localX+60,     localY+20);
//--------------------------------

  // draw the grid
  if ( gridOn ) {
    draw_grid();
  }
}
