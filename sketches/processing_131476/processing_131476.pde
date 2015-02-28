

PImage myimage;
PImage myimage2;
PImage myimage3;
PImage myimage4;
float myscale = 0.0;
float s = 0.01;
float rad = 0.01;
int value = 0;
PImage pattleImage;
color brushColor;
float j = 0.2; //for for <span class="k14j9d2c" id="k14j9d2c_14">rotation</span>

void setup()
{
  size (500, 500);
  background (#994C00);
  pattleImage = requestImage ("color-palette.png");
  myimage = requestImage ("realninja.png");
  myimage2 = requestImage ("realfighter.png");
  myimage3 = requestImage ("akuma.png");
  myimage4 = requestImage ("thefighter.jpg");
}

void draw()
{
  if (pattleImage.width > 0)
 {
   image(pattleImage, 0, 0, 100, 100);
 }
 if (mousePressed == true)
 {
   if (mouseButton == RIGHT)
  {
   brushColor = get(mouseX, mouseY);
  {
    if (myimage.width > 0)
    {
      image(myimage, mouseX, mouseY, 50, 50);
      //image(customBrush, mouseX, mouseY, 100, 100);
    }
    }
  }
 }
 {
 if (mousePressed == true && mouseButton == LEFT)
 {
   if (key == 'p')
 {
   if (myimage2.width > 0)
   {
     image(myimage2, mouseX, mouseY, 50, 50);
     fill(random(255), random (255), random(255));
   }
 }
 }
 }
 {
 if (mousePressed == true && mouseButton == LEFT)
 {
   fill(brushColor);
   rect (mouseX, mouseY, 25, 25);
   }
       if (key =='t')
     {
       if (myimage3.width > 0)
       {
         image(myimage3, mouseX, mouseY, 50, 50);
       }
        if ( key == 'g')
       {
         pushMatrix();
         rect(mouseX, mouseY, 25, 25);
         rotate(j++); //rotate shape
         rectMode(CENTER);
         scale(s-1);
         popMatrix();
       }
     }
 }
}
  void keyPressed()
  {
    if (key == 'm')
   {
     background (random(255), random(255), random(255));
   {
    if (key == 'b')
    {
      if (myimage4.width > 0)
     {
       background (255);
       filter(INVERT);
    }
   }
  }
   }
  }


