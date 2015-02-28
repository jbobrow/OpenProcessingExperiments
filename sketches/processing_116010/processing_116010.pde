
PImage paletteImage;
color currentColor;
PImage brucelee;
int x = 0;
int y = 0;
int a = 0;
int s = 1;
int brush = 2;
float prevX;
float prevY;



void setup()
{
   
  size(500, 500);
  fill(0, 102);
  smooth();
  noStroke();
  paletteImage = requestImage("palette.jpg");
  brucelee = requestImage("brucelee.jpg");
  
}
 
void draw()
{
  if (paletteImage.width > 0)
  {
    image(paletteImage, 0, 0, 100, 100);
}
 
  if (mousePressed == true && mouseButton == RIGHT)
  {
    currentColor = get(mouseX, mouseY);
     
  }
    if (mousePressed && mouseButton == LEFT) {
       brush = 2;
    }
    
          if (brush == 0)
         {

        strokeWeight(100);
        stroke(random(255), random(255), random(255));
        colorMode(HSB, random(360), random(100), random(100));
        line(prevX, prevY, mouseX, mouseY);
        ellipse(mouseX, mouseY, 50, 50);
      
        fill(255, 0, 0, 128);
        noStroke();
        ellipse(mouseX, mouseY, 40, 40);
      
        fill(0, 0, 255);
        ellipse(mouseX, mouseY, 50, 50);
        
             prevX = mouseX;
     prevY = mouseY;
       }
       if (brush == 1)
      {
       if(brucelee.height >0)
    {
      pushMatrix();
      translate(mouseX,mouseY);
      rotate(random(100,400));
      scale(random(0.5,7));
      image(brucelee,0,0,random(30,300),random(10,75));
      popMatrix();
    }
    }
    if (brush == 2)
    {
     pushMatrix();
  translate(mouseX, mouseY);
  rotate(a);
  scale(s);
   fill(red(currentColor), green(currentColor), blue(currentColor)); 
  rect(0, 30, 50, 50); 
  popMatrix();
    }
}
      
      
 void keyPressed() {
      
     if (key == CODED)
     {
       if (keyCode == LEFT)
       {
         brush = 0;
       }

 
    
    if (keyCode == UP)
      {
        brush = 1;
      }
      
   }

}
    
   
  
     


      




   


