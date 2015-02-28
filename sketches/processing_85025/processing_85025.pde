
//
// ITGM 315
// Fundamentals of Programming for Artists
// Professor Altman
//
// EXAMPLE - Programming assignment 1, part 3
//           dynamic drawing of creature
//           basic interaction, moving creature with mouse
//           extra interaction, changing eye color with mouseX
//


//
// setup() is called once at the beginning to initialize
//
void setup() {
  size( 800, 800 );        // size of the window
}


//
// draw() is called once per frame to draw
//
void draw() {
  background( 255 );       // white background
  smooth();                // turn on antialiasing
  
  rectMode( CENTER );      // center mode...
  ellipseMode( CENTER );   // ...for both

  // draw legs and hips
  strokeWeight( 1.5 );
  stroke( 69, 77, 52 );
  fill( 69, 77, 52 );
  rect( mouseX+390, mouseY+454, 10, 30 );
  rect( mouseX+410, mouseY+454, 10, 30 );
  ellipse( mouseX+400, mouseY+434, 50, 18 );
  
  // draw body
  fill( 92, 103, 69 );
  ellipse( mouseX+400, mouseY+424, 80, 30 );
  
  // draw shoulders
  fill( 115, 129, 86 );
  ellipse( mouseX+400, mouseY+404, 128, 50 );
  
  // draw head
  strokeWeight( 2 );
  stroke( 92, 103, 69 );
  fill( 184, 206, 137 );
  ellipse( mouseX+400, mouseY+324, 120, 190 );
  
  // draw eyes
  strokeWeight( 1 );
  stroke( 69, 77, 52 );
//  fill( 46, 52, 34 );
  fill( ((float)mouseX/width)*511, 52, 34 );
  ellipse( mouseX+373, mouseY+334, 50, 120 );
  ellipse( mouseX+427, mouseY+334, 50, 120 );
  
  // draw eyebrows and mouth
  strokeWeight( 6 );
  fill( 23, 26, 17 );
  line( mouseX+396, mouseY+287, mouseX+378, mouseY+249 );
  line( mouseX+404, mouseY+287, mouseX+424, mouseY+249 );
  strokeWeight( 4 );
  line( mouseX+394, mouseY+400, mouseX+406, mouseY+400 );
  
  // draw highlights on the eyes...
  strokeWeight( 1 );
  stroke( 250, 250, 250 );
  fill( 250, 250, 250, 240 );
  ellipse( mouseX+384, mouseY+294, 6, 10 );
  ellipse( mouseX+438, mouseY+294, 6, 10 );
}


