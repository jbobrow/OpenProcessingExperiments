
PImage img;
PGraphics edges = createGraphics(500,500,P2D);

int numberOfPics=20;

void setup()
{
  size(500,500);
  img = loadImage("test"+numberOfPics+".jpg");//+(int(random(numberOfPics))+1)+".jpg");
  image(img,0,0);
}

void draw()
{
  if(frameCount%120==1)
  {
  println("starting");
  int n=0;
  edges.beginDraw();
  for(int x=0;x<500;x++)
  for(int y=0;y<500;y++)
  {
    int b = int(saturation(img.get(x,y))+brightness(img.get(x,y)));
    int d = 0;
    
    for(int dx=-1;dx<=1;dx++)
    for(int dy=-1;dy<=1;dy++)
    if(dx!=0||dx!=0)
    if(!(x+dx<0||x+dx>499||y+dy<0||y+dy>499))
    d+=abs(b-int(saturation(img.get(x+dx,y+dy))+brightness(img.get(x+dx,y+dy))));
    
    edges.set(x,y,color(int(d/16)));
    n+=int(d/16);
  }
  println(n);
  //edges.filter(POSTERIZE,2);
  edges.filter(THRESHOLD,n/25731850.0);
  edges.filter(BLUR,12);
  edges.filter(THRESHOLD,0.1);
  //edges.filter(INVERT);
  edges.endDraw();
  img.mask(edges);
  background(50,200,0);
  image(img,0,0);
  }
  if(frameCount%120==118)
  {
    img = loadImage("test"+(int(random(numberOfPics))+1)+".jpg");
    image(img,0,0);
  }
}

