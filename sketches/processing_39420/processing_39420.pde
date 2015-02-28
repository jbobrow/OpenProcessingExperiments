
import processing.opengl.PGraphicsOpenGL;

ArrayList<PVector> points = new ArrayList<PVector>();
float ikeda = .92f; // Ikeda parameter
float step = .005f; // Speed of simulation
float life = 10; // Lifetime of a particle
int ppf = 100; // Points per frame
int maxp = 30000; // Maximum points
PVector op = new PVector();
int var = 0; // Selected parameter

float[] vars = {.015f,333f,6.7f,2f, .92f};


void setup() {
  size(800,800,P2D);
  noStroke();
  background(0);
}

void draw() {
  background(0);
  PVector np = p.pos;
  op = PVector.sub(p.pos,p.v);
  for(int i=0; i<ppf; i++)
    points.add(new PVector(random(-100,100),random(-100,100),ikeda)); // Sprinkle some stardust
  
  ArrayList<PVector> kill = new ArrayList<PVector>(); // Everyone hates concurrent modification exceptions
  
  float time = millis();
  for(PVector pv : points) {
    float u = pv.z + random(-.02f,.02f);
    float t = .4 - 6/(1+ pv.x*pv.x + pv.y*pv.y);
    float x1 = 1 + u*(pv.x*cos(t) - pv.y*sin(t));
    float y1 = u*(pv.x*sin(t) + pv.y*cos(t));
    
    pv.set(lerp(pv.x,x1,step),lerp(pv.y,y1,step),u); // Ikeda map is a discrete time system, lerping slows the simulation down
    
    if(pv.x < is(0)) pv.x = is(width-1);
    if(pv.x > is(width)) pv.x = is(1);
    if(pv.y < is(0)) pv.y = is(height-1);
    if(pv.y > is(height)) pv.y = is(1);
    
    /* This is the most complex part of the applet.
    ** It makes waves form behind the player, no fluid dynamics involved.
    */
    PVector dis = new PVector(pv.x-np.x,pv.y-np.y); // Vector between star and player
    PVector mov = PVector.sub(op,np); // Vector between new and old position
    PVector vfl = vectorFromLine(np,op,pv); // Vector From Line
    float pfl = positionFromLine(np,op,pv); // Position From Line in multiples of PFL
    float pflm = mov.mag()*pfl; // Position From Line (Direct Distance)
    pfl = sqrt(pfl); // Curve looks better like this
    float vflm = vfl.mag(); // VFL Magnitude, stored because original is normalized
    vfl.normalize();
    if(pfl>0)
      // Holy shit is this a formula or what? Look at all that. Don't even try to figure it out.
      pv.add( PVector.mult(vfl,  p.v.mag() * sq(pfl)* vars[0] * sin(vars[1] * sq(max(vars[2]-pfl,0)) * sin(vars[3]*log(pfl)) / sq(vflm) ) ) );
    //stroke(255); strokeWeight(1); // For debugging the physics
    //line(mouseX,mouseY,ss(np.x+vfl.x),ss(np.y+vfl.y));
    //text(10/positionFromLine(op,np,pv)*(1/vfl.mag()),mouseX,mouseY);
    
    
    if(abs(pv.x-x1)<.25 && abs(pv.y-y1)<.25) kill.add(pv);
  }
  for(PVector pv : kill) points.remove(pv);
  while(points.size()>maxp) points.remove(0);
  float iterateTime = millis() - time; // Primitive attempt at profiling. Good enough for a java applet though.
  
  time = millis();
  for(int i=0; i<points.size(); i++) {
    int x = (int)ss(points.get(i).x);
    int y = (int)ss(points.get(i).y);
    fill(255, 255 * (1-(float)i/20000));
    rect(x,y,1,1);
  }
  float drawTime = millis() - time;
  
  drawPlayer();
  
  if(keyboard[65])
    vars[var] *= 1.05;
  if(keyboard[90])
    vars[var] *= .95;
  ikeda = vars[4];
  
  fill(0);
  rect(0,0,230,150);
  fill(255);
  text("Current Point Count: " + points.size() + 
     "\nTime to iterate (ms): " + iterateTime + 
     "\nTime to draw (ms): " + drawTime + 
     "\nCurrently modifying " + (var==0?"Track Strength":
                                 var==1?"Sine Strength":
                                 var==2?"Track Length":
                                 var==3?"Sine Length":
                                 var==4?"Ikeda Parameter":"") + 
     "\nIkeda Parameter: " + ikeda + 
     "\nTrack Strength: " + vars[0] + 
     "\nSine Strength: " + vars[1] + 
     "\nTrack Length: " + vars[2] + 
     "\nSine Length: " + vars[3], 10, 30);
}

