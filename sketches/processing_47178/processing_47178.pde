
//Homework 11, October/November 2011
//Copyright manuela kind, cmu pittsburgh pa

//--------explanations---------

//Move figure with arrow keys;
//Press 'C' to zoom in and 'A' to zoom out;
//Press 'Z' for extreme zoom;
//Press 'S' or click on STOP-button to stop movement;
//Press space bar or click on RESET-button for resetting;
//Click and drag sliders to rotate figure


//----------variables-----------

//resetcenter
float centerX;
float centerY;
float centerZ;
//speed
float deltaX;
float deltaY;
float deltaZ;
//buttonsPos
float buttonRX, buttonRY;
float buttonSX, buttonSY;
//buttonsDia
float buttonRd;
float buttonSd;
//barsposition
float bar1, bar2, bar3;
float slide1x, slide1y, slide2x, slide2y, slide3x, slide3y;
//slidesizes
float slideXZwd, slideXZht;
float slideYwd, slideYht;
//rotation
float spinX, spinY, spinZ;
//font
PFont font;

//------------setup-------------
void setup()
{
  size (500, 500, P3D);
  sphereDetail(3);
  smooth();
  textMode (SCREEN);
  ellipseMode (CENTER);
  rectMode(CENTER);
  font = loadFont("HelveticaNeue-Bold-13.vlw");
  
  //reset center  
  centerX=width/2;
  centerY=height/2;
  centerZ= 0;
  //speed  
  deltaX = 0;
  deltaY = 0;
  deltaZ = 0;
  //positionbuttons
  //reset
  buttonRX = width/10;
  buttonRY = height/10;
  //stop
  buttonSX = width-width/10;
  buttonSY = height/10;
  //diametersbuttons
  buttonRd = width/10;
  buttonSd = width/10;
  //variablesbars
  bar1 = width/10;
  bar2 = width/10;
  bar3 = width/10;

  //sliders
  slideXZwd = bar1*0.6;
  slideXZht = bar1*0.5;
  slideYwd = bar2*0.5;
  slideYht = bar2*0.6;
  
  slide1x = bar1*0.75;
  slide1y = height/2;  
  slide2x = width/2;
  slide2y = bar2*0.75;
  slide3x = width-bar3*0.75;
  slide3y = height/2;
}

//------------draw------------

void draw()
{
  background (100, 200, 100);
  figure();
  
  moveM();
  rotateM();
  
  buttonReset();
  buttonStop();

  bars();
  sliders();

  information();
}

//----------sliders------------
void sliders()
{
  fill(200, 100, 100, 120);
  stroke(255, 150, 150, 150);
  rect(  slide1x,   slide1y, slideXZwd, slideXZht);

  fill(200, 100, 100, 120);
  stroke(255, 150, 150, 150);
  rect(slide2x, slide2y,  slideYwd, slideYht);

  fill(200, 100, 100, 120);
  stroke(255, 150, 150, 150);
  rect(slide3x, slide3y,  slideXZwd, slideXZht);

}

//-------rotationbars----------
void bars()
{
  noStroke();
  fill(140, 240, 140, 100);
  rect(bar1*0.75, height/2, bar1/2, bar1*4);

  noStroke();
  fill(140, 240, 140, 100);
  rect(width/2, bar2*0.75, bar2*4, bar2/2);

  noStroke();
  fill(140, 240, 140, 100);
  rect(width-bar3*0.75, height/2, bar3/2, bar3*4);
}

//---------rotate-------------
void rotateM()
{
  if (mousePressed) 
  {
    if (mouseX >= bar1/2 && mouseX <= bar1
    &&  mouseY >= height/2-bar1*2  &&  mouseY <= height/2+bar1*2) 
    {
    slide1y = mouseY;
    spinX = map(mouseX, height/2-bar1*2, height/2+bar1*2, 2*PI,-2*PI); 
    }

    if (mouseY >= bar2/2 && mouseY <= bar2
    &&  mouseX >= width/2-bar2*2   && mouseX <= width/2+bar2*2) 
    {
    slide2x = mouseX;
    spinY = map(mouseY, width/2-bar2*2, width/2+bar2*2, 2*PI, -2*PI); 
    }

    if (mouseX >= width-bar3*1.52 && mouseX <= width-bar3/2
    &&  mouseY >= height/2-bar3*2 &&  mouseY <= height/2+bar3*2) 
    {
    slide3y = mouseY;
    spinZ = map(mouseX, height/2-bar3*2, height/2+bar3*2, 2*PI, -2*PI); 
    }
  }
}

//---------buttons-------------

void mousePressed()
{ //reset
  if (mouseX >= buttonRX - buttonRd/2 && mouseX <= buttonRX + buttonRd/2
    &&  mouseY >= buttonRY - buttonRd/2 && mouseX <= buttonRY + buttonRd/2)
  {
    spinX = 0;
    spinY = 0;
    spinZ = 0;
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
    centerX = width/2;
    centerY = height/2;
    centerZ = 0;
  }
  
  //stop
  if (mouseX >= buttonSX - buttonSd/2 && mouseX <= buttonSX + buttonSd/2
    &&  mouseY >= buttonSY - buttonSd/2 && mouseY <= buttonSY + buttonSd/2)
  {
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
  }
 
}

//resetbutton
void buttonReset()
{
  noStroke();
  fill(100, 100, 100, 150);
  ellipse(buttonRX, buttonRY, buttonSd, buttonSd);

  textAlign(CENTER, CENTER);
  fill(255);
  text ("RESET", buttonRX, buttonRY, buttonRd, buttonRd);
}

//stopbutton
void buttonStop()
{
  noStroke();
  fill(100, 100, 100, 150);
  ellipse(buttonSX, buttonSY, width/10, height/10);

  textAlign(CENTER, CENTER);
  fill(255);
  text ("STOP", buttonSX, buttonSY, buttonSd, buttonSd);
}

//-----------move--------------
void moveM()
{
  centerX = centerX + deltaX;  
  centerY = centerY + deltaY;  
  centerZ = centerZ + deltaZ;
}


void keyPressed()
{
  //zoom
  if (key == 'a' || key == 'A')
  {
    deltaZ = deltaZ - 1;
  }

  if (key == 'c' || key == 'C')
  {
    deltaZ = deltaZ + 1;
  }

  //extremezoom
  if (key == 'z' || key == 'Z')
  {
    centerZ = centerZ - 500;
  }

  //------------to determine yet!!
  if (key == 'x' || key == 'X')
  {
    centerZ = centerZ + 500;
  }
  //-----------------------------

  //stop
  if (key == 's' || key == 'S')
  {
    deltaX = 0; 
    deltaY = 0; 
    deltaZ = 0;
  }

  //reset
    if (key == ' ')
    {
     centerX=width/2;
     centerY=height/2;
     centerZ= 0;
  
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
   }

  //move
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      deltaY = deltaY - 1;
    }
    else if (keyCode == DOWN)
    {
      deltaY = deltaY + 1;
    } 
    else if (keyCode == LEFT)
    {
      deltaX = deltaX - 1;
    }
    else if (keyCode == RIGHT)
    {
      deltaX = deltaX + 1;
    }
  }
}
//--------information------------

void information()
{
  textFont(font, 13);
  textAlign(CENTER, TOP);
  fill(255);

  //rotation
  text ("ROTATION:" + "\n" + "X:"+ "  " + round(degrees(spinX/10)) + "°"
    + "\n"+ "Y:"+"  " + round(degrees(spinY/10))+ "°"
    + "\n"+ "Z:"+ "  " + round(degrees(spinZ/10))+ "°", width/4, height-height/7);

  //speed
  text ("SPEED:" + "\n" + "X:" + "  "+ int(deltaX) + "px"
    + "\n"+ "Y:" + "  "+ int(deltaY)+ "px"
    + "\n"+ "Z:"+ "  " + int(deltaZ)+ "px", width/2, height-height/7);

  //position
  text ("POSITION:" + "\n" + "X:" + "  "+ int (centerX-width/2) + "px"
    + "\n"+ "Y:" + "  "+ int (centerY-height/2)+ "px"
    + "\n"+ "Z:" + "  "+ int (centerZ)+ "px", width*0.75, height-height/7);
}


