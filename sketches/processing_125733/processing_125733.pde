
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
 
 
void setup()
{
size(900, 600); 
img1 = loadImage("background.png");
img2 = loadImage("Have.png");
img3 = loadImage("Have_A.png");
img4 = loadImage("Have_A_Nice.png");
img5 = loadImage("Have_A_Nice_Day.png");
img6 = loadImage("Have_A_Nice_Day_Smile.png");
img7 = loadImage("Have_A_Nice_Day_Smile_Blink.png");
 
}
 
void draw()
{
   
  image(img1, 0, 0); //image(img, mouseX, mouseY, 500, 400);
   
   
  if (mouseX >= 200)
    {
  image(img2, 152, 200);
    }
     
  if (mouseX >= 350) 
    {
  image(img3, 152, 200);
    }
     
  if (mouseX >= 500)
    {
  image(img4, 152, 200);
    }
 
 if (mouseX >= 650)
    {
  image(img5, 152, 200);
    }
    
     if (mouseX >= 800)
    {
  image(img6, 152, 200);
    }
  
 
  if(mousePressed)
{
  image(img7, 152, 200);
}
 
 }
 
 



