
import guicomponents.*;

GTextField ruleBox;
GButton pause, clear;
GHorzSlider speedSldr;

PFont font;
int[][] grid;
int[][] gridBuf;
int gw = 50;
int gh = 50;
int cd =10;
int t=0;
boolean isRunning = false;
boolean drawing = false;
boolean erasing = false;
String rules = "1256/1"; // "neighbors required for survival/required for birth" 
                           //e.g. "23/2" means 2 or 3 neighbors are required for a cell to survive,
                           //and an empty cell must have 3 neighbors to turn on
int speed = 1; //higher is slower, 1 is fastest
               //how many frames between step.
void setup()
{
  size(gw*cd,gh*cd+50);
  background(160);  
  GComponent.globalColor = GCScheme.getColor(this,  GCScheme.GREY_SCHEME); //textfield color
  GComponent.globalFont = GFont.getFont(this, "Georgia", 16); //textfield font
  ruleBox = new GTextField(this, rules, 20,gh*cd+20,100,0);
  pause = new GButton(this, "Pause/Play",width-100,gh*cd+20,80,20);
  clear = new GButton(this, "Clear",width-200,gh*cd+20,80,20);
  speedSldr = new GHorzSlider(this,140,gh*cd+20,100,20);
  speedSldr.setBorder(1);
  speedSldr.setLimits(1,1,60);
  font = loadFont("Verdana.vlw");
  textFont(font,12);
  grid = new int[gw][gh];
  gridBuf = new int[gw][gh];
  noStroke();
  //for(int a=0;a<5000;a++)
  //  gridBuf[int(random(1,gw-1))][int(random(1,gh-1))] = 1;
  render();
}

int toggle(int input,int v1,int v2) //if input is v1, return v2 and vice versa. e.g. toggle(1,0,1) returns 0
{
  if(input==v1)
    return v2;
  else if(input==v2)
    return v1;
  return input; //if input is neither v1 nor v2, just return the original input
}

void keyPressed()
{
  if(key == ' ')
    isRunning = !isRunning;
  if(keyCode == DELETE)
  {
    isRunning = false;
    for(int i=1;i<gw-1;i++)
    {
      for(int j=1;j<gh-1;j++)
      {
        gridBuf[i][j] = 0;
      }
    }
    render();
  }
}

void mousePressed()
{
  if(mouseButton==LEFT)
    drawing = true;
  if(mouseButton==RIGHT)
    erasing = true;
}

void mouseReleased()
{
  drawing = false;
  erasing = false;
}

void step()
{
  for(int i=1;i<gw-1;i++)
  {
    for(int j=1;j<gh-1;j++)
    {
      int cellSum = 0;
      for(int ci=-1;ci<2;ci++)
      {
        for(int cj=-1;cj<2;cj++)
        {
          cellSum+=grid[i+ci][j+cj];
        }
      }
      if(grid[i][j] == 1)
      {
        cellSum--;
        gridBuf[i][j] = 0;
        String survivalRules = rules.substring(0,rules.indexOf("/"));
        for(int sIndex=0;sIndex<survivalRules.length();sIndex++)
        {
          if(cellSum==Character.getNumericValue(survivalRules.charAt(sIndex)))
          {
            gridBuf[i][j] = 1;
          }
        }
      }
      String birthRules = rules.substring(rules.indexOf("/")+1,rules.length());
      for(int sIndex=0;sIndex<birthRules.length();sIndex++)
      {
        if(grid[i][j] == 0 && cellSum == 3)
        {
          gridBuf[i][j] = 1;
        }
      }
    }
  }  
}

void render()
{
  for(int i=1;i<gw-1;i++)
  {
    for(int j=1;j<gh-1;j++)
    {
      if(gridBuf[i][j] == 1)
        fill(0);
      if(gridBuf[i][j] == 0)
        fill(205);
      rect(i*cd,j*cd,cd,cd);
    }
  }
  for(int i=1;i<gw-1;i++)
  {
    for(int j=1;j<gh-1;j++)
    {
      grid[i][j] = gridBuf[i][j];
    }
  }
}

void handleTextFieldEvents(GTextField tfield)
{
  if(tfield==ruleBox)
  {
    switch (ruleBox.eventType)
    {
      case GTextField.ENTERED:
        isRunning = false;
        rules = ruleBox.getText();
    }
  }
}

void handleButtonEvents(GButton button)
{
  if(button == pause && button.eventType == GButton.CLICKED)
    isRunning = !isRunning;
  if(button == clear && button.eventType == GButton.CLICKED)
  {
    isRunning = false;
    for(int i=1;i<gw-1;i++)
    {
      for(int j=1;j<gh-1;j++)
      {
        gridBuf[i][j] = 0;
      }
    }
    render();
  }
}

public void handleSliderEvents(GSlider slider)
{
  if(speedSldr == slider){
    speed = speedSldr.getValue();
  }
}

void draw()
{
  t++;
  if(t%10==0)
  {
    fill(160);
    rect(150,gh*cd-2,300,20);
    fill(0);
    text(frameRate/speed+" steps per second",150,gh*cd+10);
  }
  if(t%speed==0 && isRunning)
  {
    step();
    render();
  }
  if(drawing)
  {
    gridBuf[constrain(mouseX/cd,0,gw-1)][constrain(mouseY/cd,0,gh-1)] = 1;//toggle(gridBuf[mouseX][mouseY],0,1);
    render();
  }
  if(erasing)
  {
    gridBuf[constrain(mouseX/cd,0,gw-1)][constrain(mouseY/cd,0,gh-1)] = 0;//toggle(gridBuf[mouseX][mouseY],0,1);
    render();
  }
  
  println(frameRate/speed);
}

