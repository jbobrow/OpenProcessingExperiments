
float rho = .10, sigma = .29, beta = 8.0/3.0, scale=.001;
int N=100000, t=0;
Lorenz[] lorenzes;

void setup(){
size(1000,1000,P3D);
float a = 1./N;
lorenzes = new Lorenz[N];
for (int i=0;i<N;lorenzes[i++] = new Lorenz(random(-200,200),random(-300,300),1 + random(10)));
//translate(-1200,-700);
}

void draw(){
  // translate(width/2,height/2);
  for (int i=0; i<N; lorenzes[i++].move());
  //{  print (lorenzes[i].x + " y: " + lorenzes[i].y + " z: " + lorenzes[i].z + " x: ");
  //} 
}

class Lorenz
{
  float x,y,z,xdot,ydot,zdot;
  Lorenz(float x_, float y_, float z_)
  {
    x = x_; y = y_; z = z_;
  }
  void move()
  {
    xdot = (sigma*(y-x));
    ydot = ((x * (rho - z)) - y);
    zdot = ((x*y) - (beta*z));
    x = x + xdot; y = y + ydot; z = z + zdot;
    if (x > 0 && x < width && y > 0 && y < height){
      ellipse(x,y,z/10,z/10); 
    }
  }
}
