
float radius = 0.5;
int X, Y;
int nX, nY;
//int delay = 20;

void setup() {
  size(600, 600);
  background(255);
  smooth();
  delay(250);
  frameRate( 10 ); 
  X = width / 2;
  Y = width / 2;
  nX = X;
  nY = Y;

  //xpos= 10; //vertical location of each bubble
  //ypos= 10; //horisintal location of each bubble
}

void draw() {
  background (0); //canvas background color
  noStroke(); //no strokes for the bubbles
  int space = 60; // distance between each bubble 
  int radiusB = 10; //radius of the bubbles
  smooth();

  //the loop for the bubbles on the canvas
  for (int xpos = 10; xpos <= 600; xpos += space) {
    for (int ypos = 10; ypos <= 600; ypos += space) {
      fill(0); //using no fill the the many bubbles in the loop
      ellipse(xpos, ypos, radiusB, radiusB);
      //Now the pulsing mouse - we are taing that out of the forloop. 
      //Experiment - for ( int radius = 30; radius <=60; radius +=sin( frameCount / 4)) { 

      //we neeed the distance between the balls and the middle of the cirkle - the mouseX and mouseY.     
      if ( dist(xpos, ypos, mouseX, mouseY) <= radius) { //putting this in an if statment
        fill(255, 255, 0);  //so when the distance between mouse and the cirkle are smaller than radius then put red fill in.
        ellipse(xpos, ypos, radiusB, radiusB);
      }//if(dist(xpos,ypos,mouseX,mouseY) >= radius);  {
      else {
        fill(0);  //when not - put black fill in, same as the background.
        ellipse(xpos, ypos, radiusB, radiusB);
      }
      //1st ball
      radius = radius + sin( frameCount/0.5); //Using sin and framecount to make the radius smaller and bigger - remember the curve.

      //X+=(nX-(X)); 
      //Y+=(nY-(Y));

      fill(0, 255, 255, 5);
      //stroke(0,255,0,5); 
      ellipse( mouseX, mouseY, radius, radius ); //drawing pulsing cirkle - with stroke and blue fill
     //2nd ball
      radius = radius + sin( frameCount/0.5); //Using sin and framecount to make the radius smaller and bigger - remember the curve.

      //X+=(nX-(X)); 
      //Y+=(nY-(Y));

      fill(255, 255, 0, 5);
      //stroke(0,255,0,5); 
      ellipse(300, 300, radius, radius ); //drawing pulsing cirkle - with stroke and blue fill
    // 3rd ball   
    radius = radius + sin( frameCount/0.5); //Using sin and framecount to make the radius smaller and bigger - remember the curve.

      //X+=(nX-(X)); 
      //Y+=(nY-(Y));

      fill(255, 0, 255, 5);
      //stroke(0,255,0,5); 
      ellipse(500, 500, radius, radius ); //drawing pulsing cirkle - with stroke and blue fill
    }
  }
  }


void mouseMoved() {
  nX = mouseX;
  nY = mouseY;
}


