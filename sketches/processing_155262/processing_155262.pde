
//This sketch display a fractal: at each iteration, 6 half-sized circles are created along the border of the initial one.

float s=512;  //length of the first iteration circle's side
int cpt=0;  //used to display in the console the number of calls to the recursive function that draws the fractal

void setup()
{
  size(500, 500, P2D);
  background(255);
  noLoop();
  smooth(8);
}

void draw()
{
  translate(width/2, height/2);  //move the origin of next drawing to the center of the window
  fill(0, 0);
  stroke(0);
  fractal(s);  //call to the recursive function
  //println(cpt);
  //save("fractal.png");  //uncomment it if you want to save the picture to your computer
}

void fractal(float side)
{
  side=side/2;  //at each iteration the circles are 2 times smaller

  if (side>=16)  //the function is called until the circles size is equal to 16 pixels
  {
    cpt++;  //increment the "call counter"

    pushMatrix();  //draws the right circle
    ellipse(0, 0, side, side);
    rotate(radians(0 ) );
    translate(side/2, 0 );
    fractal(side);
    popMatrix();

    pushMatrix();  //draws the second circle (clockwise)
    ellipse(0, 0, side, side);
    rotate(radians(60 ) );
    translate(side/2, 0 );
    fractal(side);
    popMatrix();

    pushMatrix();  //draws the third circle (clockwise)
    ellipse(0, 0, side, side);
    rotate(radians(120 ) );
    translate(side/2, 0 );
    fractal(side);
    popMatrix();

    pushMatrix();  //draws the fourth circle (clockwise)
    ellipse(0, 0, side, side);
    rotate(radians(180 ) );
    translate(side/2, 0 );
    fractal(side);
    popMatrix();

    pushMatrix();  //draws the fifth circle (clockwise)
    ellipse(0, 0, side, side);
    rotate(radians(240 ) );
    translate(side/2, 0 );
    fractal(side);
    popMatrix();

    pushMatrix();  //draws the sixth circle (clockwise)
    ellipse(0, 0, side, side);
    rotate(radians(300 ) );
    translate(side/2, 0 );
    fractal(side);
    popMatrix();
  }
}

