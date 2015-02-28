
/* Tasks
 X-Multiple colors
 X-Multiple widths
 X-Clear Screen
 X-Eraser
 X-Multiple Tips
 -Velocity drawing (thicker/thinner based on mouse movement)
 -Pallattes
 -Backgrounds
 -Autodrawing
 -Curves
 -Shapes
 */


int oMX, oMY; //variables for old mouse position
color penColor;
color back; //background
int weight;
int selection;
boolean sel; //for background selection
PFont font;

void setup()
{
  size (500, 500);
  background(255);
  back = color(255, 255, 255);
  smooth();
  oMX = 0;
  oMY = 0;
  weight = 1;
  selection = 0;
  penColor = color(0, 0, 0);
  font = loadFont("font.vlw");
  sel = false;
  smooth();
}

void draw()
{  
  buttons();
  strokeWeight(weight);
  stroke(penColor);
  if (hover(50, 0, 450, 500))
  {
    if (mousePressed)
    {
      if (mouseX != oMX || mouseY != oMY)
      {
        switch(selection)
        {
          //Default Line
        case 0:
          line(mouseX, mouseY, oMX, oMY);
          break;

          //Rectangle  
        case 1:
          rect(mouseX, mouseY, weight, weight);
          break;

          //Circle  
        case 2:
          ellipse(mouseX, mouseY, weight, weight);
          break;

          //Triangle
        case 3:
          fill(penColor);
          triangle(mouseX-10, mouseY+10, mouseX+10, mouseY+10, mouseX, mouseY-10);
          break;
        }
      }
    }

    oMX = mouseX;
    oMY = mouseY;
  }

  //Weight Controls
  if (hover(5, 340, 30, 285) && mousePressed)
  {
    weight = 1;
  }

  if (hover(5, 350, 20, 5) && mousePressed && weight > 0)
  {
    weight = 5;
  }

  if (hover(5, 365, 20, 10) && mousePressed && weight > 0)
  {
    weight = 10;
  }

  //Color Controls
  //Reds
  if (hover(3, 35, 20, 20) && mousePressed)
  {
    penColor = color(255, 0, 0);
  }

  if (hover(25, 35, 20, 20) && mousePressed)
  {
    penColor = color(128, 0, 0);
  }

  //Greens
  if (hover(3, 60, 20, 20) && mousePressed)
  {
    penColor = color(0, 255, 0);
  }

  if (hover(25, 60, 20, 20) && mousePressed)
  {
    penColor = color(0, 128, 0);
  }

  //Blues
  if (hover(3, 85, 20, 20) && mousePressed)
  {
    penColor = color(0, 0, 255);
  }

  if (hover(25, 85, 20, 20) && mousePressed)
  {
    penColor = color(0, 0, 128);
  }

  //Yellows
  if (hover(3, 110, 20, 20) && mousePressed)
  {
    penColor = color(255, 255, 0);
  }

  if (hover(25, 110, 20, 20) && mousePressed)
  {
    penColor = color(128, 128, 0);
  }

  //Black
  if (hover(25, 135, 20, 20) && mousePressed)
  {
    penColor = color(0, 0, 0);
  }

  //White
  if (hover(3, 135, 20, 20) && mousePressed)
  {
    penColor = color(255, 255, 255);
  }

  //Random
  if (hover(3, 160, 42, 20) && mousePressed)
  {
    penColor = color(random(255), random(255), random(255));
  }

  //Clear Button
  if (hover(5, 470, 40, 20) && mousePressed)
  {
    reset();
  }

  //Eraser
  if (hover(5, 390, 40, 20) && mousePressed)
  {
    penColor = color(back);
  }

  //Tips
  //Default
  if (hover(15, 210, 10, 10) && mousePressed)
  {
    selection = 0;
  }

  //Rectangle
  if (hover(15, 295, 10, 10) && mousePressed)
  {
    selection = 1;
  }

  //Circle
  if (hover(15, 240, 10, 10) && mousePressed)
  {
    selection = 2;
  }

  //Triangle
  if (hover(15, 275, 10, 10) && mousePressed)
  {
    selection = 3;
  }

  //Autodraw button
  if (hover(5, 430, 20, 40) && mousePressed)
  {
    auto();
  }
}



void buttons()
{
  strokeWeight(1);
  stroke(0);
  fill(150);
  rect(0,0,50,500);
  fill(0);

  //text
  textSize(14);
  text("Tools", 2, 12);
  textSize(10);
  text("Colors", 2, 30);
  text("Weight", 2, 335);
  text("Clear", 2, 465);
  text("Eraser", 2, 385);
  text("Tips", 2, 200);
  text("AutoDraw", 2, 425);

  //Seperator lines
  line(50, 0, 50, 500);
  line(0, 15, 50, 15);

  //Color buttons
  //Reds
  fill(255, 0, 0);
  rect(3, 35, 20, 20);
  fill(128, 0, 0);
  rect(25, 35, 20, 20);

  //Greens
  fill(0, 255, 0);
  rect(3, 60, 20, 20);
  fill(0, 128, 0);
  rect(25, 60, 20, 20);

  //Blues
  fill(0, 0, 255);
  rect(3, 85, 20, 20);
  fill(0, 0, 128);
  rect(25, 85, 20, 20);

  //Yellows
  fill(255, 255, 0);
  rect(3, 110, 20, 20);
  fill(128, 128, 0);
  rect(25, 110, 20, 20);

  //Black and White
  fill(0);
  rect(25, 135, 20, 20);
  fill(255);
  rect(3, 135, 20, 20);

  //Random
  fill(255);
  rect(3, 160, 42, 20);
  fill(0);
  text("Random", 5, 178);

  //reset button
  fill(255);
  rect(5, 470, 40, 20);

  //Eraser
  fill(back);
  rect(5, 390, 40, 20);

  //weight buttons
  fill(255);
  strokeWeight(1);
  line(5, 340, 25, 340);
  strokeWeight(5);
  line(5, 350, 25, 350);
  strokeWeight(10);
  line(8, 365, 25, 365);

  //Tips
  rect(10, 210, 25, 10);
  ellipse(20, 240, 10, 10);
  triangle(15, 275, 20, 265, 25, 275);
  rect(15, 295, 10, 10);

  //Autodraw button
  strokeWeight(1);
  fill(43, 56, 3);
  rect(5, 430, 40, 20);
}

void reset()
{
  background(back);
}

void auto()
{
  float[] xyNumbers = new float[10]; //position variables for random shapes and things
  color[] colors = new color[10]; //colors of random objects
  int rSelection; //ints that will be randomly filled for colors, positions, etc
  int rS;

  for (int i = 0; i < 10; i++)
  {
    xyNumbers[i] = random(50, 450);
    colors[i] = color(random(255), random(255), random(255));
    rSelection = int(random(9));
    rS = int(random(9));

    switch(rSelection)
    {
    case 0:
      fill(colors[i]);
      rect(xyNumbers[i], xyNumbers[rS], xyNumbers[4], xyNumbers[9]);
      break;

    case 1:
      fill(colors[i]);
      ellipse(xyNumbers[i], xyNumbers[rS], xyNumbers[2], xyNumbers[0]);
      break;

    case 3:
      fill(colors[i]);
      ellipse(xyNumbers[i], xyNumbers[rS], xyNumbers[2], xyNumbers[int(random(9))]);
      break;

    case 4:
      fill(colors[i]);
      rect(xyNumbers[int(random(9))], xyNumbers[rS], xyNumbers[4], xyNumbers[9]);
      break;

    case 5:
      fill(colors[i]);
      ellipse(xyNumbers[i], xyNumbers[rS], xyNumbers[2], xyNumbers[0]);
      break;

    case 6:
      fill(colors[i]);
      rect(xyNumbers[i], xyNumbers[rS], xyNumbers[4], xyNumbers[9]);
      break;

    case 7:
      fill(colors[i]);
      rect(xyNumbers[i], xyNumbers[rS], xyNumbers[4], xyNumbers[9]);
      break;

    case 8:
      fill(colors[i]);
      ellipse(xyNumbers[rS], xyNumbers[int(random(9))], i, i);
      break;

    case 9:
      fill(colors[i]);
      rect(xyNumbers[i], xyNumbers[rS], xyNumbers[4], xyNumbers[9]);
      break;
    }
  }
}
boolean hover(int x, int y, int w, int h) //x,y position, width, height
{
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h)
  {
    return true;
  }
  else
  {
    return false;
  }
}


