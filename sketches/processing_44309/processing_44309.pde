
//Homework 11
//Copyright Kristen McConnell, October 2011
//Pittsburgh, PA 15221 

//M & Slider Color Variables
color col, col2;
//M Variables
float x, y, z, deltaX, deltaY, deltaZ, lastZ;
//Slider Variables
int sliderX, sliderX2, sliderX3, sliderY, sliderWidth, sliderHeight;
float rotationValue1, rotationValue2, rotationValue3;
//Button Variables
float stopX, stopY, stopWidth, stopHeight;
float resetX, resetY, resetWidth, resetHeight;

void setup()
{
  size(400,400,P3D); 
  textMode(SCREEN);
  textSize(12);
  col = color(255,192,203);
  col2 = color(178,34,34);  
  x = width/2;
  y = height/2;
  z = 0;
  deltaX = 0;
  deltaY = 0;
  deltaZ = 0;
  sliderX = int( width*.05);
  sliderX2 = int( width*.37);
  sliderX3 = int( width*.7);
  sliderY = int( height*.93);
  sliderWidth = int( .25*width);
  sliderHeight = int( .025*height );
  stopX = width * .65;
  stopY = height * .025;
  stopWidth = width * .15;
  stopHeight = height * .075;
  resetX = width * .825;
  resetY = height * .025;
  resetWidth = width * .15;
  resetHeight = height * .075;
}

void draw()
{
  prepScreen();
  drawSliderBar(sliderX,rotationValue1);
  drawSliderBar(sliderX2,rotationValue2);
  drawSliderBar(sliderX3,rotationValue3);
  drawButtons();
  drawStats();
  rotateM();
  M();
  moveM();
  checkMousePress();
}

//Distance and Movement Stats
void drawStats()
{
  fill(col2);
  textSize(10);
  text("Distance" + "\n" + "X: " + int(x-(width/2)) + 
  "\n" + "Y: " + int(y-(height/2)) + 
  "\n" +"Z: " + int(z), width*.025, height*.05);
  text("Movement" + "\n" + "X: " + int(deltaX) + 
  "\n" + "Y: " + int(deltaY) + 
  "\n" +"Z: " + int(deltaZ), width*.025, height*.25);
  
}

//Draws Stop and Reset Buttons with Labels
void drawButtons()
{
  noStroke();
  fill(col2);
  rect(stopX, stopY, stopWidth, stopHeight);
  rect(resetX, resetY, resetWidth, resetHeight);
  fill(255);
  text("Stop", stopX + stopWidth/3, stopY + stopHeight/1.5);
  text("Reset", resetX + resetWidth/4, resetY + resetHeight/1.5);
}

//Actions Taken When Stop and Reset Buttons are Pushed Upon MousePress
void mousePressed()
{
  if (mouseX < stopX + stopWidth && mouseX > stopX && mouseY > stopY && mouseY < stopY + stopHeight)
  {
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
  }
  else if (mouseX < resetX + resetWidth && mouseX > resetX && mouseY > resetY && mouseY < resetY + resetHeight)
  {
    deltaX = 0;
    deltaY = 0;
    deltaZ = 0;
    x = width/2;
    y = height/2;
    z = 0;
    rotationValue1 = 0;
    rotationValue2 = 0;
    rotationValue3 = 0;
  }
} 

//Rotating M with Sliders --- Checking Where the Mouse is
void checkMousePress()
{
  if (mousePressed && mouseX >= sliderX && mouseX <= sliderX + sliderWidth && mouseY >= sliderY && mouseY <= sliderY + sliderHeight)
  {
    rotationValue1 = mapMouse(sliderX, sliderY, sliderWidth);
  }
  else if (mousePressed && mouseX >= sliderX2 && mouseX <= sliderX2 + sliderWidth && mouseY >= sliderY && mouseY <= sliderY + sliderHeight)
  {
    rotationValue2 = mapMouse(sliderX2, sliderY, sliderWidth);
  }
  else if (mousePressed && mouseX >= sliderX3 && mouseX <= sliderX3 + sliderWidth && mouseY >= sliderY && mouseY <= sliderY + sliderHeight)
  {
    rotationValue3 = mapMouse(sliderX3, sliderY, sliderWidth);
  }
}

float mapMouse(int barX, int barY, int barWidth)
{
     float rotationValue = int( map( mouseX, barX, barX + barWidth, -360, 360) ); 
     if ( rotationValue < -360 )
     {
         rotationValue = -360; 
     }
     else if ( rotationValue > 360 )
     {
         rotationValue = 360 ; 
     }
    return rotationValue;
}

//Drawing the Sliders with Labels
void drawSliderBar(int v, float rotationValue)
{
    noStroke( );
    fill(col);
    rect(v, sliderY, sliderWidth, sliderHeight);
    fill(col2);
    textSize(10);
    text("X Axis Rotation  " + rotationValue1 + "°", sliderX, sliderY - 10);
    text("Y Axis Rotation  " + rotationValue2 + "°", sliderX2, sliderY - 10);
    text("Z Axis Rotation  " + rotationValue3 + "°", sliderX3, sliderY - 10);
    stroke(col2);
    strokeWeight( 2 );
    float x = map(rotationValue, -360,360,v,v+sliderWidth);
    line( x, sliderY - 3, x, sliderY + sliderHeight + 3 );
}

//Moving the M
void moveM()
{
  x = x + deltaX;
  y = y + deltaY;
  z = z + deltaZ;
}

//Keyboard Controls for Moving the M
void keyPressed()
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
  else if (keyCode == 'A' || keyCode == 'a')
    {
      deltaZ = deltaZ - 1;
    }
  else if (keyCode == 'C' || keyCode == 'c')
    {
      deltaZ = deltaZ + 1;
    }
  else if (keyCode == 'S' || keyCode == 's')
    {
       deltaX = 0;
       deltaY = 0;
       deltaZ = 0;
    }
  else if (keyCode == ' ')
    {
      deltaX = 0;
      deltaY = 0;
      deltaZ = 0;
      x = width/2;
      y = height/2;
      z = 0;
      rotationValue1 = 0;
      rotationValue2 = 0;
      rotationValue3 = 0;
    }
  else if (keyCode == 'Z' || keyCode == 'z')
    {
      deltaZ = 0;
      lastZ = z;
      z = -500;
    }
  else if (keyCode == 'X' || keyCode == 'x')
    {
      z = lastZ;
      deltaZ = 0;
    }
}  

//Initial Placement of M, then Rotates M
void rotateM()
{
  translate (x, y, z);
  rotateX(radians(rotationValue1));
  rotateY(radians(rotationValue2));
  rotateZ(radians(rotationValue3));
} 

//Draws the 3D M
void M()
{
  stroke(0);
  strokeWeight(1);
  fill(col);
  
  //Left Side of M -- Box
  pushMatrix();
  {
    translate(width*-.2,0,0);
    box(width*.1,height*.5,width*.1);
  }
  popMatrix();
  
  //Left Side of M, Bottom --Spheres
  fill(col2);
  pushMatrix();
  {
    translate(width*-.25,height*.27,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.2,height*.27,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.15,height*.27,width*.04);
    sphere(width*.02);
  }
  popMatrix();
    pushMatrix();
  {
    translate(width*-.25,height*.27,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.2,height*.27,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.15,height*.27,0);
    sphere(width*.02);
  }
  popMatrix();
    pushMatrix();
  {
    translate(width*-.25,height*.27,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.2,height*.27,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.15,height*.27,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  //Left Side of the M, Top --Spheres
  pushMatrix();
  {
    translate(width*-.25,height*-.27,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.2,height*-.27,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.15,height*-.27,width*.04);
    sphere(width*.02);
  }
  popMatrix();
    pushMatrix();
  {
    translate(width*-.25,height*-.27,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.2,height*-.27,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.15,height*-.27,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.25,height*-.27,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.2,height*-.27,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.15,height*-.27,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  
  //Right Side of M -- Box
  fill(col);
  pushMatrix();
  {
    translate(width*.2,0,0);
    box(width*.1,height*.5,width*.1);
  }
  popMatrix();
  
  //Right Side of M, Bottom --Spheres
  fill(col2);
  pushMatrix();
  {
    translate(width*.25,height*.27,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.2,height*.27,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.15,height*.27,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.25,height*.27,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.2,height*.27,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.15,height*.27,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.25,height*.27,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.2,height*.27,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.15,height*.27,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  
  //Right Side of the M, Top --Spheres
  pushMatrix();
  {
    translate(width*.25,height*-.27,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.2,height*-.27,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.15,height*-.27,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.25,height*-.27,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.2,height*-.27,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.15,height*-.27,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.25,height*-.27,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.2,height*-.27,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.15,height*-.27,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  
  //Middle Row of Spheres
  fill(col2);
  pushMatrix();
  {
    translate(0,0,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(0,0,width*0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(0,0,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  
  //Right Slant of M
  pushMatrix();
  {
    translate(width*.025,height*-.035,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.025,height*-.035,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.025,height*-.035,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.05,height*-.07,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.05,height*-.07,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.05,height*-.07,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.075,height*-.105,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.075,height*-.105,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.075,height*-.105,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.1,height*-.14,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.1,height*-.14,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.1,height*-.14,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.125,height*-.175,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.125,height*-.175,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*.125,height*-.175,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  
  //Left Slant of M
  pushMatrix();
  {
    translate(width*-.025,height*-.035,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.025,height*-.035,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.025,height*-.035,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.05,height*-.07,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.05,height*-.07,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.05,height*-.07,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.075,height*-.105,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.075,height*-.105,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.075,height*-.105,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.1,height*-.14,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.1,height*-.14,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.1,height*-.14,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.125,height*-.175,width*.04);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.125,height*-.175,0);
    sphere(width*.02);
  }
  popMatrix();
  pushMatrix();
  {
    translate(width*-.125,height*-.175,width*-.04);
    sphere(width*.02);
  }
  popMatrix();
}

//White Background
void prepScreen()
{
  background(255);
}

