
PFont font; 
brush br;
colourPicker cPick;
brushPreview bPrev;

void setup()
{
  size(600, 500);
  background(255);
  font = loadFont("Corbel-12.vlw");
  
  //Create the brush
  br = new brush();
  noSmooth();
  
  //Create and postion GUI elements
  cPick = new colourPicker(0, 0, 500);
  bPrev = new brushPreview(500, 350, 100, 150);
}

void draw()
{
  if (mousePressed == true)
  { 
    //only draw a mark if the brush is within the drawing area
    if (!cPick.isInside(mouseX, mouseY) && 
        !bPrev.isInside(mouseX, mouseY) &&
        mouseX + (br.bsz / 2) <= width && 
        mouseX - (br.bsz / 2) >= 0 &&
        mouseY + (br.bsz / 2) <= height &&
        mouseY - (br.bsz / 2) >= 0)
    {
      br.draw(mouseX, mouseY);
    }
    else
    {
      //If the click is within the colour picker then check for colour update
      if (cPick.isInside(mouseX, mouseY))
      {
        br.setColour(cPick.getColor());
        bPrev.update();
      }
    }
  }
}

void keyPressed() {
  //Curesor up increases brush size
  if (keyCode == 38) 
  {  
    br.grow();
    bPrev.update();
  }
  
  //Cursor down decreases brush size
  if (keyCode == 40)
  {
    br.shrink();
    bPrev.update();
  }
  
  //f to choose funBrush
  if (keyCode == 70 || keyCode == 102) 
  {  
    br = new funBrush(br.getBrushSize(), cPick.getColor());
    bPrev.update();
  }
  
  //g to choose funBrush
  if (keyCode == 71 || keyCode == 103) 
  {  
    br = new funBrushTwo(br.getBrushSize(), cPick.getColor());
    bPrev.update();
  }
}


