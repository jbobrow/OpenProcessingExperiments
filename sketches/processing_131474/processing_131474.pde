
PImage picColorPicker;
PImage picStar;
color brushColor;
 
void setup()
{
  size(501,501);
  background(#FFFFFF);
  frameRate(30);
  
  picColorPicker = requestImage("imageColorPicker.png");
  picStar = requestImage("imageStar1.png");
}

void draw()
{
  noStroke();
  image(picColorPicker, 0,0, 128,128);
  
  //START - Brush 1 (simple stroke)
  if (key == '1')
  {
    if (mousePressed == true)
    {
      if (mouseButton == LEFT)
      {
        fill(brushColor);
        translate(mouseX,mouseY);
        rect(-10,-10, 10,10);
      }
    }
  }
  //END - Brush 1
  
  //START - Brush 2
  if (key == '2')
  {
    if (mousePressed == true)
    {
      if (mouseButton == LEFT)
      {
        fill(random(255), random(255), random(255));
        translate(mouseX,mouseY);
        ellipse(-10 + random(50), -10 + random(50), 20,20);
      }
    }
  }
  //END - Brush 2

  //START - Brush 3
  if (key == '3')
  {
    if (mousePressed == true)
    {
      if (mouseButton == LEFT)
      {
        if (picStar.width > 0)
        {
        //fill(random(255), random(255), random(255));
        translate(mouseX,mouseY);
        image(picStar, -25,-25, 50,50);
        filter(BLUR);
        }
      }
    }
  }  
  //END - Brush 3
  
  
  
  //START - Eraser
  if (key == '0')
  {
    if (mousePressed == true)
    {
      if (mouseButton == LEFT)
      {
        fill(#FFFFFF);
        translate(mouseX,mouseY);
        ellipse(0,0, 25,25);
      }
    }
  }
  //END - Eraser
  
  //START - Color Picker
  if (mousePressed == true)
  {
    if (mouseButton == RIGHT)
    {brushColor = get(mouseX,mouseY);}
  }
  //END - Color Picker
}


