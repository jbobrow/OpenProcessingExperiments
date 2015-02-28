
//Alaa Abuamra Project 2D
//Set the variables using float 
float a=255;
float b=255;
float c=255;
float x=0;
//Setup the base
void setup()
{
//Specifies the number of frames to be displayed every second.
  frameRate(15);
//Set the size of the screen 
  size(600, 400);
//Set the colour of the background
  background(0);
  
//There will be no stroke
  noStroke();
//draws all geometry with smooth edges
  smooth();
}
 
//Create the  aniomation
void draw()
{
//variable x add up 10 everytime the motion is repeated
  x+=10;
//Sets the color used to fill shapes where in this case fill is (gray,alpha). 
//Gray is the number specifying value between white and black.
//alpha is the opacity of the fill
  fill(0, 25);
// draw a rectangle that has the same width and height of the screen
  rect(0, 0, width, height);
//set the colour of the rectangles shapes using the variables at the top.
  fill(a, b, c, 100);
//drawn  a rectangle from top left where x & Y are based on the previouse mouse
//where x is set up at zero and add up 10 every time but when x is more or
//  equal to 50 then x will go down by 10 everytime and that's what create the 
//nice effect in the rectangle.

//draw rectangle on one side.
  rect(pmouseX, pmouseY, x, x);

// since x is - 20 in this rect, it helps to create another rect on the opposite side.
  rect(pmouseX, pmouseY, x-40, x-40);
  rect(pmouseX, pmouseY, x-60, x-60);
  rect(pmouseX, pmouseY, x-80, x-80);
  rect(pmouseX, pmouseY, x-100, x-100);
//draw an ellipse with the same effect of the rectangle
  ellipse(pmouseX, pmouseY, x, x);
  ellipse(pmouseX, pmouseY, x-20, x-20);
  ellipse(pmouseX, pmouseY, x-40, x-40);
  ellipse(pmouseX, pmouseY, x-60, x-60);


//when x is more or equal to 50 then x will go down by 10 everytime
  if (x>=50)
  {
    x=-10;
  }
}
 
//random colour selector on mouse Moved
void mouseMoved()
{

  a=random(255);
  b=random(255);
  c=random(255);
}
//random colour selector on mouse Clicked
void mouseClicked()
{

  a=random(255);
  b=random(255);
  c=random(255);
}
//random colour selector on mouse Dragged
void mouseDragged()
{

  a=random(255);
  b=random(255);
  c=random(255);
}

