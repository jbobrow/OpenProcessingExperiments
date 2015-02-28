
PFont font;

int locked = 1;
boolean show = true;
int margin = 5;
int prevx, prevy;

float mainCircleRadiusMultiplier = 1.1;
int mainCircleGap = 8;
float mouseCircleRadiusMultiplier = 1.0;
int mouseCircleGap = 8;

void setup()
{
  size(900,700,JAVA2D);
  noLoop();
  smooth();
  stroke(0);
  
  font = loadFont("Calibri-16.vlw");
  textFont(font, 16);
  textAlign(LEFT);
  
  prevx = ((width/2)-(width*1/5)+int(random(0,width*2.0/5)));
  prevy = ((height/2)-(height*1/5)+int(random(0,height*2.0/5)));
}

void draw()
{
  //println(sizer + " " + (pow(height,2)+pow(width,2)));
  background(255);
  noFill();
  if(locked == 0)
  {
    println(locked);
    prevx = mouseX;
    prevy = mouseY;
    locked = 1;
  }
  DrawCircle(width/2, height/2, mainCircleRadiusMultiplier*sqrt(pow(height,2)+pow(width,2)), mainCircleGap);
  DrawCircle(prevx, prevy, mouseCircleRadiusMultiplier*sqrt(pow(height,2)+pow(width,2)), mouseCircleGap);
  
  
  if(show)
  {
    fill(0,160,0);
    textAlign(LEFT);
    text("mainCircleRadiusMultiplier: " + rounder(mainCircleRadiusMultiplier,4), margin, margin*3);
    text("mouseCircleRadiusMultiplier: " + rounder(mouseCircleRadiusMultiplier,4), margin, margin*7);
    text("Increase/Decrease mainCircleRadiusMultiplier: q/a", margin, height-margin*7);
    text("Increase/Decrease mouseCircleRadiusMultiplier: r/f", margin, height-margin*3);
    textAlign(RIGHT);
    text("mainCircleGap: " + mainCircleGap, width-margin, margin*3);
    text("mouseCircleGap: " + mouseCircleGap, width-margin, margin*7);
    text("Increase/Decrease mainCircleGap: w/s", width-margin, height-margin*7);
    text("Increase/Decrease mouseCircleGap: t/g", width-margin, height-margin*3);  
    textAlign(CENTER);
    text("Round Values: z", width/2, height-margin*3);
    text("Show/Hide Text: h", width/2, margin*3);
  }
}

void DrawCircle(int xpos, int ypos, float radius, int gap)
{ 
  for(int i = 0; i < (radius / (2*gap)); i++)
  {
    ellipse(xpos, ypos, gap*(i+1), gap*(i+1));
  }
}

float rounder(float num, int factor)
{
  float p = (float)Math.pow(10,factor);
  num = num * p;
  float tmp = Math.round(num);
  return (float)tmp/p;
}

void mousePressed()
{
  locked = 0;
  redraw();
  println(locked);
}

void keyPressed()
{
  if(key != CODED)
  {
    switch(key)
    {
      case 'q': mainCircleRadiusMultiplier += 0.1; break;
      case 'a': mainCircleRadiusMultiplier -= 0.1; break;
      case 'w': mainCircleGap++; break;
      case 's': mainCircleGap--; break;
      case 'r': mouseCircleRadiusMultiplier += 0.1; break;
      case 'f': mouseCircleRadiusMultiplier -= 0.1; break;
      case 't': mouseCircleGap++; break;
      case 'g': mouseCircleGap--; break;
      case 'z': round(prevx); round(prevy); break;
      case 'h': if(show){ show = false; } else { show = true; } break;
    }
  }
  else
  {
    switch(keyCode)
    {
      case RIGHT: prevx++; break;
      case LEFT:  prevx--; break;
      case UP:    prevy--; break;
      case DOWN:  prevy++; break;
    }
  }
  
  if(mainCircleRadiusMultiplier < 0){ mainCircleRadiusMultiplier = 0; } else
  if(mainCircleGap < 1){ mainCircleGap = 1; } else
  if(mouseCircleRadiusMultiplier < 0){ mouseCircleRadiusMultiplier = 0; } else
  if(mouseCircleGap < 1){ mouseCircleGap = 1; }
  redraw();
}
    

