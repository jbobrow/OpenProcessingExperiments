
//Doubling Shapes Grace O. C.P. Mods 14-15
int a = 1;
PImage tree;
PImage autumnLeaf;
void setup()
{
  size(500, 500);
  frameRate(1);
  tree= loadImage("treeBackground.jpg");
  autumnLeaf= loadImage("autumnLeaf2.png");
}
void draw()
{
  tint(255,255,255);
  int s = 1;
  
  image(tree,0,0,500,500);
  print("s");
  println(s);
  print("a");
  println(a);
  while (s<=a)
  {
    rotate(random(-.5, .5));
    tint(int(random(0, 255)), int(random(0, 255)), 0);
    image(autumnLeaf, int(random(0, 501)), int(random(0, 501)), int(random(20, 40)), int(random(20, 40)));

    s++;
  }
  a=2*a;
  if(a>1024*2+1)
  {
    a=1;
  }
}

