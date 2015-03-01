
size(400, 400);
background(#0062AF);
colorMode(RGB,255,255,255,798-500);

for(int Ypoint = 0; Ypoint < height; Ypoint ++)
{
  for(int Xpoint = 0; Xpoint < width; Xpoint ++)
   {
     stroke(0, 6, 250, Ypoint-Xpoint);
     point(Ypoint, Xpoint);
   }
}

for(int Ypoint = 0; Ypoint < height; Ypoint ++)
{
  for(int Xpoint = 0; Xpoint < width; Xpoint ++)
   {
     stroke(255,230,0, Xpoint-Ypoint);
     point(Ypoint, Xpoint);
   }
}

colorMode(HSB, 360, 100, 100, 100);
noStroke();

for (int i=0; i < 20; i++)
{
  int Xpos = int(random(0, 400));
  int Ypos = int(random(0, 400));
  int Xrec = int(random(0, 400));
  int Yrec = int(random(0, 400));
  int c = int(random(0, 360));
  int d = 0;
  int f = int(random(0,800));
  int sizerec =  int(random(10, 80));
  int size =  int(random(40, 100));
  int size2 = int(size/5);

if(c <= 180)
  {
    d= int(random(10,50));
  }
    else
  {
    d= int(random(50,100));
  }
  
  fill(c, d, 100, 10);
if(f <=400)
  {
  for (int ia=0; ia<16; ia++) {
    ellipse(Xpos, Ypos, size, size);
    size = size  - 10;
    }
  }
  else
  {
  for (int ia=0; ia<20; ia++) {
    rect(Xrec, Yrec, sizerec, sizerec);
    sizerec = sizerec  - 10;
    }
  }
}  


