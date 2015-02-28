

PImage img7;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;

void setup()
{
  size(752, 500);
  
  img7 = loadImage("7.jpg");
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("6.png");
}
void draw()
{
  image(img7, 0, 0);
  

 
  if(mouseX >0 && mouseX < 50)
  {
    image(img1, -150, 250);
  }
  
    if(mouseX >50 && mouseX < 100)
  {
    image(img2, 0, 250);
  }
  
    if(mouseX >100 && mouseX < 200)
  {
    image(img3, 100, 250);
  }
  
    if(mouseX >200 && mouseX < 300)
  {
    image(img4, 200, 250);
  }
  
   if(mouseX >300 && mouseX < 400)
  {
    image(img5, 400, 250);
  }
  
    if(mouseX >400 && mouseX <752)
  {
    image(img6, 530, 290);
  }
  
}
  
 
  
  
 



