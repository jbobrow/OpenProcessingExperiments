
PImage paletteImage;
color currentColor;
int x = 0;
int y = 0;
int a = 0;
int s = 1;
void setup()
{
  
  size(500, 500);
  paletteImage = requestImage("palette.jpg");
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
  

  
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(a);
  scale(s);
  fill(red(currentColor), green(currentColor), blue(currentColor));
  triangle(0, 30, 0, 0, 30, 30);  
  popMatrix();
    }
}
    
    
   void keyPressed() {
     
     if (key == CODED)
     {
       if (keyCode == DOWN)
       {
         s += 2;
       }
       else if (keyCode == RIGHT)
         {
           s -= 1;
         }
       if (keyCode == UP)
         {
           a += 1;
         }
         else if (keyCode == LEFT)
         {
           a -= 2;
         }
       if (keyPressed) {
           if (key == 'a' || key == 'A') {
            fill(get(mouseX, mouseY));
           }
     }
   }
   }




