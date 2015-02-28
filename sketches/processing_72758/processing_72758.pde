

/** Hyo Jin Yoo
* second assignment using mouseX, mouseY
* Color changing forest by pressing mouse and mouseX, mouseY
**/


// keypressed variables
boolean monoColor = false;

//tree variables
float treeDiameter;
float rectH ;
float rectW;
float stepSize;

//color variables
int r =0;
int g =0;
int b =0;
int transparancy = 170;

color bg = color(0);
color tree1;
color tree2;
color tree3;
color tree4;
color tree5;

void setup() 
{
  size(640, 360);
  smooth();
  noStroke();
  fill(0);
  stepSize = width/20;
}

void draw() {

  //bg day to night by mouseY
  int bgVar = (int)map(mouseY, 0, height, 255, 100);
  fill(bg);
  rect(0, 0, width, height);

  
  //tree's color change by mouseS
  r = (int)map(mouseX, 0, width, 0, 255);
  g = (int)map(mouseX, 0, width, 0, 255);
  b = (int)map(mouseX, 0, width, 0, 255);
  
  if(monoColor)
  {
    bg = color(bgVar-50,100);
    tree1= tree2= tree3= tree4= tree5= color(0, transparancy-100);
    /*
    tree1= color(r, 0, 0, transparancy-80);
    tree2= color(0, g, 0, transparancy-20);
    tree3= color(r, 0, b, transparancy-60);
    tree4= color(r, g, 0, transparancy-40);
    tree5= color(0, g, b, transparancy-100);
    */
  }
  else
  {
    bg = color(bgVar-70,bgVar,0);
    tree1= color(0, g, 0, transparancy-20);
    tree2= color(0, g, b, transparancy-50);
    tree3= color(r, g, 0, transparancy-20);
    tree4= color(0, g, b, transparancy-40);
    tree5= color(r, g, 0, transparancy-20);
  }


  for (int x=0; x<=width; x+=stepSize) 
  {
    //tree1(triangle)==========================================================================================================================================
    for (int y=0; y<=height; y+=stepSize)
    {
      float distanceToMouse = dist(x, y, mouseX, mouseY);
      treeDiameter = distanceToMouse*0.2;
      rectH =treeDiameter*0.5-distanceToMouse*0.01;
      rectW =treeDiameter/4;
      fill(tree1);
      rect(x+stepSize/2-rectW/2, y+stepSize/2+stepSize*0.1+treeDiameter*0.2, rectW, rectH);
      triangle((x+stepSize/2), (y+stepSize/2-stepSize*0.1)-treeDiameter*0.2, (x+stepSize/2-stepSize*0.1)-treeDiameter*0.2,
               (y+stepSize/2+stepSize*0.1)+treeDiameter*0.2, (x+stepSize/2+stepSize*0.1)+treeDiameter*0.2, (y+stepSize/2+stepSize*0.1)+treeDiameter*0.2);
    }
  }

  //tree2==========================================================================================================================================
  for (int x=0; x<=width; x+=stepSize*2) 
  {
    for (int y=0; y<=height; y+=stepSize*2)
    {
      float distanceToMouse = dist(x, y, mouseX, mouseY);
      treeDiameter = distanceToMouse*0.2;
      rectH =treeDiameter;
      rectW =treeDiameter/4;
      fill(tree2);
      ellipse(x, y, treeDiameter, treeDiameter);
      rect(x-rectW/2, y, rectW, rectH);
    }
  }
  //tree3==========================================================================================================================================
  for (int x=0; x<=width; x+=stepSize*2) 
  {
    for (int y=0; y<=height; y+=stepSize*2)
    {
      float distanceToMouse = dist(x, y, mouseX, mouseY);
      treeDiameter = distanceToMouse*0.2;
      rectH =treeDiameter;
      rectW =treeDiameter/4;
      fill(tree3);
      ellipse(x+stepSize, y, treeDiameter, treeDiameter);
      rect(x+stepSize-rectW/2, y, rectW, rectH);
    }
  }


  //tree4==========================================================================================================================================

  for (int x=0; x<=width; x+=stepSize*2) 
  {
    for (int y=0; y<=height; y+=stepSize*2)
    {
      float distanceToMouse = dist(x, y, mouseX, mouseY);
      treeDiameter = distanceToMouse*0.2;
      rectH =treeDiameter;
      rectW =treeDiameter/4;
      fill(tree4);
      ellipse(x+stepSize, y+stepSize, treeDiameter, treeDiameter);
      rect(x-rectW/2+stepSize, y+stepSize, rectW, rectH);
    }
  }

  //tree5==========================================================================================================================================
  for (int x=0; x<=width; x+=stepSize*2) 
  {
    for (int y=0; y<=height; y+=stepSize*2)
    {
      float distanceToMouse = dist(x, y, mouseX, mouseY);
      treeDiameter = distanceToMouse*0.2;
      rectH =treeDiameter;
      rectW =treeDiameter/4;
      fill(tree5);
      ellipse(x, y+stepSize, treeDiameter, treeDiameter);
      rect(x-rectW/2, y+stepSize, rectW, rectH);
    }
  }
}

void mousePressed() {
  monoColor = !monoColor;
}

