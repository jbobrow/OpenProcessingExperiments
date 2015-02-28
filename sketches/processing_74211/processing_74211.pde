
//Mira A | One Hundred Random Shapes | CP1 | Mods 16/17

/**
Press the left mouse button to cause additional sets of one 
hundred random shapes to be superimposed on the set, or sets, 
already drawn to screen. <br>
Press the right mouse button to reset the canvas and draw 
another one hundred shapes. 
*/

//Variable 'shapes' controls the number of shapes drawn to 
//screen. 
int shapes = 0;
//Variable 'circlesize' controls the circle size, with said size
//falling no lower than 5.
int circlesize = 5;

void setup()
{
  //Self-explanatory.
  size(550, 550);
  background(255);
  noStroke();
  //The following draws grey sidebars to the screen.
  fill(173);
  rect(0,0,20,550);
  rect(530,0,20,550);
  fill(191);
  rect(20,0,15,550);
  rect(515,0,15,550);
}

void draw()
{
  //'hundred' controls the drawing of one hundred random shapes
  //to the screen.
  hundred();
  //'input' controls the mouse input associated with this program.
  input();
}

//Draws one hundred random shapes.
void hundred()
{
  while (shapes <= 100)
  {
    //Designates random fill colours.
    fill(int(random(255)), int(random(255)), int(random(255)), 40);
    //Using the variable 'circlesize', this statement controls the
    //location and size of the circles drawn. 'circlesize' is used
    //instead of 'int(random(etc))' to allow the x and y axis 
    //lengths of each ellipse to equal one another, thus forming
    //a circle.   
    ellipse(int(random(550)), int(random(550)), circlesize, circlesize);
    //Controls the increase in the variable 'circlesize'.
    circlesize = circlesize + int(random(3));
    //Controls the number of shapes drawn. 
    shapes++;
  }
}

//Controls mouse input for this program.
void input()
{
  //Pressing the left mouse button will cause additional sets of
  //one hundred random shapes to be superimposed upon those 
  //already drawn to screen.
  if (mousePressed == true && mouseButton == LEFT)
  {
    shapes = 0;
    circlesize = 5;
  }
  //Pressing the right mouse button will reset the canvas and
  //draw another one hundred random shapes.
  if (mousePressed == true && mouseButton == RIGHT)
  {
    setup();
    shapes = 0;
    circlesize = 5;
  }
}
