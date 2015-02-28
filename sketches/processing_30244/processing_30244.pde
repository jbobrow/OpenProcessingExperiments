
//Max Uhlich 2011
//Graphs julia sets.
//Click to zoom with double precision.
//roadmap: http://www.ijon.de/mathe/julia/some_julia_sets_1_en.html
import java.lang.Math.*;

float scal = 150;
float zoom = 0.3;
double xZ;
double yZ;
//Complex coordinates
double xL = -1.4;
double xH = 1.4;
double yL = -1.2;
double yH = 1.2;
//Height and width of the screen.
int H = (int)Math.round(scal*(Math.abs(yH - yL)));
int W = (int)Math.round(scal*(Math.abs(xH - xL)));
double ymul = H/(Math.abs(yH - yL));
double xmul = W/(Math.abs(xH - xL));
//Number of iterations for every pixel
float max_iteration = 0;
//Complex constant
double x0 = 0.285; //Real part
double y0 = 0.01; //Imaginary part
double x, y; //Used only for mandelbrot.
color back = color(0); //Background
color col = color(3,0,255); //Fractal color

void setup(){
  size(W,H);
  println(H);
  println(W);
  background(back);
}

//convert pixel into coordinate on complex plane
double getx(int j){
  return (double)j/xmul + xL;
}
double gety(int i){
  return -((double)i/ymul + yL); //flip the y axis for correct polarity
}

void draw(){
  background(back);
  PImage body = createImage(W, H, RGB);
  body.loadPixels();
  int period = 0;
  
  //The following increases very slightly the complex constant
  //and alters the number of iterations to produce the morphing
  //fractal.
  if(period<=50){
    x0 += 0.0001;
    y0 += 0.0001;
  }
  else{
    x0 += 0.0001;
    y0 += 0.0001;
  }
  period++;
  if(period==100){
    period = 0;
  }
  if(max_iteration<=200){
    max_iteration += 1;
  }
  
  
  for(int i = 0; i < H; i++){
    for(int j = 0; j < W; j++){

      x = getx(j); //Change to x0 for mandelbrot.
      y = gety(i); //Change to y0 for mandelbrot.

      //x=0; y=0; //Uncomment these for mandelbrot.
      
      int iteration = 0;
      
      //For standard function: z^2 + c
      while(((x*x + y*y) <= 2) && (iteration < max_iteration)){
        double xtemp = (x*x - y*y + x0);
        y = (2*x*y + y0);
        x = xtemp;
        iteration++;
      }
      //f(z)=z3+1.55z2 on [-2.5;1]×[-2;2]
      /*while(((x*x + y*y) <= 4) && (iteration < max_iteration)){
        double xtemp = (x*x*x - 3*x*y*y + 1.55*x*x - 1.55*y*y);
        y = (3*x*x*y - y*y*y + 3.1*x*y);
        x = xtemp;
        iteration++;
      }*/
      //f(z)=(z3+c)/z with c=0.001, on [-1.5;1.5]×[-1.5;1.5]
      /*while(((x*x + y*y) <= 4) && (iteration < max_iteration)){
        double xtemp = x*x - y*y + (x*x0/(x*x + y*y));
        y = 2*x*y - (x0*y/(x*x + y*y));
        x = xtemp;
        iteration++;
      }*/
      
      if(iteration == max_iteration){
        body.pixels[j+i*width] = col;
      }
      iteration = 0;
    }
  }
  
  //convert to line rendering
  //PImage textur = body.get(0,0,W,H); //uncomment for filled color
  PImage outline = body.get(0,0,W,H); //this line for buggy texture
  for(int i = 0; i < H; i++){
    for(int j = 0; j < W; j++){
      if(j != 0 && i != 0 && j != W-1 && i != H-1){
        if(body.pixels[(j+1)+i*width] == col &&
           body.pixels[(j-1)+i*width] == col &&
           body.pixels[j+(i+1)*width] == col &&
           body.pixels[j+(i-1)*width] == col){
             //textur.pixels[j+i*width] = color(0,2,72); //uncomment for filled
             outline.pixels[j+i*width] = back;
        }
      }
    }
  }
  
  //Swap these two with the next two for filled color.
  //textur.updatePixels();
  //image(textur,0,0);
  outline.updatePixels();
  image(outline, 0, 0);
  
}

void zoomIn(int x, int y){
  
  double currentCompX = getx(W/2);
  double currentCompY = gety(H/2);
  
  double newCompX = getx(x);
  double newCompY = gety(y);
  
  double xDistance = currentCompX - newCompX;
  double yDistance = currentCompY - newCompY;
  
  xL = xL - xDistance;
  xH = xH - xDistance;
  
  yL = yL + yDistance;
  yH = yH + yDistance;
  
  //println(newCompX);
  //println(newCompY);
  
  xZ=zoom*(Math.abs(xH-xL))/2;
  yZ=zoom*(Math.abs(yH-yL))/2;
  
  xL+=xZ;
  xH-=xZ;
  yL+=yZ;
  yH-=yZ;
  ymul = H/(Math.abs(yH - yL));
  xmul = W/(Math.abs(xH - xL));
  
  println(xL);
  println(xH);
  println(yL);
  println(yH);
}

void mousePressed(){
  //println(mouseX);
  //println(mouseY);
  zoomIn(mouseX, mouseY);
}                                                       
