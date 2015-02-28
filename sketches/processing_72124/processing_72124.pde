
//Mira A, User Input, CP1, Mods 16/17

/**
Drag the mouse about the canvas to draw pictures. <br>
Click the coloured squares to change the colour used to draw. <br>
Press the 'r' key to reset the canvas.
*/

//determines the color of the stroke
color c = color(0, 0, 0);

//setup and color choice bar
void setup()
{
  size(500, 500);
  background(255);
  smooth();
  noStroke();
  //greyspace
  fill(69, 69, 69);
  rect(0, 470, 500, 10);
  //red
  fill(255, 0, 0);
  rect(0, 480, 20, 20);
  //pink
  fill(255, 0, 255);
  rect(20, 480, 20, 20);
  //purple
  fill(130, 0, 255);
  rect(40, 480, 20, 20);
  //blue
  fill(0, 0, 255);
  rect(60, 480, 20, 20);
  //bleu de france
  fill(0, 130, 255);
  rect(80, 480, 20, 20);
  //cyan
  fill(0, 255, 255);
  rect(100, 480, 20, 20);
  //seafoam green
  fill(0, 255, 130);
  rect(120, 480, 20, 20);
  //green
  fill(0, 255, 0);
  rect(140, 480, 20, 20);
  //green-yellow
  fill(130, 255, 0);
  rect(160, 480, 20, 20);
  //yellow
  fill(255, 255, 0);
  rect(180, 480, 20, 20);
  //orange
  fill(255, 130, 0);
  rect(200, 480, 20, 20);
  //black
  fill(0);
  rect(220, 480, 20, 20);
  //brown
  fill(113, 67, 37);
  rect(240, 480, 20, 20);
  //grey
  fill(96, 96, 96);
  rect(260, 480, 20, 20);
  //white
  fill(69, 69, 69);
  rect(300, 480, 200, 20);
}

void draw()
{
  //cross to hand
  mousechange();
  //choose color
  mouseClicked();
  //default black paint
  paint();
  //reset
  if (keyPressed == true && key == 'r')
  {
    setup();
  }
}

//cross to hand
void mousechange()
{
  if (mouseY > 480 && mouseX < 300)
  {
    cursor (HAND);
  }
  else
  {
    cursor (CROSS);
  }
}

//chooses color
void mouseClicked()
{
  //red
  if (get(mouseX, mouseY) == color(255, 0, 0) && mouseX < 20 && mouseY > 480 && mousePressed == true)
  {
    c = color(255, 0, 0);
  }
  //pink
  if (get(mouseX, mouseY) == color(255, 0, 255) && mouseX > 20 && mouseX < 40 && mouseY > 480 && mousePressed == true)
  {
    c = color(255, 0, 255);
  }
  //purple
  if (get(mouseX, mouseY) == color(130, 0, 255) && mouseX > 40 && mouseX < 60 && mouseY > 480 && mousePressed == true)
  {
    c = color(130, 0, 255);
  }
  //blue
  if (get(mouseX, mouseY) == color(0, 0, 255) && mouseX > 60 && mouseX < 80 && mouseY > 480 && mousePressed == true)
  {
    c = color(0, 0, 255);
  }
  //bleu de france
  if (get(mouseX, mouseY) == color(0, 130, 255) && mouseX > 80 && mouseX < 100 && mouseY > 480 && mousePressed == true)
  {
    c = color(0, 130, 255);
  }
  //cyan
  if (get(mouseX, mouseY) == color(0, 255, 255) && mouseX > 100 && mouseX < 120 && mouseY > 480 && mousePressed == true)
  {
    c = color(0, 255, 255);
  }
  //seafoam green
  if (get(mouseX, mouseY) == color(0, 255, 130) && mouseX > 120 && mouseX < 140 && mouseY > 480 && mousePressed == true)
  {
    c = color(0, 255, 130);
  }
  //green
  if (get(mouseX, mouseY) == color(0, 255, 0) && mouseX > 140 && mouseX < 160 && mouseY > 480 && mousePressed == true)
  {
    c = color(0, 255, 0);
  }
  //green-yellow
  if (get(mouseX, mouseY) == color(130, 255, 0) && mouseX > 160 && mouseX < 180 && mouseY > 480 && mousePressed == true)
  {
    c = color(130, 255, 0);
  }
  //yellow
  if (get(mouseX, mouseY) == color(255, 255, 0) && mouseX > 180 && mouseX < 200 && mouseY > 480 && mousePressed == true)
  {
    c = color(255, 255, 0);
  }
  //orange
  if (get(mouseX, mouseY) == color(255, 130, 0) && mouseX > 200 && mouseX < 220 && mouseY > 480 && mousePressed == true)
  {
    c = color(255, 130, 0);
  }
  //black
  if (get(mouseX, mouseY) == color(0, 0, 0) && mouseX > 220 && mouseX < 240 && mouseY > 480 && mousePressed == true)
  {
    c = color(0, 0, 0);
  }
  //brown
  if (get(mouseX, mouseY) == color(113, 67, 37) && mouseX > 240 && mouseX < 260 && mouseY > 480 && mousePressed == true)
  {
    c = color(113, 67, 37);
  }
  //grey
  if (get(mouseX, mouseY) == color(96, 96, 96) && mouseX > 260 && mouseX < 280 && mouseY > 480 && mousePressed == true)
  {
    c = color(96, 96, 96);
  }
  //white
  if (get(mouseX, mouseY) == color(255, 255, 255) && mouseX > 280 && mouseX < 300 && mouseY > 480 && mousePressed == true)
  {
    c = color(255, 255, 255);
  }
}

//default black paint
void paint()
{
  if (mousePressed == true && mouseButton == LEFT)
  {
    if (mouseY < 450)
    {
      stroke(c);
      strokeWeight(5);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
}
