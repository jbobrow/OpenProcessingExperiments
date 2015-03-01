
/*
Programmer: John Kilbane
Project: Rotating Color Shapes

Explination: This will draw a shape a random color, 
then rotate an amount around the unit circle, then 
draw it again with a new color.

You can use Q and E to increse or decrease shape size.
Use [ and ] to increase or decrease the size of the circle they draw around.
Use 1, 2, 3 to switch what shape is being drawn.

*/

color[] colors ={color(255,255,0),
                 color(255,0,0),
                 color(0,255,0),
                 color(0,0,255),
                 color(128,0,255),
                 color(0,255,255),
                 color(255,94,146),
               color(255,128,0)};
int colorCount;      
boolean debug=true;
boolean isDrawing = true;
float rot =0.2;
float rotDelta=1.07;
float distOut =40;
float ballSize=20;
int drawMode=1;
void setup()
{
  //strokeWeight(4);
  colorCount = colors.length;
  //size(851, 315); Facebook Cover
  size(800, 800);
}

void draw()
{
  if(isDrawing)
  {
    if(drawMode==1)
    {
      int rndW = (int)random(20,20);
      int rndH = (int)random(20,20);
      color rndCol = colors[(int)random(0,colorCount)];
      fill(rndCol);
      translate(mouseX, mouseY); 
      rotate(rot);
      ellipse(distOut, 0, ballSize, ballSize);

      rot+=rotDelta;
    }
    if(drawMode==2)
    {
      int rndW = (int)random(20,20);
      int rndH = (int)random(20,20);
      color rndCol = colors[(int)random(0,colorCount)];
      fill(rndCol);
      translate(mouseX, mouseY); 
      rotate(rot);
      rect(distOut, 0, ballSize, ballSize);

      rot+=rotDelta;
    }
    if(drawMode==3)
    {
      int rndW = (int)random(20,20);
      int rndH = (int)random(20,20);
      color rndCol = colors[(int)random(0,colorCount)];
      fill(rndCol);
      translate(mouseX, mouseY); 
      rotate(rot);
      
      
      triangle(distOut+ballSize, 75, distOut/2, 20, distOut-ballSize, 75);//(distOut, 0, ballSize, ballSize);

      rot+=rotDelta;
    }
  }
  if(debug)
  {
    print("Size: ",ballSize, " - ");
    println("Width: ",distOut);
  }
  //drawSizeLine();
}

void keyPressed()
{
  if(key=='r')
  {
    background(0,0,0);
  }
  if(key=='q')
  {
    ballSize-=1.2;
  }
  if(key=='e')
  {
    ballSize+=1.2;
  }
  if(key=='[')
  {
    distOut-=2.3;
  }
  if(key==']')
  {
    distOut+=2.3;
  }
  if(key=='x')
  {
    rotDelta*=-1;
  }
  if(key=='z')
  {
    if(debug)
    debug = false;
  else
    debug = true;
  }
  
  if(key=='1')
  {
    drawMode=1;
  }
   if(key=='2')
  {
    drawMode=2;
  }
   if(key=='3')
  {
    drawMode=3;
  }
  
}

void drawSizeLine()
{
    // Thicker
  int rndW = (int)random(20,20);
      int rndH = (int)random(20,20);
      color rndCol = colors[(int)random(0,colorCount)];
      fill(rndCol);
  line(mouseX,mouseY,mouseX+distOut,mouseY);
}
void mousePressed()
{
  if(isDrawing)
    isDrawing = false;
  else
    isDrawing = true;
}


