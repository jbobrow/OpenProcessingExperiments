
//import gifAnimation.*;

//GifMaker gifExport;

int   pnts = 420;
int   squs = 21;
int   pips = 20;
float[][][] vx = new float[squs][pips][pips];
float[][][] vy = new float[squs][pips][pips];
float[][][] vz = new float[squs][pips][pips];
color[]     cc = new color[7];

//  [Box][Vert][Horiz]

float R = 300;
float r = 100;
//float R = 600;
//float r = 200;

float gap = TWO_PI/pnts;
float shift = gap;  
  
int doevery = 4;
int lines = pips/doevery;
int spots = pips/doevery;

/*
colours:
255 255 255 white
255 255 127 pale yellow
255 255   0 yellow
255 127 255 lt mauve
255 127 127 lt peach
255 127   0 dk peach
255   0 255 mauve
255   0 127 cerise
255   0   0 red
127 255 255 pale blue
127 255 127 pale green
127 255   0 lt green
127 127 255 blue
127 127 127 grey
127 127   0 mud green
127   0 255 purple
127   0 127 dk purple
127   0   0 dk brown
  0 255 255 sky blue
  0 255 127 mid green
  0 255   0 green
  0 127 255 dk blue
  0 127 127 mud blue
  0 127   0 dk green
  0   0 255 hard blue
  0   0 127 mud blue
  0   0   0 black
*/
  
PFont myFont;


void setup(){
size(600, 600, P3D);
//size(800, 800, P3D);
cc[0] = color(255,255,  0);
cc[1] = color(255,127,255);
cc[2] = color(255,  0,  0);
cc[3] = color(127,255,255);
cc[4] = color(  0,255,  0);
cc[5] = color(127,  0,255);
cc[6] = color(127,127,127);

//for (int c=0;c<7;c++)
//  cc[c] = color(random(255),random(255),random(255));
frameRate(30);

//String[] fontList = PFont.list();
//println(fontList);
myFont = createFont("Lucida Sans Typewriter Bold", 100);
textFont(myFont);
textAlign(CENTER, CENTER);
//text("!@#$%", width/2, height/2);
//gifExport = new GifMaker(this, "export.gif");
//gifExport.setRepeat(0); // make it an "endless" animation
}

void draw(){
float sh = shift*frameCount;
for (int s=0;s<squs;s++)
  {
  int P = (20*s)%pnts;
  int Q = (80*s)%pnts;
  for (int v=0;v<pips;v++)
    {
    for (int h=0;h<pips;h++)
      {
      int A = (P + 5*h +v)%pnts;
      int B = (Q + 4*v -h)%pnts;
      vx[s][v][h] = (R + r*cos(B*gap + sh))*sin(A*gap);
      vy[s][v][h] = -r*sin(B*gap + sh);
      vz[s][v][h] = (R + r*cos(B*gap + sh))*cos(A*gap);
      }
    }
  }
background(0);
//lights();
ambientLight(125, 125, 125);
directionalLight(255, 255, 255, 1, 0, 0);
//lightSpecular(10, 10, 10);
pointLight(255, 255, 255, 500, 0, 0);

//stroke(255);
//fill(255,0,0);
//text(frameCount, 200, height -50,0);
noFill();
translate(width/2, height/2,-300);
rotateY(frameCount*PI/840);
rotateX(frameCount*PI/840);
//translate(width/2, height/2,-1200);
//rotateY(frameCount*PI/1000);
//rotateX(frameCount*PI/1300);


stroke(208);
//stroke(255,0,0);
for (int l=0;l<lines;l++)
  {
  int H = doevery*l;
  beginShape();
  for (int b=0;b<squs;b++)
    {
    int S = b;
    for (int p=0;p<spots;p++)
      {
      int V = doevery*p;
      vertex(vx[S][V][H], vy[S][V][H], vz[S][V][H]);
      }
    }
  endShape(CLOSE);
  }


//stroke(255,255,255);
for (int l=0;l<lines;l++)
  {
  int V = doevery*l;
  beginShape();
  for (int b=0;b<squs;b++)
    {
    int S = (b*5)%squs;
    for (int p=0;p<spots;p++)
      {
      int H = doevery*p;
      vertex(vx[S][V][H], vy[S][V][H], vz[S][V][H]);
      }
    }
  endShape(CLOSE);
  }

//stroke(0,255,0);
for (int l=0;l<lines;l++)
  {
  beginShape();
  for (int b=0;b<squs;b++)
    {
    int S = (b*4)%squs;
    for (int p=0;p<spots;p++)
      {
      int V = ((l-p)*doevery + pips)%pips;
      if (V==(pips-doevery)) S = (S-1+squs)%squs;
      int H = doevery*p;
      vertex(vx[S][V][H], vy[S][V][H], vz[S][V][H]);
      }
    }
  endShape(CLOSE);
  }

noStroke();
for (int k=0;k<7;k++)
  {
  fill(cc[k]);
  int s0, s1;
  s0 = (6*k)%squs;
  FillBL(s0);
  FillTR(s0);
  s1 = (s0+4)%squs;
  FillBL(s1);
  FillTR(s1);
  s1 = (s0+5)%squs;
  FillBL(s1);
  s1 = (s0-1+squs)%squs;
  FillTR(s1);
  }
/*  
for (int s=0;s<squs;s++)
  {
  fill(cc[s%7]);
  FillBL(s);
  }

for (int s=0;s<squs;s++)
  {
  fill(cc[s%7]);
  FillTR(s);
  }
*/
//saveFrame();
//gifExport.setDelay(1);
//gifExport.addFrame();

//if (frameCount==1680)
//  {
//  gifExport.finish();
//  noLoop();
//  }
//fill(255,0,0);
//text(frameCount, 0, 0, 800);
}

//----------------------------------------
//  filling the bottom left of a big square
//----------------------------------------
void FillBL(int s)
{
  //  bottom left triangles
  for (int h=0;h<spots;h++)
    {
    for (int v=0;v<(spots-h);v++)
      {    
      beginShape();
      DoBL(s, h, v);
      DoTL(s, h, v);
      DoBR(s, h, v);
      endShape(CLOSE);
      }
    }
  //  top right triangles
  for (int h=0;h<spots-1;h++)
    {
    for (int v=0;v<(spots-h-1);v++)
      {    
      beginShape();
      DoTR(s, h, v);
      DoBR(s, h, v);
      DoTL(s, h, v);
      endShape(CLOSE);
      }
    }
}
//----------------------------------------
//  filling the top right of a big square
//----------------------------------------
void FillTR(int s)
{
  //  bottom left triangles
  for (int h=1;h<spots;h++)
    {
    for (int v=(spots-h);v<spots;v++)
      {    
      beginShape();
      DoBL(s, h, v);
      DoTL(s, h, v);
      DoBR(s, h, v);
      endShape(CLOSE);
      }
    }
  //  top right triangles
  for (int h=0;h<spots;h++)
    {
    for (int v=(spots-h-1);v<spots;v++)
      {    
      beginShape();
      DoTR(s, h, v);
      DoBR(s, h, v);
      DoTL(s, h, v);
      endShape(CLOSE);
      }
    }
}
//----------------------------------------
void DoBL(int s, int h, int v)
{
int S = s;
int H = h*doevery;
int V = v*doevery;
vertex(vx[S][V][H], vy[S][V][H], vz[S][V][H]);
}
//----------------------------------------
void DoTL(int s, int h, int v)
{
int S = s;
int H = h*doevery;
int V = (v+1)*doevery;
if (V==pips)
  {
  V = 0;
  S = (S+1)%squs;
  }
vertex(vx[S][V][H], vy[S][V][H], vz[S][V][H]);
}
//----------------------------------------
void DoBR(int s, int h, int v)
{
int S = s;
int H = (h+1)*doevery;
if (H==pips)
  {
  H = 0;
  S = (S+5)%squs;
  }
int V = v*doevery;
vertex(vx[S][V][H], vy[S][V][H], vz[S][V][H]);
}
//----------------------------------------
void DoTR(int s, int h, int v)
{
int S = s;
int H = (h+1)*doevery;
if (H==pips)
  {
  H = 0;
  S = (S+5)%squs;
  }
int V = (v+1)*doevery;
if (V==pips)
  {
  V = 0;
  S = (S+1)%squs;
  }
vertex(vx[S][V][H], vy[S][V][H], vz[S][V][H]);
}



