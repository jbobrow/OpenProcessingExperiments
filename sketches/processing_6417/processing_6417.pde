
/**
 * SqueezePast
 * A Voronoi Map created dynamically by a set of moving points
 * by Steven Kay
 * 
 */


Random die=new Random();
ArrayList points=new ArrayList();

class Attractor {
  
  public int x;
  public int y;
  public int dx;
  public int dy;
  public float r,g,b;
  
  public Attractor() {
    this.x=die.nextInt(200);
    this.y=die.nextInt(200);
    this.dx=-2+die.nextInt(4);
    this.dy=-2+die.nextInt(4);
    this.r=(float)die.nextInt(255);
    this.g=(float)die.nextInt(255);
    this.b=(float)die.nextInt(255);
  }
  
  public void move() {
    // move with wrap-around
    this.x+=this.dx;
    if (this.x<0) this.x+=200;
    if (this.x>200) this.x-=200;
    this.y+=this.dy;
    if (this.y<0) this.y+=200;
    if (this.y>200) this.y-=200;
  }
  
  public float distanceTo(int xx,int yy) {
    // Euclidian Distance 
    return (float)Math.sqrt(Math.pow(xx-this.x,2)+Math.pow(yy-this.y,2));
  }
}

void setup() 
{
  size(200, 200);  // Size should be the first statement
  noStroke();     // Set line drawing color to white
  frameRate(30);
  for (int i=0;i<20;i++) {
    points.add(new Attractor());    
  }
}

float y = 100;

// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
void draw() 
{ 
  background(0);   // Set the background to black
  fill(255);
  
  for (int x=0;x<200;x+=2) {
    for (int y=0;y<200;y+=2) {
      int nearest=0;
      float closest=1000.0;
      for (int p=0;p<20;p++) {
        Attractor a=(Attractor)points.get(p);
        float dist=a.distanceTo(x,y);
        if (dist<closest) {
          nearest=p;
          closest=dist;
        }
      }
      Attractor a=(Attractor)points.get(nearest);
      //fill(a.r,a.g,a.b); // fill by color
      fill(255-3*closest);
      rect(x,y,2,2);
    }
  }
  
  for (int i=0;i<20;i++) {
    Attractor a=(Attractor)points.get(i);
    a.move();
  }
} 


