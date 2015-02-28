
float rho = 30, sigma = 10, beta = 8.0/3.0, f = 10;
int N=50, t=0;
float cx,cy,cz, rx=0, ry=0,rf=100;
Lorenz[] lorenzes;
 
void setup(){
size(1000,1000,P3D);
cx = width/2;
cy = height/2;
noStroke();
lorenzes = new Lorenz[N];
for (int i=0;i<N;lorenzes[i++] = new Lorenz(1,1,1 + random(1)));

}
 
void draw(){
 //translate(100,100,200);
 background(0);
 translate(cx,cy);
  for (int i=0; i<N; i++){
   lorenzes[i].move();
   lorenzes[i].spin();
   lorenzes[i].blit(); 
  }
}

void mousePressed(){
  rx=radians(mouseX+cx);
  ry=radians(mouseY+cy);
}

void mouseDragged(){
  rx=radians(mouseX+cx);
  ry=radians(mouseY+cy);
}
 
class Lorenz
{
  float x,y,z,xdot,ydot,zdot,dt=.01,blitX,blitY,blitZ;
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
 //   print(" x: " + x + " ");//y: " + y + " z: " + z + "/n");
    }
    
  void spin(){
   blitX = x*cos(ry) + z*sin(ry);
   blitY = x*sin(ry)*sin(rx) + y*cos(rx) - z*sin(rx)*cos(ry);
   blitZ = y*sin(rx) - x*cos(rx)*sin(ry) + z*cos(rx)*cos(ry); 
  }
    
  void blit(){
    fill(z*4,xdot+ydot+zdot,255-(z*4));
    ellipse(f*blitX,f*blitY,blitZ,blitZ);
    //ellipse(f*blitX+cx,f*blitY+cy,blitZ,blitZ); 
  }
  
}
