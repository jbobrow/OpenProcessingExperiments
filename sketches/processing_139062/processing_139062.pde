
//Simple Paint Program

PImage cwheel;
color c = 255;
boolean paintState = false;
int brushThickness = 0;
int brushX1, brushX2;
int brushY1, brushY2;
void setup()
{
  size(700, 500);
  smooth();
  
  frame.setTitle("Trism Paint");
  background(255);
  
  cwheel = loadImage("Color_Wheel.png");
  
  fill(0);
  textAlign(CENTER);
  text("WELCOME TO SUPER SIMPLE PAINT! Simply click anywhere \non the color wheel to select a color! \nTo start/stop painting, press 'P'."+
  "\nTo clear the canvas, press 'ENTER' or 'RETURN'. \nENJOY!", width/2, height/2);
  
  stroke(255);
  fill(255);
  
  
}

void draw()
{
  strokeWeight(brushThickness);
  line(brushX1, brushY1, brushX2, brushY2);
  
  imageMode(CORNERS);
  image(cwheel, 0, 0, 200, 200);
  
  ellipseMode(CENTER);
  strokeWeight(0);
  ellipse(640, 100, 100, 100);
  
  if(paintState == true)
  {
      brushX1 = mouseX;
      brushX2 = pmouseX;
      brushY1 = mouseY;
      brushY2 = pmouseY;
  } else
  {
      brushX1 = 0;
      brushX2 = 0;
      brushY1 = 0;
      brushY2 = 0;
  }
}

void mousePressed()
{
  c = get(mouseX, mouseY);
  fill(get(mouseX, mouseY));
}

void keyPressed()
{
  
  //Paint Mode
  if(key == 'P' || key == 'p')
  {
    if(paintState == false)
    {
      paintState = true;
      stroke(c);
    } else if(paintState == true)
    {
      paintState = false;
      stroke(255);
    }
  }
  
  //Brush Thickness
  if(key == 'I' || key == 'i')
  {
    brushThickness += 1;
  }
  if(key == 'O' || key == 'o')
  {
    brushThickness -=1;
  }
  
  if(key == ENTER || key == RETURN)
  {
    background(255);
  }
}


