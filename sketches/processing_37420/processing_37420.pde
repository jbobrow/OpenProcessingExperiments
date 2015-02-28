
boolean eraserMode = false;
boolean mouseIsDown = false;
int eraserSize = 50;
int colorMode = 1;
 
ArrayList bugs;
  
void setup() {
  size(500, 500);
  background(255, 255, 255);
  bugs = new ArrayList();
}
  
void draw()
{
  if(eraserMode)
  {
    noStroke();
    fill(255, 255, 255);
    if(mouseIsDown) ellipse(mouseX, mouseY, eraserSize, eraserSize);  
  }
     
  for(int i = 0; i < bugs.size(); i++)
  {   
    randBug bug = (randBug) bugs.get(i);
    bug.update();
    bugs.set(i, bug);
  }
}
  
  
//this function is called every time you press a mouse button
void mouseClicked()
{
  if(eraserMode == false)
  {
    float r = 255;
    float g = 255;
    float b = 255;
     
    if(colorMode == 1)
    {
      r = random(0, 255);
      g = random(0, 255);
      b = random(0, 255);
    }
    else if(colorMode == 2)
    {
      r = random(0, 50);
      g = random(50, 255);
      b = random(50, 255);
    } 
    else if(colorMode == 3)
    {
      r = random(50, 255);
      g = random(50, 255);
      b = random(0, 50);
    }
    else if(colorMode == 4)
    {
      r = random(50, 255);
      g = random(0, 50);
      b = random(50, 255);
    }
    else if(colorMode == 5)
    {
      r = random(75, 255);
      g = r;
      b = r;
    }
     
    bugs.add(new randBug(mouseX, mouseY, r, g, b, random(.01,.02),random(.01,.02),random(.01,.02),random(.01,.02)));
  }
}
 
void keyPressed()
{
  if(eraserMode == false)
  {
    if(key == '1')
    {
      System.out.println("Color Mode: Rainbow");
      colorMode = 1; //rainbow colors
    }
    else if(key == '2')
    {
      System.out.println("Color Mode: Blues/Greens");
      colorMode = 2; //blue/green
    }
    else if(key == '3')
    {
      System.out.println("Color Mode: Reds/Greens");
      colorMode = 3; //red/green
    }
    else if(key == '4')
    {
      System.out.println("Color Mode: Reds/Blues");
      colorMode = 4; //reds/blues
    }
    else if(key == '5')
    {
      System.out.println("Color Mode: Greyscale");
      colorMode = 5; //greyscale
    }
    else if(key == 'e')
    {
      eraserMode = !eraserMode;
      System.out.println("Eraser mode engaged. Erase away!");
    }
  }
  else
  {
    if(key == '1')
    {
      eraserSize = 50;
      System.out.println("Eraser size: 50");
    }
    else if(key == '2')
    {
      eraserSize = 60;
      System.out.println("Eraser size: 60");
    }
    else if(key == '3')
    {
      eraserSize = 70;
      System.out.println("Eraser size: 70");
    }
    else if(key == '4')
    {
      eraserSize = 80;
      System.out.println("Eraser size: 80");
    }
    else if(key == '5')
    {
      eraserSize = 90;
      System.out.println("Eraser size: 90");
    }
    else if(key == '6')
    {
      eraserSize = 100;
      System.out.println("Eraser size: 100");
    }
    else if(key == 'e')
    {
      eraserMode = !eraserMode;
      System.out.println("Eraser mode terminated. Back to painting!");
    }
  }
}
 
void mousePressed()
{
  mouseIsDown = true;
}
 
void mouseReleased()
{
  mouseIsDown = false;
}
  


