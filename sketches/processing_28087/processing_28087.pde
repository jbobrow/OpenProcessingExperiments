
import ddf.minim.*;

Minim minim;
AudioPlayer song1red;
AudioPlayer song2red;
AudioPlayer song3red;
AudioPlayer song4red;

AudioPlayer song1blue;
AudioPlayer song2blue;
AudioPlayer song3blue;
int d=1;
int v = 3;
int dir = 1;

int a=1;
int v2 =5;
int dir2=1;

int b=1;
int v3=8;
int dir3=1;

int c=1;
int v4=3;
int dir4=1;

int e=1;
int v5=5;
int dir5=1;

int f=1;
int v6=1;
int dir6=1;


int dx = 150;
int dy = 150;

int ax = 400;
int ay = 400;

int bx = 200;
int by = 700;

int cx = 600;
int cy = 700;

int ex = 800;
int ey = 200;
float distanceX;
float distanceY;

void setup()
{
  size(800,800);
  background(0,0,0,80);
  noStroke();
  smooth();
  minim = new Minim(this);
 song1red = minim.loadFile("Temple_Bell.mp3");
  song2red = minim.loadFile("Temple_Bell.mp3");
  song3red = minim.loadFile("Temple_Bell.mp3");
  song4red = minim.loadFile("Temple_Bell.mp3");
  song1blue = minim.loadFile("Temple_Bell.mp3");
  song2blue = minim.loadFile("Temple_Bell.mp3");
    song3blue = minim.loadFile("Temple_Bell.mp3");

  
}

void draw() 
{
  background(0,0,0,80);
  fill(258,47,158,80);


  /////////////////RED ellipse/////////////////////////////
  if (mousePressed ==true) {
    if (mouseButton== LEFT) {
      if (abs(mouseX-dx) < d/2) {
        if (abs(mouseY-dy) < d/2) {
          dx=mouseX;
          dy=mouseY;
        }
      }
    }
  }
  ellipse (dx, dy, d, d);

  d= d+(v*dir);
  if(d >= 300)
  {
    dir = -1;
  }
  if(d <= 0)
  {
    dir = 1;
  }
  ///////////////BLUE ellipse//////////////////////////////

  fill(25,14,80,80);
  if (mousePressed ==true) {
    if (mouseButton== LEFT) {
      if (abs(mouseX-ax) < a/2) {
        if (abs(mouseY-ay) < a/2) {
          ax=mouseX;
          ay=mouseY;
        }
      }
    }
  }

  ellipse(ax,ay,a,a);
  a=a+(v2*dir2);
  if(a>=300)
  {
    dir2 = -1;
  }
  if (a <= 0)
  {
    dir2 = 1;
  }

//////////////BROWN elliipse/////////////////////
  fill(217,158,68,80);
 if (mousePressed ==true) {
    if (mouseButton== LEFT) {
      if (abs(mouseX-bx) < b/2) {
        if (abs(mouseY-by) < b/2) {
          bx=mouseX;
          by=mouseY;
        }
      }
    }
  }

  ellipse(bx,by,b,b);
  b=b+(v3*dir3);
  if(b>=600)
  {
    dir3 = -1;
  }
  if(b<=0)
  {
    dir3 = 1;
  }

///////////////GREEN ellipse//////////////////////
  fill(88,222,102,80);
   if (mousePressed ==true) {
    if (mouseButton== LEFT) {
      if (abs(mouseX-cx) < c/2) {
        if (abs(mouseY-cy) < c/2) {
          cx=mouseX;
          cy=mouseY;
                  }
      }
    }
  }
  ellipse(cx,cy,c,c);
  c=c+(v4*dir4);
  if(c>=250)
  {
    dir4 = -1;
  }
  if(c<=0)
  {
    dir4 = 1;
  }

//////////////////////////////////
  fill(108,255,250,80);
    if (mousePressed ==true) {
    if (mouseButton== LEFT) {
      if (abs(mouseX-ex) < e/2) {
        if (abs(mouseY-ey) < e/2) {
          ex=mouseX;
          ey=mouseY;
                  }
      }
    }
  }
  ellipse(ex,ey,e,e);
  e=e+(v5*dir5);
  if(e>=380)
  {
    dir5 = -1;
  }
  if(e<=0)
  {
    dir5 = 1;
  }
  /////////////sound made RED-BLUE//////////////

  if (dist(dx,dy,ax,ay)<abs(a)/2+abs(d)/2)
 {
    song1red.play();
   println("dist = " + str(dist(150,150,400,400)) + ", rad = " + str(abs(a)+abs(d)));
  }
 if(dist (dx,dy,ax,ay)>abs(a)/2+abs(d)/2)
  {
   song1red.loop(0);
 }
 ///////////////////sound made RED-BROWN/////////////////////////
 
   if (dist(dx,dy,bx,by)<abs(b)/2+abs(d)/2)
 {
    song2red.play();
   println("dist = " + str(dist(150,150,400,400)) + ", rad = " + str(abs(a)+abs(d)));
  }
 if(dist (dx,dy,bx,by)>abs(b)/2+abs(d)/2)
  {
   song2red.loop(0);
 }
 
 ///////////////sound made RED-GREEN///////////////////
    if (dist(dx,dy,cx,cy)<abs(c)/2+abs(d)/2)
 {
    song3red.play();
   println("dist = " + str(dist(150,150,400,400)) + ", rad = " + str(abs(a)+abs(d)));
  }
 if(dist (dx,dy,cx,cy)>abs(c)/2+abs(d)/2)
  {
   song3red.loop(0);
 }
 ///////////////////sound made RED-LIGHT BLUE//////////////
 
     if (dist(dx,dy,ex,ey)<abs(e)/2+abs(d)/2)
 {
    song4red.play();
   println("dist = " + str(dist(150,150,400,400)) + ", rad = " + str(abs(a)+abs(d)));
  }
 if(dist (dx,dy,ex,ey)>abs(e)/2+abs(d)/2)
  {
   song4red.loop(0);
 }

////////////////sound made BLUE-LIGHT BLUE////////////////
     if (dist(ax,ay,ex,ey)<abs(e)/2+abs(a)/2)
 {
    song1blue.play();
   println("dist = " + str(dist(150,150,400,400)) + ", rad = " + str(abs(a)+abs(d)));
  }
 if(dist (ax,ay,ex,ey)>abs(e)/2+abs(a)/2)
  {
   song1blue.loop(0);
 }
 ///////////////////sound made BLUE-GREEN/////////////////////////
      if (dist(ax,ay,cx,cy)<abs(c)/2+abs(a)/2)
 {
    song2blue.play();
   println("dist = " + str(dist(150,150,400,400)) + ", rad = " + str(abs(a)+abs(d)));
  }
 if(dist (ax,ay,cx,cy)>abs(c)/2+abs(a)/2)
  {
   song2blue.loop(0);
 }
//////////////////////sound made BLUE-BROWN////////////////////////////////
      if (dist(ax,ay,bx,by)<abs(b)/2+abs(a)/2)
 {
    song3blue.play();
   println("dist = " + str(dist(150,150,400,400)) + ", rad = " + str(abs(a)+abs(d)));
  }
 if(dist (ax,ay,bx,by)>abs(b)/2+abs(a)/2)
  {
   song3blue.loop(0);
 }
 
}

//void stop()
//{
//  song1.close();
//  song2.close();
//  minim.stop();
//  super.stop();
//}




