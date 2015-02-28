
float prevX;
float prevY;
int brush = 0;
PImage paletteImage;
color currentColor;
float a;
float s = 1;
PImage pumpkinImage;


void setup()
{
  size(600,600);
  frameRate(200);
 pumpkinImage = requestImage("pumpkin.jpg");
  paletteImage = requestImage("palette.jpg");
}

void draw()
{
  if(paletteImage.width > 0);
  {
    image (paletteImage, 0, 0, 100, 100);
  }
 
  if (mousePressed == true)
  {
    
    if (mouseButton ==RIGHT)
    {
     currentColor = get(mouseX, mouseY); 
    }
    
    if (mouseButton == LEFT)
    {
      
      if (brush == 0)
      {
        pushMatrix();
        rotate(a);
        scale(s);
      fill( 255, 0, 0, 0);
      noStroke();
      strokeWeight(10);
      stroke(red(currentColor), green(currentColor), blue(currentColor));
      line(prevX, prevY, mouseX, mouseY);
      prevX = mouseX;
      prevY = mouseY;
      popMatrix();
    }
    
    if (brush == 1)
    {
      pushMatrix();
      rotate(a);
      scale(s);
      fill(red(currentColor), green(currentColor), blue(currentColor));
      stroke(random(255), random(255), random(255));
      rect(mouseX, mouseY, random(100), random(100));
      popMatrix();
    }
    
    if (brush == 2)
    {
      background(0);
      if (pumpkinImage.width > 0);
      {
        pushMatrix();
        translate(mouseX, mouseY);
        rotate(a);
        scale(s);
        image(pumpkinImage, random(500), random(500), 80, 80);
        popMatrix();
        
      }
      
      }
      
      if (brush == 3)
      {
        background(255);
      }
      
    }  
  }
  prevX = mouseX;
  prevY = mouseY;
}
void keyReleased()
{
  if ( key == '0')
  {
    brush = 0;
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
}

void keyPressed()
{
 if (keyCode == LEFT)
{
 a += .02;
} 
if (keyCode == RIGHT)
{
 s += .05; 
}

}


