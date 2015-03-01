

PImage b;
PImage[] p = new PImage[8];
int f=0; //p frame
int mPosX=100;
int mPosY=550;
int countdown=0;
int count=0;
char lastKey;
int s = 0;

void setup() 
{
  print(key);
   size(1280,720);
   smooth();
   noStroke();
   background(50) ;
   frameRate(20);
   //frameRate(60);
   b = loadImage("b.jpg");
   p[0] = loadImage("p1.png");
   p[1] = loadImage("p3.png");
   p[2] = loadImage("p4.png");
   p[3] = loadImage("p5.png");
   p[4] = loadImage("p6.png");
   p[5] = loadImage("p7.png");
   p[6] = loadImage("p8.png");
   p[7] = loadImage("p9.png");
}

void mouseClicked() {
  s = 60;
  image(p[f], mPosX-p[f].width/2, mPosY-p[f].height/2);
}

void draw() 
{
  image(b,0,0);
  image(p[f],mPosX-p[f].width/2,mPosY-p[f].height/2);
  
  if(f==7) {f=0;}
  
  if (countdown == 0) {count = 0;}
  if (count == 1) { countdown--; }

  
  
  if (keyPressed == true)
  {
    f++;
    if (key == 'd' || key == 'D'){
      if (mPosX<1205)
        { mPosX=mPosX+15+s; } 
    }
    
    if (key == 'a' || key == 'A'){
      if (mPosX>80)
        { mPosX=mPosX-15-s; }
    }
  }
  if (s>0) { s=0;}
}








