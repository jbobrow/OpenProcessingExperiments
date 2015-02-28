
//Working on importing corn pics and writing story
//WORKING ON SHOOTING- DISREGARD ABOVE

float x;
float y;
float level;
float cash;
float harvest;
float corncountdown;
float bulletx, bullety, bullettime, bulletdirection;
float storypart;
boolean leftkey, rightkey, upkey, downkey, enterkey, rightjustreleased, leftjustreleased, shot, canshoot, reachedborder;

PImage p1, p2, p3, p4, p5, p6;
PImage pt1,pt2,pt3,pt4,pt5,pt6;
PImage bt1,bt2;
PImage Cropstage3,Cropstage2,Cropstage1;
PImage bg1;
PImage bg3;
float stride;

corn[] c;
//britishsoldier[] bts;

void setup()
{
  size (640, 480);
  x=y=stride=0;
  leftkey = false;
  rightkey = false;
  upkey = false;
  downkey = false;

  c = new corn [15];
  for (int f=0; f<15; f++) {
    for (int i=0; i<5; i++) {
      c[i]=new corn();
      c[i].x = i*100+125;
      c[i].y = 75;
      //c[i].stage= random(0, 3);
      c[i].stage = random (0, 3);
    }

    for (int i=5; i<10; i++) {
      c[i]=new corn();
      c[i].x = (i-5)*100+125;
      c[i].y = 225;
      c[i].stage = random(0, 3);
    }

    for (int i=10; i<15; i++) {
      c[i]=new corn();
      c[i].x = (i-10)*100+125;
      c[i].y = 375;
      c[i].stage= random(0, 3);
    }
  }
  
  //bts=new britishsoldier [15];

  reachedborder=false;
  
  corncountdown = 3;
  harvest = 0;

  bulletx=width/2;
  bullety=height/2;
  canshoot=true;

  storypart=1;
  level = 1;

  p1 = loadImage ("fwalk1.gif");
  p2 = loadImage ("fwalk2.gif");
  p3 = loadImage ("fwalk3.gif");
  p4 = loadImage ("fwalk4.gif");
  p5 = loadImage ("farmerstanding.png");
  p6 = loadImage ("farmerstanding1.png");
  Cropstage1 = loadImage("cropstage1.gif"); 
  Cropstage2 = loadImage("cropstage2.gif");
  Cropstage3 = loadImage("cropstage3.gif");
  pt1 = loadImage ("patwalk1.gif");
  pt2 = loadImage ("patwalk2.gif");
  pt3 = loadImage ("patwalk3.gif");
  pt4 = loadImage ("patwalk4.gif");
  pt5 = loadImage ("patstand.gif");
  pt6 = loadImage ("patstand1.gif");
  
  /*bt1= loadImage ("bts1.gif");
  bt2= loadImage ("bts2.gif");*/
  
  bg1 = loadImage ("bostonneighborhood.png");
  bg3 = loadImage ("battlefield101.png");
}

void draw()
{
  background(0);

  if (level==1) outside();
  else if (level==2) farmerhouse();
  else if (level==2.5) farminginstructions();
  else if (level==3) farming();
  else if (level==4) shooting();
  else if (level==5) townsquare();
}



