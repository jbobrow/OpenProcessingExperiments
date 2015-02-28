
// creature's local origin
int localX = 650;
int localY = 350;

//bg float colors
float r = 255;
float g = 255;
float b = 255;

//bg circles float pink
float rr;
float gg;
float bb;
float a;

float diam;
float x2;
float y2;

// creature's right Paw local origin, and right Paw offsets
int rPawX  = 75;
int rPawY  = -130;
int rPawTX =  0;
int rPawTY =  0;

// creature colors
int r1 = 139; int g1 = 137; int b1 = 112;
int r2 = 255; int g2 = 250; int b2 = 205;
int r3 = 72; int g3 = 61; int b3 = 139;
int r4 = 132; int g4 = 112; int b4 = 255;
int r5 = 135; int g5 = 72; int b5 = 83;
int r6 = 255; int g6 = 192; int b6 = 203;
int r7 = mouseX; int g7 = 230; int b7 = mouseY;


// to make mouse moves relative
int relX = 0;
int relY = 0;

//
// mousePressed() is called once every time a mouse button is pressed
//     catch relative values to use dragging the Paws around
void mousePressed() {
  relX = mouseX;
  relY = mouseY;
}

//
// mouseReleased() is called once every time a mouse button is pressed
//     set new Paw local origin, and clPaw offsets
void mouseReleased() {
  rPawX  = rPawX + rPawTX;
  rPawY  = rPawY + rPawTY;
  rPawTX = 0;
  rPawTY = 0;
  
}


//
// setup() is called once at the beginning to initialize
//
void setup() {
  size( 1300, 700 );        // size of the window
  smooth();                // antialiasing 
}



//
// draw_creature() is called to draw one creature at position x,y
//
void draw_creature( int x, int y ) {

  rectMode( CORNERS );     
  ellipseMode( CENTER );   
  
   //feet
  strokeWeight (3);
  stroke (r1, g1, b1);
  fill (r2, g2, b2);
  rect (x-75,  y+250,  x-30,  y+235);
  rect (x+30,  y+250,  x+75,  y+235);
  //arms
   strokeWeight (8);
  stroke (r3, g3, b3);
  noFill();
 bezier ( x-45, y+85, x-60, y+105,
          x-75, y+130, x-(rPawX+rPawTX), y-(rPawY+rPawTY) );
  line ( x+30,  y+75,  x+75,  y+130);
  //ears
  strokeWeight (3);
  fill (r4, g4, b4);
  ellipse ( x-30, y-110, 30, 120);
  ellipse ( x+30,  y-110, 30, 120);
  //inside ears
  stroke (r6, g6, b6);
  fill (r6, g6, b6);
  ellipse ( x-30,  y-80, 10, 120);
  ellipse ( x+30,  y-80, 10, 120);
  //legs
  stroke (r3, g3, b3);
  fill (r4, g4, b4);
  ellipse ( x-45,  y+205, 60, 60);
  ellipse ( x+45,  y+205, 60, 60);
   //belly
  ellipse ( x,  y+160, 120, 120);
  //shoulders
  ellipse ( x-30,  y+70, 60, 60);
  ellipse ( x+30,  y+70, 60, 60);
  //paws and chest
  stroke (r1, g1, b1);
  fill (r2, g2, b2);
  ellipse ( x-(rPawX+rPawTX), y-(rPawY+rPawTY), 30, 30);
  ellipse ( x+75, y+130, 30, 30);
  ellipse ( x, y+115, 90, 150);
  //scarf
  stroke (r6, g6, b6);
  fill (r6, g6, b6);
  rect ( x-45,  y+55,  x+45,  y+25);
  rect ( x+15,  y+130,  x+40,  y+55);
  //scarfdesign
  rectMode( CENTER );
  stroke (r5, g5, b5);
  pushMatrix ();
  translate ( x+27, y+110);
  rotate (radians (45));
  rect (0,0, 17, 17);
  popMatrix();
   pushMatrix ();
  translate ( x+27, y+80);
  rotate (radians (45));
  rect (0,0, 17, 17);
  popMatrix();
  //head
  stroke (r3, g3, b3);
  fill (r4, g4, b4);
  ellipse ( x, y-26, 135, 135);
  //mouth
  stroke (r1, g1, b1);
  fill (r2, g2, b2);
  ellipse ( x,  y+1, 75, 75);
  //face
  stroke (r3, g3, b3);
  strokeWeight (3.5);
  line ( x-45,  y-20,  x-15,  y-50);
  line ( x+15,  y-50,  x+45,  y-20);
  line ( x-15,  y+25,  x+9,  y-10);
  line ( x-9,  y-10,  x+15,  y+25);
  line ( x-9,  y-10,  x+9,  y-10);
 
 }



//
// draw() is called once per frame to draw
//
void draw() {
   background( r, g, b );   
  
  //background color change
  if (mouseX > width/2) {
    r = r + 10;
  } else {
    r = r - 10;
  }
  
  if (mouseY > height/2) {
    b = b + 10;
  } else {
    b = b - 10 ;
  }
  
  if (keyPressed == true) {
    g = g + 10 ;
  } else {
    g = g - 10;
  }

r = constrain (r, 0, 255);
g = constrain (g, 0, 255);
b = constrain (b, 0, 255);

rr = random (255);
  gg = random (255);
  bb = random (255);
  a = random (255);
  diam = random (100);
  x2 = random(width);
  y2 = random(height);
  
// speckles
if (!mousePressed) {
  noStroke ();
  fill (rr, gg, bb, a);
  ellipse (x2, y2, diam, diam);
}


  // move the local origin
  if ( mousePressed  &&  ( mouseButton == LEFT ) ) {
    localX = pmouseX-5;
    localY = pmouseY-5;
  }

  // drag the right Paw around using the offsets??
  if ( mousePressed  &&  ( mouseButton == RIGHT ) ) {
    rPawTX = relX - mouseX;
    rPawTY = relY - mouseY;
  }


  
//--------------------------------

  for ( int j=-200; j<200; j+=100 ) {
    for ( int i=-325; i<=325; i+=325 ) {
      draw_creature( localX-i+j, localY+j );
    }
  }
  
//--------------------------------
}
