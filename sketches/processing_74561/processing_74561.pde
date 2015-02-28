
//Paulina Kang, 4-5, One Hundred Loops
PImage tree;
void setup()
{
  size(340,400);
  tree = loadImage("http://www.easyvectors.com/assets/images/vectors/afbig/elkbuntu-glossy-christmas-tree-clip-art.jpg");
  frameRate(4);
}
void draw()
{
  image(tree,0,0,400,400);
  int x = 1;
  while(x<=75)
  {
    fill(random(255),random(255),random(255));
    ellipse(random(60,260),random(150,275),10,10);
    ellipse(random(125,215),random(55,150),10,10);
    x+=1;
  }
}
