
int i;
int x=100;
boolean vir = true;
int sx = 300;
int sy = 230;
int ax = 390;
int ay = 230;
int bx = 210;
int by = 230;
int cx = 110;
int cy = 230;
int dx = 50;
int dy = 210;
int ex = 30;
int ey = 150;
int fx = 38;
int fy = 90;
int gx = 90;
int gy = 70;
int hx = 150;
int hy = 70;
int ix = 210;
int iy = 75;
int jx = 270;
int jy = 75;
int kx = 330;
int ky = 70;
int lx = 390;
int ly = 65;
int mx = 450;
int my = 60;
int nx = 520;
int ny = 65;
int ox = 575;
int oy = 100;
int px = 570;
int py = 180;
int qx = 540;
int qy = 220;
int rx = 490;
int ry = 230;
int maxY=200;
int vertx [] = {sx,sy,ax,ay,bx,by,cx,cy,dx,dy,ex,ey,fx,fy,gx,gy,hx,hy,
ix,iy,jx,jy,kx,ky,lx,ly,mx,my,nx,ny,ox,oy,px,py,qx,qy,rx,ry,};
int vertxOrig [] = {sx,sy, ax,ay,bx,by,cx,cy,dx,dy,ex,ey,fx,fy,gx,gy,hx,hy,
ix,iy,jx,jy,kx,ky,lx,ly,mx,my,nx,ny,ox,oy,px,py,qx,qy,rx,ry};
int vertxMax [] = {sx,sy,ax,ay,bx,by,cx,cy,dx,dy,ex,ey,fx,fy,gx,maxY,hx,maxY,
ix,maxY,jx,maxY,kx,maxY,lx,maxY,mx,maxY,nx,maxY,ox,maxY,px,maxY,qx,qy,rx,ry};
int mCx;
float easingVirus= 0.3;
float easingUp= 0.01;
float easingDown= 0.05;
float offset;
void setup()
{size(600,250);
frameRate(15);}
void draw()
{background (255);
noStroke ();
smooth ();
pushMatrix ();
translate (150,85);
scale (0.5);
fill (9,20,40,20);
kurve ();
popMatrix ();
pushMatrix ();
translate (105,60);
scale (0.65);
fill (9,20,40,20);
kurve ();
popMatrix ();
pushMatrix ();
translate (75,45);
scale (0.75);
fill (9,20,40,20);
kurve ();
popMatrix ();
pushMatrix ();
translate (11,8);
scale (0.95);
fill (9,20,40,20);
kurve ();
popMatrix ();
fill (51,102,255,120);
kurve ();
if(vir)
{  star(x-12, 195, 15, 10, 20); }
for (i=14; i<=28; i+=2) 
  {float offset = dist (vertx[i],0,mCx,0); 
    if (offset <=30) {vertx [i+1] += (vertxMax[i+1] - vertx[i+1])* easingDown;
     x += (vertx[i] -x)*easingVirus;
      star(x-12, 195, 15, 10, 20);}
   else
     {vertx [i+1] -= (vertx [i+1] - vertxOrig [i+1])* easingUp;}  } }
void mouseClicked ()
{if (mouseX >= 60 && mouseX <= 550 && mouseY>=70 && mouseY <= 230)
 { mCx =mouseX;
     vir=false; }}
void kurve(){
beginShape ();
curveVertex (vertx[0],vertx[1]);
  for (i=0; i< vertx.length; i+=2)
    {curveVertex (vertx[i],vertx[i+1]); }
  curveVertex (vertx[0],vertx[1]);
curveVertex (vertx[0],vertx[1]);
endShape ();}
void star(float x, float y, float radius1, float radius2, int npoints) 
{  fill (255,255,255);
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) 
  {    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
