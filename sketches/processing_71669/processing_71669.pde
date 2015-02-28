
// creature's local origin
int localX = 300;
int localY = 270;

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

// creature colors 
int r1 = 139; int g1 = 137; int b1 = 112;
int r2 = 255; int g2 = 250; int b2 = 205;
int r3 = 72; int g3 = 61; int b3 = 139;
int r4 = 132; int g4 = 112; int b4 = 255;
int r5 = 135; int g5 = 72; int b5 = 83;
int r6 = 255; int g6 = 192; int b6 = 203;
int r7 = mouseX; int g7 = 230; int b7 = mouseY;


//
// setup() is called once at the beginning to initialize
//
void setup()  {
  size( 600, 600 );        // size of the window
  smooth();                // antialiasing 
}



// draw() is called once per frame to draw
//
void draw() {
  background( r, g, b );   
  
  //background color change
  if (mouseX > width/2) {
    r = r + 1;
  } else {
    r = r - 1;
  }
  
  if (mouseY > height/2) {
    b = b + 1;
  } else {
    b = b - 1 ;
  }
  
  if (keyPressed == true) {
    g = g + 1 ;
  } else {
    g = g - 1;
  }

r = constrain (r, 0, 255);
g = constrain (g, 0, 255);
b = constrain (b, 0, 255);

// bg pink circles
rr = random (255);
  gg = random (255);
  bb = random (255);
  a = random (255);
  diam = random (100);
  x2 = random(width);
  y2 = random(height);
  
 
// use values
if (!mousePressed) {
  noStroke ();
  fill (rr, gg, bb, a);
  ellipse (x2, y2, diam, diam);
}


  // move the local origin??
  if ( mousePressed  &&  ( mouseButton == LEFT ) ) {
    localX = mouseX;
    localY = mouseY;
    println( "localX is " + localX + "    localY is " + localY );
  }

rectMode( CORNERS );
  ellipseMode( CENTER );
   
  //feet
  strokeWeight (3);
  stroke (r1, g1, b1);
  fill (r2, g2, b2);
  rect (localX-75,  localY+250,  localX-30,  localY+235);
  rect (localX+30,  localY+250,  localX+75,  localY+235);
  //arms
   strokeWeight (8);
  stroke (r3, g3, b3);
  fill (r4, g4, b4);
  line ( localX-75,  localY+130,  localX-45,  localY+85);
  line ( localX+30,  localY+75,  localX+75,  localY+130);
  //ears
  strokeWeight (3);
  ellipse ( localX-30,  localY-110, 30, 120);
  ellipse ( localX+30,  localY-110, 30, 120);
  //inside ears
  stroke (r6, g6, b6);
  fill (r6, g6, b6);
  ellipse ( localX-30,  localY-80, 10, 120);
  ellipse ( localX+30,  localY-80, 10, 120);
  //legs
  stroke (r3, g3, b3);
  fill (r4, g4, b4);
  ellipse ( localX-45,  localY+205, 60, 60);
  ellipse ( localX+45,  localY+205, 60, 60);
   //belly
  ellipse ( localX,  localY+160, 120, 120);
  //shoulders
  ellipse ( localX-30,  localY+70, 60, 60);
  ellipse ( localX+30,  localY+70, 60, 60);
  //paws and chest
  stroke (r1, g1, b1);
  fill (r2, g2, b2);
  ellipse ( localX-75, localY+130, 30, 30);
  ellipse ( localX+75, localY+130, 30, 30);
  ellipse ( localX, localY+115, 90, 150);
  //scarf
  stroke (r6, g6, b6);
  fill (r6, g6, b6);
  rect ( localX-45,  localY+55,  localX+45,  localY+25);
  rect ( localX+15,  localY+130,  localX+40,  localY+55);
  //scarfdesign
  rectMode( CENTER );
  stroke (r5, g5, b5);
  pushMatrix ();
  translate ( localX+27, localY+110);
  rotate (radians (45));
  rect (0,0, 17, 17);
  popMatrix();
   pushMatrix ();
  translate ( localX+27, localY+80);
  rotate (radians (45));
  rect (0,0, 17, 17);
  popMatrix();
  //head
  stroke (r3, g3, b3);
  fill (r4, g4, b4);
  ellipse ( localX, localY-26, 135, 135);
  //mouth
  stroke (r1, g1, b1);
  fill (r2, g2, b2);
  ellipse ( localX,  localY+1, 75, 75);
  //face
  stroke (r3, g3, b3);
  strokeWeight (3.5);
  line ( localX-45,  localY-20,  localX-15,  localY-50);
  line ( localX+15,  localY-50,  localX+45,  localY-20);
  line ( localX-15,  localY+25,  localX+9,  localY-10);
  line ( localX-9,  localY-10,  localX+15,  localY+25);
  line ( localX-9,  localY-10,  localX+9,  localY-10);
 }
