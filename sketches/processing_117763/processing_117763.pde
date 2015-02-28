
float widthAmt;
float heightAmt;


// schiffman learning processing
// page 53- exercise 4.4 variation
// also uses translate, pushmatrix -
// makes drawing a whole lot easier. 
// It is almost impossible without it

void setup(){
  // has to scale depending on size of window-
  // fixed values do not work -
  
  //size(320,320);
  //size(200,200);
  // size(800,800);
  size(300,300);
  
  // scale depending on width/height
  // any equal values reproduce the design
  widthAmt =width/16;
  heightAmt = height/16;
  
  smooth();
  background(255);
  ellipseMode(CENTER);
  noFill();
  stroke(0); 
 
 drawStuff(); 
}


void draw(){
  
}

void drawStuff(){
  
  // function runs once in the setup
  stroke(0); 
  noFill();
  
  // draw some dots
  point( 4 * widthAmt, 4 * heightAmt);
  point( 5 * widthAmt, 5 * heightAmt);
  point( 6 * widthAmt, 6 * heightAmt);
  point( 7 * widthAmt, 7 * heightAmt);
  point( 8 * widthAmt, 8 * heightAmt);
  point( 12 * widthAmt, 4 * heightAmt);
  point( 11 * widthAmt, 5 * heightAmt);
  point( 10 * widthAmt, 6 * heightAmt);
  point( 9 * widthAmt, 7 * heightAmt);
  point(9 * widthAmt, 9 * heightAmt);
  point(10 * widthAmt, 10 * heightAmt);
  point(11 * widthAmt, 11 * heightAmt);
  point(12 * widthAmt, 12 * heightAmt);
  point( 8 * widthAmt, 8 * heightAmt);
  point( 7 * widthAmt, 9 * heightAmt);
  point(6 * widthAmt, 10 * heightAmt);
  point(5 * widthAmt, 11 * heightAmt);
  point(4 * widthAmt, 12 * heightAmt);
  
  stroke(180);
  rectMode(CORNERS);
  rect(4 * widthAmt, 4 * heightAmt ,12 * widthAmt, 12 * heightAmt);
  rect(   6 * widthAmt, 6 * heightAmt ,10 * widthAmt, 10 * heightAmt);
  rect(   7 * widthAmt, 7 * heightAmt ,9 * widthAmt, 9 * heightAmt);
  // save the starting matrix...
  stroke(0);
  pushMatrix();
  
  strokeWeight(7);
  // top left
  translate(4 * widthAmt, 4 * heightAmt);
  ellipse(0,0,4.5 * widthAmt, 4.5 * heightAmt);
  pushMatrix();
  
  // top right
  translate(8 * widthAmt,0);
  ellipse(0,0,4.5 * widthAmt, 4.5 * heightAmt);
  popMatrix();
  pushMatrix();
   
  translate(0, 8 *heightAmt);
  ellipse(0,0,4.5 * widthAmt, 4.5 * heightAmt);
  
  // go back over to right
  translate( 8 *heightAmt,0);
  ellipse(0,0,4.5 * widthAmt, 4.5 * heightAmt);
  popMatrix();
  strokeWeight(5);
  translate(2 * widthAmt, 2 * heightAmt);
  ellipse(0,0,3.5 * widthAmt, 3.5 * heightAmt);
  pushMatrix();
  translate(4 * widthAmt, 0);
  ellipse(0,0,3.5 * widthAmt, 3.5 * heightAmt);
  popMatrix();
  pushMatrix();
  translate(0,4 * heightAmt);
  ellipse(0,0,3.5 * widthAmt, 3.5 * heightAmt);
   translate(4 * widthAmt,0);
   ellipse(0,0,3.5 * widthAmt, 3.5 * heightAmt);
    popMatrix();
   strokeWeight(2);
   translate(2 * widthAmt,2*heightAmt);
   ellipse(0,0,3 * widthAmt, 3 * heightAmt);
    strokeWeight(1);
   ellipse(0,0,2 * widthAmt, 2 * heightAmt);
}
