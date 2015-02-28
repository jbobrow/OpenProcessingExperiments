
/**
 * Metaballs Demo
 * cannibalised from my earlier 'squeezepast' voronoi sketch
 * by Steven Kay
 * Speed-optimised version
 */
 
 
 /** 
 *
 * Press [q] to toggle pre-computed table (toggle fast/slow)
 * Press [SPACE] to cycle through color schemes
 * Press [+] to add a new bubble
 * Press [-] to remove a bubble
 * Press '[' to reduce radius
 * Press ']' to increase radius
 */


Random die=new Random();
ArrayList points=new ArrayList();
float[][] distlookup;
public int BUBBLES=20;
int mode=0;
boolean USE_SPEEDUP=true; // set to false to run original code
color[][] palette;
float THRESHOLDVAL=10.0; // threshold for inside/outside set

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
    // move bubble
    // makes it a bit more lava-lampy by emphasising dy
    this.x+=1.0*this.dx;
    this.y+=4.0*this.dy; 
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
  };
  // different colour schemes
  palette = new color[][]{
    {color(0),color(255)},
    {color(255,0,0),color(0,255,0)},
    {color(255,255,0),color(0,0,255)}
  };
}

float y = 100;
float R = 35.0; // radius of metaballs

// draw loop

void draw() 
{ 
  background(0);   // Set the background to black
  fill(255);
  
  for (int x=0;x<200;x+=2) {
    for (int y=0;y<200;y+=2) {
      int nearest=0;
      float disst=0.0;
      for (int p=0;p<points.size();p++) {
        Attractor a=(Attractor)points.get(p);
        disst+=R*(1.0/a.distanceTo(x,y));
      }
      fill(palette[mode][0]);
      if (disst>THRESHOLDVAL) {
        fill(palette[mode][1]);
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
    //print(frameRate+" fps\n") ;
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
  if (key==']'||key=='}') {
    // embiggen radius
    R=R+1.0;
  }
  if ((key=='['||key=='{') && R>5.0) {
    // unembiggen radius
    R=R-1.0;
  }
  
}

