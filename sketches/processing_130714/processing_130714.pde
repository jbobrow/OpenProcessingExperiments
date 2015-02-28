
float myscale = 0.0;
float rad = 0.0;
float s = 0.01;
float j = 0.2; //for for <span class="k14j9d2c" id="k14j9d2c_14">rotation</span>
int value = 0;
PImage pattleImage;
color brushColor;

void setup()
{
  size (500, 500);
  background (255);
  pattleImage = requestImage ("colorwheel.png");
  
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
  }
 }
 if (mousePressed == true && mouseButton == LEFT)
 {
 fill(brushColor);
  rad = rad + 0.5;
  s = s + 0.0007;
  pushMatrix();
  fill (brushColor);
  translate (mouseX, mouseY);
  scale(s);
  rotate(j++); //rotate shape
  rectMode(CENTER);
  triangle (mouseX, mouseY, 30, 75, 125, 50);
  popMatrix();
 }
}
{
if (keyPressed)
 {
   if(key == 'w')
   {
     translate (mouseX +50, mouseY +50);
     s = (s * 41);
   }
     if (key == 's')
    {
      translate (mouseX - 50, mouseY -50);
     s = (s / 51);
   }
 }
}


