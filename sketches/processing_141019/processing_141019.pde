
//This sketch display the fractal known as the "Sierpinski carpet" with 6 iterations

float s=729;  //length of the first iteration square's side (it should be a power of 3 to get pixel accuracy)
int cpt=0;  //used to display in the console the number of calls to the recursive function that draws the fractal

void setup()
{
  size(729, 729);
  background(255);
  noStroke();
  noLoop();
  noSmooth();
  rectMode(CENTER);
}

void draw()
{
  translate(365, 365);  //move the origin of next drawing to the center of the window
  fill(0);
  square(s);  //call to the recursive function
  println(cpt);
  //save("Sierpinski_carpet.png");  //uncomment it if you want to save the picture to your computer
}

void square(float side)
{
  side=side/3;  //at each iteration the squares are 3 times smaller

  if (side>=1)  //the function is called until the squares size is equal to 1 pixel, because it would be pointless to draw things that are smaller to 1 pixel!
  {
    cpt++;  //increment the "call counter"

    pushMatrix();  //draws the top left square
    rect(0, 0, side, side);
    translate(-side, -side);
    square(side);
    popMatrix();

    pushMatrix();  //draws the top middle square
    rect(0, 0, side, side);
    translate(0, -side);
    square(side);
    popMatrix();

    pushMatrix();  //draws the top right square
    rect(0, 0, side, side);
    translate(side, -side);
    square(side);
    popMatrix();

    pushMatrix();  //draws the middle right square
    rect(0, 0, side, side);
    translate(side, 0);
    square(side);
    popMatrix();

    pushMatrix();  //draws the bottom right square
    rect(0, 0, side, side);
    translate(side, side);
    square(side);
    popMatrix();

    pushMatrix();  //draws the bottom middle square
    rect(0, 0, side, side);
    translate(0, side);
    square(side);
    popMatrix();

    pushMatrix();  //draws the bottom left square
    rect(0, 0, side, side);
    translate(-side, side);
    square(side);
    popMatrix();

    pushMatrix();  //draws the middle left square
    rect(0, 0, side, side);
    translate(-side, 0);
    square(side);
    popMatrix();
  }
}

