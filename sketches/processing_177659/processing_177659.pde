
PImage myimage;
PImage myimage2;
void setup()
{
size(1000,1000);
myimage=loadImage("Spraydose.png");
myimage2=loadImage("Nebel.png");
}
void draw()
{
background(255);
imageMode(CENTER);
  image(myimage,mouseX,mouseY+200);

{
  if (mousePressed==true)
  {
    imageMode(CENTER);
    image(myimage2,mouseX+345,mouseY-60);
  }
}
}



