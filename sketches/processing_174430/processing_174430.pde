
//Henon phase strange attractor
//Ale González, Public Domain, 2013

parent.document.getElementById("appletAjaxContainer").setAttribute("style", "border: 1px dashed #ccc;");

int N = 3000, e = 30, cx, cy; 
float A, C, S, f;
Henon[] henons; 

size(600, 600);  
stroke(0x20000000);
cx = width/2;
cy = height/2;
f  = 200;

reset(); 


void reset()
{
  A = random(TWO_PI); 
  C = cos(A); 
  S = sin(A);
  float a = 1./N;
  henons = new Henon[N]; 
  for (int i = 0; i < N; henons[i++] = new Henon(i*a, noise(i*.05))); 
  background(-1); 
}

void draw() 
{
  for (int i = 0; i < N; henons[i++].go_henons_go()); 
}

void mouseClicked() { reset(); }


class Henon 
{
   float x, y, k, X, Y;
   
   Henon(float x_, float y_)
   {
     x = x_; y = y_;
   }
   
   void go_henons_go() 
   {
     k = y - x*x;
     y = (x * S) + (k * C);
     x = (x * C) - (k * S); 
     X = cx + f*x;
     Y = cy + f*y;
     if (X > 0 && X < width && Y > 0 && Y < height)  point(X,Y); 
   }  
}
