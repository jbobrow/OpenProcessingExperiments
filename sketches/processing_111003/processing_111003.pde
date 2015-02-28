
float x;
float y;
float easing = 0.05;
float valueBG=0;
boolean MouseIsDown=false;
boolean valueClear = false;

void setup()
{
  size (600,600);
  noStroke();
  background(valueBG);
 
}

float valueCol= 255;

void draw()
{
  //BACKGROUND
  fill(0,0,0,20);
  rectMode (CENTER);
  rect(300,300,600,600);
  
  // INSTRUCTIONS FOR USER
  if (MouseIsDown==false)
  {fill(0);
  text("Click and hold to see sparks fly \n Click CTRL to change color...", 0,20);}
  
 
 //EASING
  float  mehX = mouseX-x;
  if (abs(mehX)>1)
    {x = x + mehX * easing ;}
  
  float mehY = mouseY-y;
  if (abs(mehY)>1)
    {y = y + mehY * easing ;}
    
   //MAIN WHITE CIRCLE 
   fill(valueCol);
   ellipse (x,y,50,50);
  
  
  //STROKES
  if (MouseIsDown == true)
  {
    rectMode(CENTER);
    fill(random(255),random(255),random(255));
    rect(mouseX,mouseY,10,10);
    
    filter (DILATE);
    filter(POSTERIZE, 9); 
  }
  
  
}

//CHANGE COLOR OF CIRCLE
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == CONTROL)
    {valueCol= random(255);}
  }

}

void mousePressed()
{
  MouseIsDown=true;
   
}

void mouseReleased()
{
  MouseIsDown=false;
}


