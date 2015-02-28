
float mid;
Sine sine1;

void setup() {
  smooth();
  background(0);
  stroke(255);
  noFill();
  size(500,400);
  colorMode(HSB,255);
  mid = height/2;
  sine1 = new Sine(100, 300, 0);
}

void draw() {
  stroke(100);
  point(frameCount,mid);
  stroke(255);
  sine1.drawSine();  
}

public class Sine {
  private int x, nx, A, T;
  private float y, ny, p, F;
  
  public Sine() {
    A = 50;
    p = 0;
    T = 60;
    F = 1/float(T);
    x = nx = 0;
    ny = y = mid + A*sin(p);
  }
  
   public Sine(int amplitude,int time, float phase) {
    A = amplitude;
    p = phase;
    T = time;
    F = 1/float(T);
    x = 0;
    nx = -1;
    ny = y = mid + A*sin(p);
  }
  
  void drawSine() {
    y = mid + A*sin(2*PI*F*x + p);
    stroke((x+100*p)%255,255,200);
    line(nx,ny,x,y);
    ny = y;
    nx = x;
    if (++x > width) {
      p = p + PI/10.0;
      x = 0;
      nx = -1;
      ny = y = mid + A*sin(p); 
    }
  }
}


