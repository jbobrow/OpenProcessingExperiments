
//makes the size of the background and color
void setup()
{
  size(500,500);
  background (0);
}

//main method. Draws everything you see
void draw()
{
for (int i = 0; i <= 0; i += 1)
{
  //if the mouse is pressed it jumps to mousePressed function
  mousePressed ();
  // next 6 lines draw circles of random color
  point (random(500),random(500));
  strokeWeight (random(100 , 300));
  stroke (randomColor());
  point (random(500),random(500));
  strokeWeight (random(100 , 300));
  stroke (randomColor()); 
  // if b is pressed run the following code
  if (keyPressed == true && key == 'b' || key == 'B')
  {
  i = 0;
  while (i <=100)
  {
    stroke (randomColor());
    fill (randomColor());
    rect (random (500),random (500), random (50,100), random (50-100));
    i ++;
  }
  }
  /* if enter is pressed prints "let go of enter" in the middle
   and "ya fool" in random spots across the background*/ 
  if (keyPressed && key == ENTER)
  {
    setup();
    textSize (50);
    fill (randomColor());
    text ("let go of enter",80,250);
    textSize (20);
    text ("ya fool",random(400),random(500));
  }
  //change the framerate if "q" or "w" is pressed
  if (keyPressed)
  {
    if (key == 'q' || key == 'Q')
    {
      frameRate (10);
  }
    if (key == 'w' || key == 'W')
    {
      frameRate (60);
  }
}
}
}
// gets a random color
color randomColor()
{
  return color(random(255),random(255),random(255));
}
// mouse pressed method mentioned earlier
void mousePressed()
{
  if (mousePressed && mouseButton == LEFT){
    setup();
  }
}
