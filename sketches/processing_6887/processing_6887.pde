
/**
 * SqueezePast version 2
 * A Voronoi Map created dynamically by a set of moving points
 * by Steven Kay
 * Speed-optimised version
 */
 
 
 /** 
 * Changes since last version...
 * points bounce off edges (thanks to kirk 'kirkjerk' israel for the suggestion)
 * pre-computed lookup table used to speed up trig calculations (frame rate up by a factor of 2-3 on my machine)
 * added interactivity (3 display modes, toggle by pressing key)
 *
 * Press [q] to toggle pre-computed table
 * Press [SPACE] to cycle through three display modes
 * Press [+] to add a new bubble
 * Press [-] to remove a bubble
 */


Random die=new Random();
ArrayList points=new ArrayList();
float[][] distlookup;
public int BUBBLES=20;
int mode=1;
boolean USE_SPEEDUP=true; // set to false to run original code

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
    this.y+=this.dy;
    if (this.x<0 || this.x>200) this.dx=-this.dx;
    if (this.y<0 || this.y>200) this.dy=-this.dy;
  }
  
  public float distanceTo(int xx,int yy) {
    // Euclidian Distance 
      
    if (USE_SPEEDUP) {
      // speeded up version - look up the precomputed tables
      return distlookup[Math.abs(xx-this.x)][Math.abs(yy-this.y)];
    } else {
      // naive version - compute hypotenuse each time  
      return (float)Math.sqrt(Math.pow(xx-this.x,2)+Math.pow(yy-this.y,2));
    }
  }
}

void setup() 
{
  // pre-compute distances, table 283x283
  // max hypoteneuse (approx) is 283, the furthest apart two pixels can be 
  // i.e. the distance from top-leftmost to bottom-right most pixel
  distlookup=new float[283][283]; 
  for (int i=0;i<283;i++) {
    for (int j=0;j<283;j++) {
      distlookup[i][j]=(float)Math.sqrt(Math.pow(i,2)+Math.pow(j,2));
    }
  }
  print("setup lookup table");
  size(400, 400);  // Size should be the first statement
  noStroke();     // Set line drawing color to white
  for (int i=0;i<BUBBLES;i++) {
    points.add(new Attractor());    
  }
}

float y = 100;

// draw loop

void draw() 
{ 
  background(0);   // Set the background to black
  fill(255);
  
  for (int x=0;x<200;x+=2) {
    for (int y=0;y<200;y+=2) {
      int nearest=0;
      float closest=1000.0;
      for (int p=0;p<points.size();p++) {
        Attractor a=(Attractor)points.get(p);
        float dist=a.distanceTo(x,y);
        if (dist<closest) {
          nearest=p;
          closest=dist;
        }
      }
      Attractor a=(Attractor)points.get(nearest);
      if (mode==0) fill(a.r,a.g,a.b); // fill by color
      if (mode==1) fill(255-3*closest); // 
      if (mode==2) {
        int l= (int)(255-3*closest);
        fill(l-a.r,l-a.g,l-a.b);
      }
      rect(x<<1,y<<1,4,4);
    }
  }
  
  for (int i=0;i<points.size();i++) {
    Attractor a=(Attractor)points.get(i);
    a.move();
  }
  
  if (frameCount%30==0) {
    // uncomment following line to check frameRate 
    print(frameRate+" fps\n") ;
  }
}

void keyPressed() {
  if (key==' ') {
    // SPACE : cycle through display modes
    mode=(mode+1)%3;
  }
  if (key=='Q'||key=='q') {
    // Q : toggle speed-up
    USE_SPEEDUP=!USE_SPEEDUP; 
  }
  if (key=='+'||key=='=') {
    // + key to add a new bubble
    points.add(new Attractor());       
  }
  if (key=='-'||key=='_') {
    // - key to remove a bubble
    if (points.size()>1) points.remove(points.get(points.size()-1));
  }
}

