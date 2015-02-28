
float rho = 28, sigma = 10, beta = 8.0/3.0, f = 10;
int N=15, t=0;
float cx,cy;
Lorenz[] lorenzes;
 
void setup(){
size(600,600,P3D);
cx = width/2;
cy = height/2;
noStroke();
lorenzes = new Lorenz[N];
for (int i=0;i<N;lorenzes[i++] = new Lorenz(random(-60,60),random(-30,30),1 + random(5)));

}
 
void draw(){
 background(0);
  for (int i=0; i<N; lorenzes[i++].move());
}
 
class Lorenz
{
  float x,y,z,xdot,ydot,zdot,dt=.01;
  Lorenz(float x_, float y_, float z_)
  {
    x = x_; y = y_; z = z_;
  }
  void move()
  {
    xdot = (sigma*(y-x));
    ydot = ((x * (rho - z)) - y);
    zdot = ((x*y) - (beta*z));
    x = x + xdot*dt; y = y + ydot*dt; z = z + zdot*dt;
      ellipse(f*x+cx,f*y+cy,z,z);
    }
  
}
