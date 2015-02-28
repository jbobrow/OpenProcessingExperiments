
/* @pjs preload="1422512_535230559897785_758113087_n.jpg"; */

PImage myimage;

void setup ()
{
  size(500,600);
  
  myimage = loadImage("1422512_535230559897785_758113087_n.jpg");
}

void draw()
{
  image(myimage, 0, 0, width, height);
  filter(INVERT);
  filter(BLUR, 1);
  
  {
    stroke(0, 0, random(255));
    //line(160,230,random(400),random(400));
    
    fill(#03FFF9);
    ellipse(160,250,10,20);
    ellipse(140,300,10,20);
    ellipse(180,400,10,20);
    
  }
  
  for (int x = 0; x < width; x += 10)
  {
    stroke(200);
    line(x, 0, x, height);
    
    strokeWeight(1);
  }
  for (int y = 0; y < height; y = y + 10)
  {
    stroke(200);
    line(0, y, width, y);
    
    strokeWeight(1);
    
  }
  
  float lx = 350;
  float ly = 240;
  
  float endx = 435;
  float endy = 208;
  
  while (lx < endx && ly > endy)
  {
    float nextX = lx + random(1, 10);
    float nextY = ly + random(20);
    line(lx, ly, nextX, nextY);
    stroke(#03FFF9);
    strokeWeight(5);
    ly = nextY;
    lx = nextX;
  }
}


