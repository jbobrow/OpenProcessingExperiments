

public static final int WIDTH = 1020;
public static final int HEIGHT = 400;
 
public static final int COLUMNS = 20;   // number of columns
public static final int DIVISIONS = 100; // number of stripes per column
public static final int OFFSET = 20;    // moving lines are lower
 
// height of each line
public static final float LINE_HEIGHT = (HEIGHT / DIVISIONS);
public static final float LINE_WIDTH = (WIDTH / COLUMNS);
 
Line[] lines = new Line[COLUMNS];
 
void setup() {
  smooth();
  size(WIDTH, HEIGHT);
  for (int i = 0 ; i < COLUMNS ; i++) {
    lines[i] = new Line(i);
  }
}
 
void draw() {
  background(100,100,200);
  stroke(200,40,115);
  fill(200,40,115);
  for (int x = 0 ; x < COLUMNS ; x++) {
    // update wobbling
    lines[x].update();
    for (int y = 0 ; y < DIVISIONS - 2 ; y++) {
 float x0 = (x + .5) * LINE_WIDTH + lines[x].getX(y);
 float y0 = lines[x].getY(y);
 float x1 = (x + .5) * LINE_WIDTH + lines[x].getX(y + 1);
 float y1 = lines[x].getY(y + 1);
 if ((y & 1) == 0) {  
   quad(x * LINE_WIDTH, y * LINE_HEIGHT, x0, y0, x1, y1, x * LINE_WIDTH, (y + 1) * LINE_HEIGHT);
   quad(x0, y0, (x + 1) * LINE_WIDTH, y * LINE_HEIGHT, (x + 1) * LINE_WIDTH, (y + 1) * LINE_HEIGHT, x1, y1);
   // lines for debugging. look quite nice themselves.
//   line(x * LINE_WIDTH, y * LINE_HEIGHT, x0, y0);
//   line(x1, y1, x * LINE_WIDTH, (y + 1) * LINE_HEIGHT);
//   line(x0, y0, (x + 1) * LINE_WIDTH, y * LINE_HEIGHT);
//   line((x + 1) * LINE_WIDTH, (y + 1) * LINE_HEIGHT, x1, y1);
 }
    }
  }
}
 
// could probably just be a 2d array
class Line {
  float[] x = new float[DIVISIONS];
  float[] y = new float[DIVISIONS];
  float alpha;
  float delta;
  float period;
  float phase;
  float radius;
   
  public Line(int i) {
    alpha = random(360);
    period = random(-10.0, 10.0);
    radius = (WIDTH / COLUMNS) / 3;
    delta = random(0.5, 4.0);
    phase = random(360);
  }
   
  public void update() {
    alpha += delta;
    for (int i = 0 ; i < DIVISIONS ; i++) {
 float angle = radians(phase + alpha + (period * i));
 x[i] = radius * sin(angle);
 y[i] = OFFSET + i * LINE_HEIGHT;  
    }
  }
   
  public float getX(int i) {
    return x[i];
  }
   
  public float getY(int i) {
    return y[i];
  }
} 
 

