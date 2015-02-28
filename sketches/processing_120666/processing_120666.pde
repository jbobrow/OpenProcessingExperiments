
//--------------------------------------|
Star[] stars = new Star[1]; //--Creates a new class called Star and an array called stars with 1 Star in the array.
//--------------------------------------|
//--Creating an array to control stars--|
//--------------------------------------|
void setup()        //--Setup is run once at the start of the sketch
{
  size (640, 640);  //--Setting the size of the sketch window
  smooth();         //--Adds anti-aliasing to geometry. (Makes stuff look smooth/nice)
  for (int i = 0; i < stars.length; i++)  //--The for loop checks to see if the local var i is less than the length of the array and if true adds 1 to i
    {
      stars[i] = new Star ((color(200)),random(width),0,100);  //--element i within stars is a new star with these properties
    }
}

void draw()  //--This part of the code is drawn every frame
{
//--------------------------------------|
  background (20);  //--Setting the background color of the sketch

  fill    (255,0,0,75);
  noStroke();
  rect    (227,320,50,400); //--Creates a rectangle (X,Y,W,H)

  fill    (255,0,0);        //--Sets the fill of the shape (R,G,B,A)
  noStroke();               //--Gets rid of the stoke around the shape
  ellipse (252,330,72,72);  //--Creates an ellipse (X,Y,W,H)
//--------------------------------------|
//--The Main Body of the Rocket---------|
//--------------------------------------|
  fill   (255);
  ellipse(252, 144, 72, 72);

  fill    (255);
  noStroke();
  rect    (216, 140, 72, 200);

  fill(150);
  rect(229, 140, 46, 20);
//--------------------------------------|
//--The Wings of the Rocket-------------|
//--------------------------------------|
  fill    (100);
  noStroke();
  rect    (196, 190, 20, 200);

  fill    (100);
  noStroke();
  rect    (288, 190, 20, 200);

  fill    (100);
  noStroke();
  rect    (242, 190, 20, 200);
//--------------------------------------|
//--The Stars---------------------------|
//--------------------------------------|
  for (int i = 0; i < stars.length; i++)  //--The for loop checks to see if the local var i is less than the length of the array and if true adds 1 to i
    {
      stars[i].display();  //--Whilst true run this (Will control the display of the stars created in the Star array.)
      stars[i].move();     //--Whilst true run this (Will control the movement of the stars created in the Star array.)
    }
//--------------------------------------|
}//--End of Draw------------------------|

class Star    //--Beginning to define the Star Classes properties
{
    color c;  //--Creating a color
    float x;  //--Creating a variable to control the x co-ordinate
    float y;  //--Creating a variable to control the y co-ordinate
    float ys; //--Creating a variable to control the y co-ordinate movement
    
    Star (color c_, float x_, float y_, float ys_)  //--Defining a new stars properties
    {
      c = c_;    //--Renaming the variables for use in the object
      x = x_;    //
      y = y_;    //
      ys = ys_;  //
    }

void display()  //--Controls the appearance of the shape
{
  ellipseMode(CENTER); //--Sets the ellipse mode to center.
  fill       (c);      //--Sets the fill to the value of the variable c
  noStroke   ();       //--Sets the object to have no stroke
  ellipse    (random(width),y,10,10);  //--Sets the shape of the ellipse created every time
}

void move()  //--Controls the movement of the shape
{
  y = y + ys;      //--The y co-ordinate is the sum of the y co-ordinate plus the y speed variable
  if (y > height)  //--if y is less than the height of the sketch
  {
    y = 0;         //--then y is equal to 0
  }
}
}
//--------------------------------------|


