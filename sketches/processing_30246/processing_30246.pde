
//Max Uhlich 2011
//Drag the mouse over the mandelbrot set as depicted in window 1 to
//view in window 2 the Julia set corresponding to the point on the complex
//plane underneath the mouse cursor. 
//This is the standard Julia set with f(z)=z^2 + c.
//Illustrates indexing of standard Julia sets by the Mandelbrot set.
import java.lang.Math.*;

PFrame f;
secondApplet mapp;

float scal = 150;
float zoom = 0.3;
double xZ;
double yZ;
//Complex coordinates
double xL = -2;
double xH = 2;
double yL = -1.3;
double yH = 1.3;
int H = (int)Math.round(scal*(Math.abs(yH - yL)));
int W = (int)Math.round(scal*(Math.abs(xH - xL)));
double ymul = H/(Math.abs(yH - yL));
double xmul = W/(Math.abs(xH - xL));
float max_iteration = 25;
//Complex constant
double x0; //Real part
double y0; //Imaginary part
double x, y;
color back = color(0);
color col = color(255); //(88,25,0) brown
int period = 0;
boolean phasing = false;

void setup() {
  size(W, H);
  background(back);
  PFrame f = new PFrame();
  f.setResizable(false);
  f.show();
  f.pack();
  //noLoop();
}

void togglePhasing(){
  phasing = !phasing;
  if(phasing){
    max_iteration = 0;
  }
  else{
    max_iteration = 25;
  }
  period = 0;
}

//convert pixel into coordinate on complex plane
double getx(int j) {
  return (double)j/xmul + xL;
}
double gety(int i) {
  return -((double)i/ymul + yL); //flip the y axis for correct polarity
}

void draw() {
  PImage body = createImage(W, H, RGB);
  body.loadPixels();

if(phasing){
  if(period<50){
    max_iteration += 1;
  }
  else {
    max_iteration -= 1;
  }
  period++;
  if (period == 100) {
    period = 0;
  }
}

  x0 = mapp.getMouseCompX();
  y0 = mapp.getMouseCompY();

  for (int i = 0; i < H; i++){
    for (int j = 0; j < W; j++){

      x = getx(j);
      y = gety(i);

      int iteration = 0;

      while ( ( (x*x + y*y) <= 4) && (iteration < round(max_iteration))) {
        double xtemp = (x*x - y*y + x0);
        y = (2*x*y + y0);
        x = xtemp;
        iteration++;
      }
      if (iteration == round(max_iteration)) {
        body.pixels[j+i*width] = col;
      }
      iteration = 0;
    }
  }

  //convert to line rendering
  PImage outline = body.get(0, 0, W, H);
  //PImage outline = body; //this line for texture
  for (int i = 0; i < H; i++) {
    for (int j = 0; j < W; j++) {
      if (j != 0 && i != 0 && j != W-1 && i != H-1) {
        if (body.pixels[(j+1)+i*width] == col &&
          body.pixels[(j-1)+i*width] == col &&
          body.pixels[j+(i+1)*width] == col &&
          body.pixels[j+(i-1)*width] == col) {
          outline.pixels[j+i*width] = back;
        }
      }
    }
  }
  outline.updatePixels();
  image(outline, 0, 0);
}

public class PFrame extends Frame {
  public PFrame() {
    mapp = new secondApplet();
    add(mapp);
    mapp.init();
    show();
    pack();
  }
}

public class secondApplet extends PApplet {

  float scal = 150;
  float zoom = 0.3;
  double xZ;
  double yZ;
  //Complex coordinates
  double xL = -2;
  double xH = 1;
  double yL = -1;
  double yH = 1;
  int H = (int)Math.round(scal*(Math.abs(yH - yL)));
  int W = (int)Math.round(scal*(Math.abs(xH - xL)));
  double ymul = H/(Math.abs(yH - yL));
  double xmul = W/(Math.abs(xH - xL));
  float max_iteration = 100;
  //Complex constant
  double x0; //Real part
  double y0; //Imaginary part
  double x, y;
  color back = color(0);
  color col = color(255); //(88,25,0) brown

  public void setup() {
    //setBounds(0,0,W,H);
    size(W, H);
    println(W);
    println(H);
    background(back);
    noLoop();
    //draw();
  }

  double getMouseCompX() {
    return getx(mouseX);
  }

  double getMouseCompY() {
    return gety(mouseY);
  }

  //convert pixel into coordinate on complex plane
  double getx(int j) {
    return (double)j/xmul + xL;
  }
  double gety(int i) {
    return -((double)i/ymul + yL); //flip the y axis for correct polarity
  }

  public void draw() {
    PImage body = createImage(W, H, RGB);
    body.loadPixels();

    for (int i = 0; i < H; i++) {
      for (int j = 0; j < W; j++) {

        x0 = getx(j);
        y0 = gety(i);

        x=0;
        y=0;

        int iteration = 0;

        while ( ( (x*x + y*y) <= 4) && (iteration < max_iteration)) {
          double xtemp = (x*x - y*y + x0);
          y = (2*x*y + y0);
          x = xtemp;
          iteration++;
        }

        if (iteration == max_iteration) {
          body.pixels[j+i*width] = col;
        }
        iteration = 0;
      }
    }
    //convert to line rendering
    PImage outline = body.get(0, 0, W, H);
    //PImage outline = body; //this line for texture
    for (int i = 0; i < H; i++) {
      for (int j = 0; j < W; j++) {
        if (j != 0 && i != 0 && j != W-1 && i != H-1) {
          if (body.pixels[(j+1)+i*width] == col &&
            body.pixels[(j-1)+i*width] == col &&
            body.pixels[j+(i+1)*width] == col &&
            body.pixels[j+(i-1)*width] == col) {
            outline.pixels[j+i*width] = back;
          }
        }
      }
    }
    outline.updatePixels();
    image(outline, 0, 0);
  }

  void zoomIn(int x, int y) {

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

    mapp.redraw();
  }

  void mousePressed() {
    zoomIn(mouseX, mouseY);
  }

  void reset() {
    xL = -2;
    xH = 1;
    yL = -1;
    yH = 1;
    ymul = H/(Math.abs(yH - yL));
    xmul = W/(Math.abs(xH - xL));
    this.redraw();
  }

  void keyPressed() {
    if (key == 'r') {
      mapp.reset();
    }
    else if (key == 'p'){
      togglePhasing();
    }
  }
}

