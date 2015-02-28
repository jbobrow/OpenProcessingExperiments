
// L.Rivale, Falling Leaves (Random Walk), CP 1, 14-15

PImage t;
PImage L;
int x = 400;
int y = 300;
void setup()
{
  noStroke();
  size (619,528);
  background(255);
  t = loadImage ("http://www.promoslogos.com/weblog/wp-content/uploads/fallTree.jpg");
  L = loadImage ("http://www.theherbbar.com/images/fall-leaf-small.gif");
 
}
void draw()
{
  image(t,0,0,619,528); 
  fill(0);
  textSize(16);
  text ("Press and hold to make the leaf fall",300,360);
 if (mousePressed == true)
 {
  image (L,x,y,40,39);
  y = y + 1;
  x = x + int(random (-2,2));
 }
 if (y > 500)
 {
   y = y -1;
 }
}
void mouseReleased()
{
  y = 300;
}
