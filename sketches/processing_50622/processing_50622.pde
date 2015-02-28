
//ninja star by gen may-montt
//with help from the other keith peters
//and reference from processing.org



int starx;
int stary;
int sdirx;
int sdiry;

int starx2;
int stary2;
int sdirx2;
int sdiry2;

int starx3;
int stary3;
int sdirx3;
int sdiry3;

int ballx;
int bally;
int bdirx;
int bdiry;

int bspeedx;
int bspeedy;
int sspeedx;
int sspeedy;

int sspeedx2;
int sspeedy2;

int sspeedx3;
int sspeedy3;

int ballw;

void setup()
{
size (800,800);
starx=-1200;
stary=-800;
sdirx=1;
sdiry=1;

starx2=100;
stary2=100;
sdirx2=2;
sdiry2=2;

starx3=-700;
stary3=-700;
sdirx3=2;
sdiry3=2;

ballx = 0;
bally = 400;
bdirx = 1;
bdiry = 1;

bspeedx = 6;
bspeedy =5;
sspeedx =12;
sspeedy =8;

sspeedx2 =6;
sspeedy2 =6;

sspeedx3 =6;
sspeedy3 =7;

ballw=100;



}

void draw()
{
  background (255);
  smooth();
  ninja(starx,stary);
  ninja(starx2,stary2);
  ninja(starx3,stary3);



//ninja star//////////////////
starx += sspeedx*sdirx;
stary += sspeedy*sdiry;

if (starx>750){
    sdiry=0;
    sdirx=0;
  }

//ninja star 2////////////////////
starx2 += sspeedx2*sdirx2;
stary2 += sspeedy2*sdiry2;

if (stary2>750){
    sdiry2=0;
    sdirx2=0;
  }
  
if (starx2>750){
    sdiry2=0;
    sdirx2=0;
  }
//ninja star 3//////////////////////

starx3 += sspeedx3*sdirx3;
stary3 += sspeedy3*sdiry3;

if (stary3>750){
    sdiry3=0;
    sdirx3=0;
  }
  
if (starx3>750){
    sdiry3=0;
    sdirx3=0;
  }

//ball////////////////////////////
ballx += bspeedx*bdirx;//x=x+directionx;
bally += bspeedy*bdiry; //this is the y motion


  if (bally>750){
      bdiry = -1;
  }
  
  if (bally<50) {
      bdiry =1;
  }
  
  if (ballx>750) {
    bdirx = -1;
  }
  if (ballx<50) {
    bdirx = 1;
  }
  fill(255,0,0);
  ellipse (ballx,bally,ballw,100);
  
  if (dist (ballx, bally, starx, stary)<80){
      bdirx=sdirx;
      bdiry=sdiry;
      bspeedx=sspeedx;
      bspeedy=sspeedy;
      ballw=ballw-1;
      }
   
  if (ballw<70){
     ballw=70;
     fill(0);
     text("Click to Restart",350,400);
     }
      
 
  
  println (dist (ballx, bally, starx, stary));
}

void mousePressed() {
  if (mouseButton == LEFT) {
    setup();
  } else if (mouseButton == RIGHT) {
    setup();
  }
}



//this is the part keith helped me with...

void ninja (int x,int y)
{
  fill(0);
  rect (x-20,y-20,40,40);
  triangle (x-20,y-20,x,y-80,x+20,y-20);
  triangle (x+20,y-20,x+80,y,x+20,y+20);
  triangle (x-20,y+20,x,y+80,x+20,y+20);
  triangle (x-20,y+20,x-80,y,x-20,y-20);

  fill (255);
  noStroke();
  ellipse (x-20,y-20,20,20);
  ellipse (x-20,y+20,20,20);
  ellipse (x+20,y+20,20,20);
  ellipse (x+20,y-20,20,20);
  ellipse (x,y,20,20);
}



