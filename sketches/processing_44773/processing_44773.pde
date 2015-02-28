
//Extra Credit 3
//Copyright Kristen McConnell, November 2011, Pittsburgh, PA 15232

int MAX = 6;
float [] x,y,w,h,dx,dy;
color [] col;

void setup()
{
   size(200,400,P3D);
   background(0,150,50);
   x = new float [MAX];
   initializeArray(x,0,width-20);
   y = new float [MAX];
   initializeArray(y,0,height-10);
   w = new float[MAX];
   initializeArray(w,1,40);
   h = new float [MAX];
   initializeArray(h,1,25);
   dx = new float [MAX];
   initializeArray(dx,.1,15);
   dy = new float [MAX];
   initializeArray(dy,.1,15);
   col = new color[MAX];
   initializeColorArray();
}

void draw()
{
   move();
   rects();
}

void initializeColorArray()
{
 for(int i = 0;i < col.length;i++ )
 {
   col[i] = color(0, random(255), random(255));
 }
}

void initializeArray(float[]array, float small, float large)
{
 for(int i = 0 ;i < array.length ;i++ )
 {
   array[i] = int(random(small, large));
 }
}

void move()
{
   for(int i = 0;i < MAX;i++ )
   {
     x[i] = x[i] + dx[i];
     y[i] = y[i] + dy[i];
     if(x[i] > width-w[i]/2 || x[i] < -w[i]/2)
     {
       dx[i] = dx[i]*-1;
     }
     if(y[i] >height-h[i]/2 || y[i] < -h[i]/2)
     {
       dy[i] = dy[i]*-1;
     }
   }
}

void rects()
{
   for(int i = 0;i < MAX;i++ )
   {
     fill(col[i]);
     rect (x[i],y[i],w[i],h[i]);
   }
}

