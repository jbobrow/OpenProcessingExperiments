
PImage ColorPallette;
color brushColor;
float sizechange = 1;
float spin = 0.01;

void setup()
{
 size(600,600);
 background(255);
  ColorPallette = requestImage("ColorPallette.png");
  
}

void draw()
{
  image(ColorPallette, 400, 400, 200, 200);
  
 if (mousePressed == true)
 {
 if (mouseButton == LEFT)
 {
   translate(mouseX, mouseY);
   scale(sizechange);
   rotate(spin);
   triangle(-30, 30, 0,- 30, 30, 30);
 }
 if (mouseButton == RIGHT)
 {
   brushColor = get(mouseX, mouseY);
 }
 }
 if (keyPressed == true)
 {
   if (key == '[')
   {
     sizechange = sizechange + 0.1;
   }
   if (key == ']')
   {
     sizechange = sizechange - 0.1;
   }
   if (key == ',')
   {
     spin = spin + 0.1;
   }
   if (key == '.')
   {
     spin = spin - 0.1;
   }
 }
   
  fill(brushColor);
}



