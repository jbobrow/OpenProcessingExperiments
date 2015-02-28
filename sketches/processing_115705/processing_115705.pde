
PImage paletteImage; 
PImage secondBrushImage;
PImage thirdBrushImage; 
color currentColor;
float myColor; 
float s = 1; 
float r =0;
int brush = 1; 

void setup()
{
  size (500, 500); 
  paletteImage = requestImage("Palette.jpg"); 
  secondBrushImage = requestImage("My_Second_Brush.gif");
    
}


void draw ()
{
    if (paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 100, 100); 
  }
  
  if (mousePressed == true)
  {
    if (mouseButton == RIGHT)
    {
      currentColor = get(mouseX, mouseY); 
    }
    
  
   if (mouseButton == LEFT)
    {
      if (brush == 1)
      {
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(r);
    scale(s);
    fill(red(currentColor), green(currentColor), blue(currentColor));
    noStroke();
    quad(38, 31, 86, 20, 69, 63, 30, 76);
    popMatrix(); 
    }
    
    
    if (brush == 2)
    {
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(r);
    scale(s);
    image(secondBrushImage, 0, 0, 30, 30);
    popMatrix(); 
    
    }
    
    if (brush == 3)
    {
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(r);
    scale(s);
    noStroke();
   if (mouseX < 166)
  {
    myColor = random(85);
    fill(myColor);
  }
  
  if (mouseX > 166 && mouseX < 332)
  {
    myColor = random(86, 170);
   fill(myColor); 
  }
  
  if (mouseX > 333 && mouseX < 500)
  {
    myColor = random(171, 255);
    fill(myColor);
  }

    
    ellipse(random(15), random(15), random(15), random(15)); 
    rect(random(25), random(25), random(25), random(25));
    triangle(random(20), random(20), random(20), random(20), random(20), random(20));  
    
    popMatrix(); 
    
    }
  }
    
     if (key == '1')
      {
       brush = 1; 
      }
    
     if (key == '2')
      {
        brush = 2; 
      }
    
    if (key == '3')
      {
    
        brush = 3; 
      }
    
    
    if(keyCode == UP)
     {
      s += 0.01;
     }
     
    if (keyCode == DOWN)
     {
     s += -0.01; 
     }
    if (keyCode == BACKSPACE)
     {
     r = 0; 
     }
    if (keyCode == RIGHT)
     {
     r = r += 1;
     }

    if (keyCode == LEFT)
     {
    r = r += -1; 
     }
     
    if (s < 0)
      {
      s = 1;   
      } 
      
    if (s > 2)
    {
      s = 1; 
    }

  } 
  }
 
 


 



