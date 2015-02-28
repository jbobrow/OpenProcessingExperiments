
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/79890*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage b;
PImage[] monkey = new PImage[8];
int f=0; //monkey frame
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
   background(50);
   frameRate(20);
   //frameRate(60);
   b = loadImage("jungle.jpg");
   monkey[0] = loadImage("monkey01.gif");
   monkey[1] = loadImage("monkey02.gif");
   monkey[2] = loadImage("monkey03.gif");
   monkey[3] = loadImage("monkey04.gif");
   monkey[4] = loadImage("monkey05.gif");
   monkey[5] = loadImage("monkey06.gif");
   monkey[6] = loadImage("monkey07.gif");
   monkey[7] = loadImage("monkey08.gif");
}

void mouseClicked() {
  s = 60;
  image(monkey[f], mPosX-monkey[f].width/2, mPosY-monkey[f].height/2);
}

void draw() 
{
  image(b,0,0);
  image(monkey[f],mPosX-monkey[f].width/2,mPosY-monkey[f].height/2);
  
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







