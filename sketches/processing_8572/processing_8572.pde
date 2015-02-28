
int WIDTH = 800;
int HEIGHT = 800;
int NUM_COLS = 10;
int NUM_ROWS = 10;
int CIRCLE_DIAMETER = 50;
int STROKE_WEIGHT = 10;
ArrayList arcs;

void setup()
{
  size(WIDTH, HEIGHT);
  smooth();
  
  background(255);
  
  arcs = new ArrayList();
  
  float x_gap = WIDTH / (NUM_COLS + 1);
  float y_gap = HEIGHT / (NUM_ROWS + 1);
  Arc psArc;
  int i, j;
  float angle1, angle2;
  for (i = 1; i <= NUM_COLS; i++)
    for (j = 1; j <= NUM_ROWS; j++) {
      angle1 = random(0, (float)(Math.PI * 2));
      angle2 = (float)Math.PI * 2;
      
      psArc = new Arc(i * x_gap, j * y_gap, CIRCLE_DIAMETER / 2, STROKE_WEIGHT, randomColor(), angle1, angle2);
      arcs.add(psArc);
      
      psArc.draw();
    }
}

void draw()
{
  
}

color randomColor() {
  int index_255 = (int)(Math.floor(random(0, 3)));
  
  int[] channels = new int[3];
  for (int i = 0; i < channels.length; i++) {
    if (i == index_255)
      channels[i] = 255;
    else
      channels[i] = (int)(Math.floor(random(0, 256)));
  }
  
  return color(channels[0], channels[1], channels[2]);
}

public class Arc {
  public float x;
  public float y;
  public float radius;
  public float strokeWidth;
  public color strokeColor;
  public float angle1;
  public float angle2;
  
  public Arc(float radius, float strokeWidth, color strokeColor, float angle1, float angle2) {
    this(0, 0, radius, strokeWidth, strokeColor, angle1, angle2);
  }
  
  public Arc(float x, float y, float radius, float strokeWidth, color strokeColor, float angle1, float angle2) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.strokeWidth = strokeWidth;
    this.strokeColor = strokeColor;
    this.angle1 = angle1;
    this.angle2 = angle2;
  }
  
  public void draw() {
    float diameter = radius * 2;
    
    pushMatrix();
    translate(x, y);
    
    ellipseMode(CENTER);
    noFill();
    strokeCap(SQUARE);
    stroke(strokeColor);
    strokeWeight(strokeWidth);
    arc(0, 0, diameter, diameter, angle1, angle2);
    
    popMatrix();
  }
}


