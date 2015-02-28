
PImage myImage;
PImage myImage2;
PImage myImage3;
void setup()
{
  size(800,500);
  frameRate(30);
  myImage = requestImage("apple.jpg");
  myImage2= requestImage("windows_8.jpg");
  myImage3= requestImage("zerg_symbol.jpg");
}

void draw()
{
  if(myImage.width > 0)
  {
   myImage.filter(THRESHOLD);
  image(myImage,0,0,width,height);
  image(myImage2,600,380,200,100);
  image(myImage3,10,10,150,150);
  }
  int X= 0;
  while(X< width )
  {
    stroke(#5F1921);
    line(X,0,X,height);
    X +=30;
  }
  int Y=0;
  while(Y< height)
  {
   stroke(0,50,78);
  line(0,Y,width, Y);
  Y+=30;
  }
  stroke(60,0,76);
  strokeWeight(10);
  float lx=150;
  float ly=150;
  while(lx<600)
  {
    float nextx =lx +random(10);
    float nexty =ly +random(5);
    line(lx,ly,lx +10,ly +10);
    ly=nexty;
    lx=nextx;
  }
  strokeWeight(1);
}


