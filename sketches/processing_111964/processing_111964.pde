
PImage myImage;
void setup()
{
 size (500,500);
 frameRate (30);
 myImage = requestImage("gio_pic.jpg");
}

void draw()
{
  if(myImage.width > 0)
  {
    myImage.filter(THRESHOLD);
    image (myImage,0,0, width, height);
    image (myImage,40,40,175,175);
    image (myImage,20,20,80,80);
  }
 int x=0;
 while(x<width)
 {
   stroke(0,60,60);
   line(x,0,x,height);
   x += 40;
 }
 int y=0;
 while(y<height)
 {
   stroke(70,50,0);
   line(0,y,width,y);
   y+=40;
 }
  stroke(60,0,76);
  strokeWeight(10);
  float lx=75;
  float ly=75;
  while(lx<500)
  {
    float nextx =lx +random(7);
    float nexty =ly +random(5);
    line(lx,ly,lx +10,ly +10);
    ly=nexty;
    lx=nextx;
  }
  stroke(180,0,50);
  strokeWeight(5);
  float lX=0;
  float lY=120;
  while(lX<400)
  {
    float nextX =lX +random(3);
    float nextY =lY +random(5);
    line(lX,lY,lX +10,lY +10);
    lY=nextY;
    lX=nextX;
  }
  stroke(0,150,50);
  strokeWeight(5);
  float la=50;
  float lb=100;
  while(la<500)
  {
    float nexta =la +random(5);
    float nextb =lb +random(5);
    line(la,lb,la +10,lb +10);
    lb=nextb;
    la=nexta;
  }
  stroke(80,0,150);
  strokeWeight(8);
  float lA=100;
  float lB=0;
  while(lA<500)
  {
    float nextA =lA +random(9);
    float nextB =lB +random(7);
    line(lA,lB,lA +10,lB +10);
    lB=nextB;
    lA=nextA;
  }

 
}


