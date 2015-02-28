
//global variables
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
int maxY=200;// the value where each vertex of the curve will reach
int vertx [] = //current vertex curve
{sx,sy,ax,ay,bx,by,cx,cy,dx,dy,ex,ey,fx,fy,gx,gy,hx,hy,
ix,iy,jx,jy,kx,ky,lx,ly,mx,my,nx,ny,ox,oy,px,py,qx,qy,rx,ry,};
int vertxOrig [] = //original vertex curve
{sx,sy, ax,ay,bx,by,cx,cy,dx,dy,ex,ey,fx,fy,gx,gy,hx,hy,
ix,iy,jx,jy,kx,ky,lx,ly,mx,my,nx,ny,ox,oy,px,py,qx,qy,rx,ry};
int vertxMax [] = //original vertex curve
{sx,sy,ax,ay,bx,by,cx,cy,dx,dy,ex,ey,fx,fy,gx,maxY,hx,maxY,
ix,maxY,jx,maxY,kx,maxY,lx,maxY,mx,maxY,nx,maxY,ox,maxY,px,maxY,qx,qy,rx,ry};
int mCx;// variable to store mouseX value when mouse clicked
float easingVirus= 0.3;
float easingUp= 0.01;
float easingDown= 0.05;
float offset;// to store the value of the dist between mCx and the vertexs
void setup()
{
size(600,250);
frameRate(15);// to make it slower
}
void draw()
{
background (255); // to have a new draw every frame
noStroke ();
smooth ();
//CURVE 3
pushMatrix ();
translate (150,85);
scale (0.5);
fill (9,20,40,20);
kurve ();
popMatrix ();
//CURVE 2
pushMatrix ();
translate (105,60);
scale (0.65);
fill (9,20,40,20);
kurve ();
popMatrix ();
//CURVE 1
pushMatrix ();
translate (75,45);
scale (0.75);
fill (9,20,40,20);
kurve ();
popMatrix ();
//CURVE thickness
pushMatrix ();
translate (11,8);
scale (0.95);
fill (9,20,40,20);
kurve ();
popMatrix ();
//CURVE 0
fill (51,102,255,120);
kurve ();// curve shape created as a function to be able to repeat it
if(vir)
{
  star(x-12, 195, 15, 10, 20); 
}
 for (i=14; i<=28; i+=2) // it's going out of the chart because of the i+=2 
  {
    float offset = dist (vertx[i],0,mCx,0); 
    //distance between the mouse click and the vertex in x
   if (offset <=30) // to see which point will move
     {
      vertx [i+1] += (vertxMax[i+1] - vertx[i+1])* easingDown;
      // to move the vertex in y slowly
      x += (vertx[i] -x)*easingVirus;
      star(x-12, 195, 15, 10, 20); //virus in star shape
      }
   else
     {
      vertx [i+1] -= (vertx [i+1] - vertxOrig [i+1])* easingUp;
     }
  } 
}
void mouseClicked ()
{
if (mouseX >= 60 && mouseX <= 550 && mouseY>=70 && mouseY <= 230)
 {
     mCx =mouseX;
     vir=false;
 }
}
void kurve()// this si the first step but I created a function to write less lines in the code
{
beginShape ();
curveVertex (vertx[0],vertx[1]);//beginning vertex
// now for loop to get the in between vertex
  for (i=0; i< vertx.length; i+=2)
    {
    curveVertex (vertx[i],vertx[i+1]);
    //ellipse (vertx[i],vertx[i+1],2,2);//to help me visualize
    }
  curveVertex (vertx[0],vertx[1]); // end of the shape
curveVertex (vertx[0],vertx[1]); //end vertex
endShape ();
}
void star(float x, float y, float radius1, float radius2, int npoints) 
{
  fill (255,255,255);
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) 
  {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
