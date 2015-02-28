
// original C code from: http://paulbourke.net/fractals/lorenz/
// 
// first implementation by Stephen Monslow

int N = 10000;



   int i=0;
   double x0,y0,z0,x1,y1,z1;
   double h = 0.01;
   double a = 10.0;
   double b = 28.0;
   double c = 8.0 / 3.0;
void setup() {
  size(600,600,P3D);
  smooth();
     x0 = random(3);
   y0 = random(3);
   z0 = random(3);


}

void draw() {
  

  
  background(0);
  translate(width/2,height/2);
  rotateX(frameCount/60);
  scale(6);
   for (i=0;i<N;i++) {
      x1 = x0 + h * a * (y0 - x0);
      y1 = y0 + h * (x0 * (b - z0) - y0);
      z1 = z0 + h * (x0 * y0 - c * z0);
      x0 = x1;
      y0 = y1;
      z0 = z1;
      if (i > 100) {
        
      float  x = (float) x0;
       float y = (float) y0;
        float z = (float) z0;
        
        
        stroke(frameCount%255);
        float px = x;
        float py = y;
        float pz = z;
        line(x,y,z,px,py,pz);

      }
   }
}






