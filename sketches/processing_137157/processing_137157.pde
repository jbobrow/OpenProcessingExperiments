
//Project by: HERNAN  ROPERTO (2014)


/* this project was inspired by the work of SIMON PAGE:
 http://www.flickr.com/photos/simoncpage/12422681844/
 I started drawing circles as the original work and then adapted the technique to draw different shapes as rects and quads modifiye the sizes and the interaction between the shapes
 */


/*The grid was constructed adapting the code from Jan Vantome
 The original code used for the grid can be found here: http://vormplus.be/blog/article/processing-month-day-1-connecting-points-part-1
 */


/*---------------------------------------------------------------
 INSTRUCTIONS:
 
 IMPORTANT!!!
 First of all, once the sketch is run, you have to choose the shape to draw
 pressing one of the following keys:
 THE SKETCH WON'T START DRAWING UNTIL YOU CHOOSE A SHAPE FORM
 
 
 KEYS:
 
 'c' or 'C' to draw CIRCLES
 'r' or 'R' to draw RECTANGLES
 'q' or 'Q' to draw QUADS
 'w' or 'W' to draw ROTATING QUADS
 
 
 
 
 
 MOUSSE:
 
 Draw the shapes pressing the mouse LEFT button:
 
 LEFT BUTTON, single click:  draw shapes once
 LEFT BUTTON, keeping button pressed: looping drawing shapes
 
 RIGHT BUTTON:  save PNG
 
 Mouse POSTTION: move the mouse across the X axis to change the shape's size
 
 */


//------------------------------------------------------------------


//variables for THE grid
int numPoints = 6;

PVector[] points = new PVector[numPoints];

float radius = 150;


//--------------------------------------------------------------

//color pallete

color[] palette1= {  
  #F0CECE, #FF0000, #F28942, #934612, #F5A800, #FCE800, #AAA99C, #E0DCB3, #646460, #908E70
};



//------------------------------------------------------------



void setup() {
  size( 1000, 1000 );
  smooth();
  background(0);



  // =-----------------------------------------------------------
  //grid

  float angle = TWO_PI / numPoints;

  for (int i = 0; i < numPoints; i++) {
    float x = cos( angle * i ) * radius;
    float y = sin( angle * i ) * radius;
    points[i] = new PVector( x, y );
  }
}



//------------------------------------------------------------

void draw() {


  if (mousePressed && (mouseButton == LEFT)) {



    background(255);

    for (int i=-150;i<width+150;i=i+100) {
      for (int j=-150;j<height+150;j=j+100) {

        drawGrid(i, j);


        if (key=='c' || key=='C') drawCircle(i, j);
        if (key=='r' || key=='R') drawRect(i, j);
        if (key=='q' || key=='Q') drawQuad(i, j); 
        if (key=='w' || key=='W') drawQuadRot(i, j);
      }
    }
  }

  if (mousePressed && (mouseButton == RIGHT)) {
    saveFrame("img_##.png");
  }
}  







//---------------------------------------------------------------
//CIRCLES


void drawCircle(float posX, float posY) {



  fill (palette1[int (random(10))], 100);
  //float diam=(random(150,300));
  float diam=(random (mouseX));


  stroke(255, 50);
  ellipse(posX, posY, diam, diam);
}




//--------------------------------------------------------------
//RECTANGLES

void drawRect(float posX, float posY) {



  fill (palette1[int (random(10))], 100);
  //float diam=(random(150,300));
  float diam=(random (mouseX));


  stroke(255, 50);



  rect ( posX, posY, random(diam), diam );
}




//--------------------------------------------------------------
//QUAD


void drawQuad(float posX, float posY) {



  fill (palette1[int (random(10))], 100);

  stroke(255, 50);


  float step= map(mouseX, 0, width, 0, 400);

  quad (posX, posY, posX, posY+step, posX-step, posY+step, posX+step, posY+step);
}




//--------------------------------------------------------------
//ROTATING QUADS

void drawQuadRot(float posX, float posY) {



  fill (palette1[int (random(10))], 100);

  stroke(255, 50);

  rotate (int (random (4))* HALF_PI);
  float step= map(mouseX, 0, width, 100, 500);

  quad (posX, posY, posX, posY+step, posX-step, posY+step, posX+step, posY+step);
}




//--------------------------------------------------------------



//GRID

void drawGrid(int posGridX, int posGridY) {

  //fill(255);
  stroke(255, 50);

  pushMatrix();

  translate( posGridX, posGridY);

  for (int i = 0; i < numPoints; i++) {
    for (int j = 0; j < numPoints; j++) {
      if ( j != i ) {
        line( points[i].x, points[i].y, points[j].x, points[j].y );
      }
    }
  }

  popMatrix();
}


//--------------------------------------------------------------



