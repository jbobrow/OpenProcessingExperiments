
//Victoria H, Random Walk Bird, CP1 mods 16/17
//this does not work online for some reason...

/* @pjs globalKeyEvents="true"; */
PImage birdy;
PImage tree;
int x = 0;
int y = 0;
void setup()
{
  size(300,300);
  tree = loadImage("http://openclipart.org/image/800px/svg_to_png/80/PeterM_Tree.png");
  birdy = loadImage("http://sweetclipart.com/multisite/sweetclipart/files/bird_blue_cute.png");
}
void draw()
{
  background(219,131,15);
  image(tree,0,0,200,300);
  birdy();
  frameRate(900);
}
void birdy()
{
  translate(100,100);
  image(birdy,x,y,200,200);
}
void mouseMoved()
{
  x = x + int(random(-4,4));
  if(x<300 && x>0)
  {
    y = y + int(random(-4,4));
  }
}
