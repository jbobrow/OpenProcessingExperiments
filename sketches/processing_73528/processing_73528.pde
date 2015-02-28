
//Keana Moezzi, CP1, 4-5, Random Walk

int x=-3;
int y=-3;
PImage b;
void setup()
{
  background(61, 89, 171);
  size(450, 390);
  b = loadImage("http://ilovestarsandsmiles.webs.com/penguin.jpg");
}
void draw()
{
  frameRate(200);
  image(b, x, y, 500, 400);
  if (mousePressed == true)
  {
 
    x= x + int(random(-2, 2));
    y= y +int(random(-2, 2));
    fill (255);
    smooth();
    strokeWeight(4);
    triangle(150, 90, 160, 130, 130, 90);
    ellipse(130, 80, 100, 40);
    fill(0);
    text("Cowabunga!!!!", 90, 85);
  }
}
