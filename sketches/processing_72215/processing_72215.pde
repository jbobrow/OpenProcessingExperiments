
//Julie O, CompProg1 Mods 4/5, Random Walk

int x = -70;
int y = 25;
PImage bunny;

void setup()
{
  size(450,450);
  bunny = loadImage("http://juliesprogrammingsite.webs.com/RdmWlkBunnyImg.png");
  smooth();
}
  
void draw()
{
  background(0,0,0);
  frameRate(30);
  fill(130,130,130); //gray circle
  image(bunny,x,y,50,50); //former ellipse
  x = x + int(random(-7,11));
  y = y + int(random(-7,10));
  
  fill(160,82,45); //brown arc
  arc(350,350,285,285,-PI/2.9,3*PI/3.4);
  fill(0,0,0);
  ellipse(425,330,20,20); //eye
  fill(255,255,255);
  noStroke();
  triangle(217.5,400,235,395,215,365);
  triangle(385,215,415,225,405,245); //big teeth
  triangle(240,392,260,385,240,370);
  triangle(380,242,405,247,395,267);
}
