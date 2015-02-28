
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/12399*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/12399*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// Draws a hair character which can have his hair settings changed
//
//import processing.opengl.*;

// TODO : make fit the screen better
// and make dependant on screen size
Curve[] hairball;
Curve[] lawn;
GazeControl g_gaze[] = new GazeControl[7];
Eyes g_eyes = new Eyes();
Movement g_movement = new Movement();
boolean g_drawHelp= false;

float g_BallRadius = 100.;
HairStyle g_LawnStyle = new HairStyle( 0.4,50.4,3.71,0.5,  0.25,0.f,0.3f, 1.,3.) ;

final int NumHairs = 128;
final int NumLawnHairs = 96;
void GenHair()
{
    randomSeed(146914036);
    hairball =  GenerateCurvesOnSphere(NumHairs, g_BallRadius,20.,
                g_HairStyle.mohawk,g_HairStyle.face, g_HairStyle.messy,
                g_HairStyle.clumpStrength, g_HairStyle.clumpScale,0. );
                
    lawn = GenerateCurvesOnSphere(NumLawnHairs, width * 0.4,20.,
                 g_LawnStyle.mohawk,g_LawnStyle.face, g_LawnStyle.messy,
                g_LawnStyle.clumpStrength, g_LawnStyle.clumpScale,100.  );
}
PVector g_Light;
SuperSampler ss;
WorkQueue g_renderQueue;
void setup()
{
  size(700,400, P3D);//
  ss=new SuperSampler();
  int numproc=Runtime.getRuntime().availableProcessors();
  g_renderQueue = new  WorkQueue(numproc);
  if (numproc<=2){
    ss.useDirect(true);
  }
  GenHair();
  
  for (int i = 0; i < 7; i++)
    g_gaze[i] = new GazeControl();
         
  for (int i= 0; i < g_Streamer.length;i++)
    g_Streamer[i] =new Streamer(new PVector(255.0,230.,196));
    
  g_Light = new PVector(0.707f,-0.707f,0.1);
   g_Light.normalize();
}
HairStyle  g_HairStyle = new HairStyle();

float g_LightAngle = 0.55f;
void mouseDragged()
{
  if ( g_HairStyle.ApplyHairCutInput() )
    GenHair();
   g_LightAngle = g_HairStyle.LightAngle;
}
float glastVel = 0.;
void mouseReleased()
{
  float mx  =((float)(mouseX)/(float)width)*2.-1.;
  float my = ((float)(mouseY)/(float)height)*2.-1.;
  float d = mx*mx + my*my;
  if ( d < 0.1)
    g_movement.Hit(800);
}

boolean g_DrawBabies = false;
boolean g_HairAnim = false;
boolean g_drawLawn = false;
float g_shaveStength = 0.;
void keyReleased()
{ 
  g_shaveStength = 0.0f;
}
void keyPressed()
{
  if ( keyCode >='0' && keyCode <='9')
  {
    int code = keyCode-'0';
    g_HairStyle = PresetHairStyles[code%PresetHairStyles.length];
     GenHair();
    return;
  }
  if ( key =='A' || key =='a')
    g_HairAnim = !g_HairAnim ;
  else if ( keyCode =='H' || keyCode == 'h')
    g_drawHelp = !g_drawHelp;
  else if (keyCode =='C' || keyCode =='c')
    g_shaveStength = 0.25f;
  else if (keyCode =='L' || keyCode =='l')
    g_drawLawn = !g_drawLawn;
  else if( key=='s')
    ss.useDirect(!ss.m_useDirect);
  else if  ( keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT)
    g_DrawBabies = !g_DrawBabies;
    
}

PVector hairColors[]= {
new PVector(.137, .137, .137),  // poddle hair
new PVector(.81,.81,.81),
new PVector(.037, .037, .037),  // gorrilla hair
new PVector(.2, .2, .2),
new PVector(.1, .3, .5),
new PVector(.1, .55, .05),
new PVector(.109, .037, .007),
new PVector(.519, .325, .125),
new PVector(.3, .037, .1),
new PVector(.3, .6, .75),
new PVector(.3, .01, .3),
new PVector(.75, .4, .75),

};
color BackgroundColor = color(196,196,196);

void drawDropShadow(float rad, float s, PVector dir, float d  )
{
  noLights();
  beginShape(TRIANGLE_FAN);
  int c =(int)( (1.-s)*255.);
  fill(c,c,c,255);
  vertex(0.0f,100.001,0.0f);   
 fill(196,196,196,255); 
  for (float ang = 0.; ang <= (2.0f * PI+0.001); ang += 2.0f * PI/32.)
  {
    float ox = sin(ang);
    float oz = cos(ang);
    float ex = max(ox*dir.x + oz*dir.z,0.)*d;
    float r = rad + ex;
    vertex(ox*r, 100.001,oz*r);
  }
  endShape();
}
PVector g_Light2;
Streamer[] g_Streamer= new Streamer[8];
void DrawLawn()
{
   HairShader hs = new HairShader(hairColors[6],hairColors[7],// new PVector(0.1,0.2,0.1),new PVector(0.7,1.5,0.2), 
                       new PVector(0.,0.,0.), 99.0f + g_LawnStyle.Length, 99.0f ,
                        g_Light, g_Light2);
  
    beginShape(QUADS);
    PVector view = new PVector(0.f,0.,1.);
  int count =0;
  for(int i =0; i < lawn.length; i++)
      count +=  DrawStack(lawn[i], view, hs, g_LawnStyle.rootWidth, g_LawnStyle.tipWidth, 32 );
      
  endShape(QUADS);
}
float gLastTilt= 0;
int DrawHairBall( float time,float quality, boolean isLow, 
              GazeControl gaze , float rotateAmt, int skip,
               float tickleAmount, PVector pushPoint )
{
  pushMatrix();
 float extraL = g_HairStyle.Length -g_movement.y;
 float shadS = constrain(extraL/40+.5,0.5,1.);
 float shadR = constrain( (120+ extraL),0,80 + g_HairStyle.Length );
  PVector nl = new PVector(-sin(PI*g_LightAngle),-0.707f,cos(PI*g_LightAngle));
   nl.normalize();
   if ( g_drawLawn == false)
     drawDropShadow(shadR, shadS, nl, shadR);
      
 // drawDropShadow(constrain( (60+ g_HairStyle.Length -g_movement.y),0,60+ g_HairStyle.Length) );
  float vel = -g_movement.yvel*0.01;
  glastVel = 0.8*glastVel + 0.2*vel;

  // select hair color at random and blend
  float hairColorIndex = noise(time*0.05+12497)*10.;
  float hI = floor(hairColorIndex);
  float hbl = hairColorIndex - hI;
  hbl = hbl*hbl*(3.-2.*hbl);
  int hl =hairColors.length;
  int hIdx0 = ((int)hI*2 )% hl;
  int hIdx1 = ((int)(hI+1)*2 )% hl;
  PVector rootColor = lerp(hairColors[hIdx0], hairColors[hIdx1], hbl );
  PVector tipColor = lerp(hairColors[hIdx0+1], hairColors[hIdx1+1], hbl ); 

  // rotate to face
  float rot = gaze.lx*.25+rotateAmt;
 
  PVector view = new PVector(sin(rot),0.f,-cos(rot));
  g_Light = new PVector(sin(rot+PI*g_LightAngle),-0.707f,-cos(rot+PI*g_LightAngle));
  
  float rimOffset = -.3;
  g_Light2 = new PVector(sin(rot+PI*(g_LightAngle +rimOffset)),-0.707f,-cos(rot+PI*(g_LightAngle+rimOffset)));  
  g_Light.normalize();
   
   float floppyFactor = constrain((2.-g_HairStyle.stiffness)*.5,0.,1.);
   HairShader hs = new HairShader( rootColor,tipColor, 
                       new PVector(0.,0.,0.), 99.0f + g_HairStyle.Length*floppyFactor, 99.0f ,
                        g_Light, g_Light2);
                      
  rotateY(rot);
  
  rotateX(-gaze.ly*.25);
  
  translate( 0, -g_movement.y,0);
  
  float tiltamt = noise(time*2.+12497);
  tiltamt = tiltamt*tickleAmount*-pushPoint.x/g_BallRadius * 0.1;
  gLastTilt = gLastTilt * 0.7 + tiltamt*0.3;
  rotateZ(gLastTilt);

  int step = skip;
  float rw= g_HairStyle.rootWidth;
  float tw = g_HairStyle.tipWidth;
  if ( isLow )
  {
    rw *=3;
    tw *=2;
  }     
  
//  noStroke();
  beginShape(QUADS);
  int count =0;
  for(int i =0; i < hairball.length; i+=step)
    if (IsVis(hairball[i], view) )
      count +=  DrawStack(hairball[i], view, hs, rw, tw, quality );
      
  endShape(QUADS);


noStroke();
  lights();
  sphereDetail( isLow ? 8 : 16 );
  
  fill(0);
  sphere( 100.);
  g_eyes.Draw(gaze, time, tickleAmount);  

  noLights();
  popMatrix(); 
  return count;
} 
PVector g_pushPoint;
void draw()
{  
   
  float time = (float)millis()/1000.;

PVector pushPoint = new PVector((float)(mouseX) - (float)width*.5,
                                  (float)(mouseY) - (float)height*9/16,
                                  0.);
  

  // project onto sphere
  pushPoint.z = g_BallRadius*g_BallRadius - pushPoint.x*pushPoint.x - pushPoint.y*pushPoint.y;
  pushPoint.z = sqrt(max(pushPoint.z,0.00001));
  
  PVector fireFlyPoint = new PVector();
if ( g_drawLawn)
{
  
  fireFlyPoint.x = g_gaze[0].lx*width/2;
  fireFlyPoint.y = g_gaze[0].ly*height/2;
  fireFlyPoint.z = g_BallRadius*g_BallRadius - fireFlyPoint.x*fireFlyPoint.x - fireFlyPoint.y*fireFlyPoint.y;
  fireFlyPoint.z = sqrt(max(fireFlyPoint.z,0.00001));

 PVector off = NoiseOffset( time, 0.125);
  off.mult(2.);
  //fireFlyPoint.add(off);
  pushPoint = fireFlyPoint;
 } 
 
  float tickleAmount = pushPoint.mag()<110. ? 1. : 0;
  float hopChance = pushPoint.mag()<110. ? 0.2 : 0.01;
  if ( (random(0,1) < hopChance) && g_movement.y ==0.)
      g_movement.Hit(random(20,200));
      
  if ( tickleAmount > 0.)
    cursor(HAND);
   else
    cursor(CROSS);
    
  PVector pdir = new PVector();
  pdir.set(pushPoint);
  pdir.normalize();
  pdir.mult(6.);
  pushPoint.add(pdir);
  g_pushPoint =pushPoint;
  
  
  g_movement.Update(time);
  for (int i = 0; i < 7; i++)
    g_gaze[i].update(time+15897*i);

  float groundH = g_movement.y+100.;
  float rotateAmt =0.f;
  if ( g_HairAnim)
  {
     float hat = time*.2;
     float hI = floor(hat);
     float hbl = hat - hI;
     hbl = hbl*hbl*(3.-2.*hbl);
     hbl = hbl*hbl*(3.-2.*hbl);
    int hl =PresetHairStyles.length;
    g_HairStyle.Lerp( PresetHairStyles[ (int)hI%hl],  PresetHairStyles[ ((int)hI+1)%hl], hbl);
    GenHair();
    rotateAmt =hat*2.*PI*.5;
  }
  
  float rot = g_gaze[0].lx*.25+rotateAmt;
  PVector view = new PVector(sin(rot),0.f,-cos(rot));
  
  


 if ( g_drawLawn)
{
  for (int i= 0; i < g_Streamer.length;i++)
    g_Streamer[i].update( fireFlyPoint, time, i*125.739f);
  
  } 
 ApplyVelocityToCurves( hairball,new PVector(0.f,glastVel -0.96f,0.), 
         g_HairStyle.stiffness, g_HairStyle.Length, groundH, pushPoint, view, g_shaveStength );



ss.beginDraw(false);
  noStroke();
    
  if ( g_drawLawn )
      background(color(0,0,0));
  else
    background(color(196,196,196));
  
  
  translate( width/2,  height*9/16);  
  int numSegs = DrawHairBall( time,32., false, g_gaze[0], rotateAmt, g_DrawBabies ? 2 : 1, 
                                tickleAmount, pushPoint);

  // draw babies
  int numBabies = g_DrawBabies ? 6 :0;
  for (int i =0 ; i < numBabies;i++)
  {
    pushMatrix();
    translate( -(i*width)/8 + width/2 - 40 + ((i > 2) ? -140.: 0.), 0);
    scale(0.3);       
    numSegs +=DrawHairBall( time+15897*(i+1),100.,true,  g_gaze[i+1],  
                    rotateAmt, 6, 0., pushPoint);

    popMatrix();
  } 
  
  if ( g_drawLawn )
  {
   ApplyVelocityToCurves( lawn,new PVector(-0.0,-0.96f,0.), 
         g_LawnStyle.stiffness, g_LawnStyle.Length, groundH, pushPoint, view, 0. );

    DrawLawn();
    
    for (int i= 0; i < g_Streamer.length;i++)
      g_Streamer[i].Draw(view);
    
    loadPixels();
    DrawLightGlow( fireFlyPoint, 60.,.75);
    for (int i= 0; i < g_Streamer.length;i++)
      g_Streamer[i].DrawGlow();
  //  updatePixels();  
  }

  ss.endDraw();


  g_renderQueue.Wait();  
  //updatePixels();    
   
  if ( g_drawHelp  )
  {
    textMode(SCREEN); 
    String hairDescription = g_HairStyle.GetDescription();
    text(  "| Fps " + (int)frameRate + "| NumSegs " + numSegs, 20,height-40);
      text(  hairDescription , 20,height-20);
  }
}

public interface WorkItem
{
  void run( int i) ;
}

import java.util.LinkedList;
 
public class WorkQueue
{
    public final int nThreads;
    private final PoolWorker[] threads;
    private final LinkedList queue;
 
    public WorkQueue(int nThreads)
    {
        this.nThreads = nThreads;
        queue = new LinkedList();
        threads = new PoolWorker[nThreads];
 
        for (int i=0; i<nThreads; i++) {
            threads[i] = new PoolWorker();
            threads[i].threadId = i;
            threads[i].start();
        }
    }
    public void clear(){
      synchronized(queue) {
        queue.clear();
      }
    }
       public void Wait() {       
        while(IsFinished()==false){
           try {                          
              Thread.sleep(1);
          }
          catch (InterruptedException ignored)
          {
          }
        }       
    }
    public boolean IsFinished() {
        for (int i=0; i<threads.length; i++)
          if ( threads[i].working )
            return false;
        return queue.isEmpty();
    }
    public void execute(WorkItem r) {
        synchronized(queue) {
            queue.addLast(r);
            queue.notify();
        }
    }
 
    private class PoolWorker extends Thread {
        boolean working;
            
        int threadId = -1;           
        public void run() {
            working = true;
            WorkItem r;
           
            while (true) {
                synchronized(queue) {
                    while (queue.isEmpty()) {
                        working = false;
                        try {                           
                            queue.wait();
                        }
                        catch (InterruptedException ignored)
                        {
                        }
                    }                   
                    working = true;
                    r = (WorkItem) queue.removeFirst();
                }              
                    r.run(threadId);
            }
        }
    }
}

 

class GazeControl
{
  float lx;
  float ly;
  
  GazeControl()
  {
    lx =0;
    ly = 0;
  }
  void update( float time )
  {
    float mx  = ((float)((float)mouseX/(float)width)* 2.-1.);
    float my = ( (float)((float)mouseY/(float)height)* 2.-1.);
    
    float x = 0.;
    float y =0.;
    
    if ( abs(mx)<0.95 && abs(my) <0.95)
    {
      x += mx;
      y += my;
    }
    else
    {
     x += constrain(noise( time*.2+1257.)*4.-2.,-1.,1.);
      y+= constrain(noise( time*.2+127.)*4.-2.,-1.,1.);
    }
    // blend with previous to stop pops
    lx = lerp(lx,x,0.1);
    ly = lerp(ly,y,0.1);    
  }
};

  
class Eyes
{  
  void Draw( GazeControl gaze, float time, float tickleChance )
  {
    PVector specDir = new PVector();
    if( g_drawLawn)
    {
      specDir.set(g_pushPoint);
      specDir.normalize();
    }
    else
      specDir.set(g_Light);
     // eyes -> add blinking     
    float pupilOffsetX = gaze.lx*7.;
    float pupilOffsetY =gaze.ly*10.;     
    float blinkAmount = constrain((noise( time*6.+1257.)-0.65 ) *1./0.2,0.,1.);
    
    float shockAmount = constrain((noise( time*3.+1257.)-0.35 ) *1./0.4,0.,1.);
    shockAmount *= tickleChance;
    float xeye = -20.;
    for (int i =0;i < 2; i++)
    {
      pushMatrix();
       translate(xeye,-30,80.);
       scale(1.,1.3,0.8);
       fill(~0);
        pushMatrix();
       scale(1.,1.-blinkAmount,1.);
       sphere(20.);
        
       // spec highlight
         pushMatrix();
      // translate(8.,-8.,20.);
        translate(specDir.x*6.,specDir.y*6.,22.);
       
       fill(~0);
       noLights();
       sphere(3.);
       lights();
       popMatrix();
        popMatrix();
       translate(pupilOffsetX,pupilOffsetY,15.);
       
       
       fill(0);
       scale(1.,1.1 + shockAmount*0.4,0.8);
       sphere(11.);
       
       // color part of eye
       /*
       translate(0.,-0.,1.);
       scale(1.,1.,0.6);
      fill(color(127,127,255));
       sphere(9.);
       */
      popMatrix();
      xeye = 20.;
    }    
  }
};


class Movement
{
  float y;
  float yvel;
  float ltime;
  Movement()
  {
    y = height*4.;
    yvel=0.;
    ltime =0.;
  }
  void Hit( float force)
  {
    yvel += force;
  }
  void Update( float time)
  {
    float gravity = -698.2f;
    float dt = time - ltime;
    yvel += gravity *dt;
     y += yvel*dt;
    if ( y <= 0.)
    {
      if ( yvel <= 0.)
      {
        if ( yvel > -80.)
          yvel = 0.f;
        yvel = -yvel*.6f;
      }
      y =0.0;
    }
    yvel *=0.97f;
    ltime = time;
  }
}



PVector Average(PVector a, PVector b)
{
  return new PVector( .5*(a.x+b.x), .5*(a.y+b.y),.5*(a.z+b.z));
}

class Curve
{
  PVector[] p;
  float     v0;
  float     v1;
  float     clen;
  
  PVector   m_tan0;
  PVector   m_tan1;
  
  PVector   m_col0;
  PVector   m_col1;
  Curve() { p = new PVector[4]; }
  Curve( PVector _p[], float l )
  {
    p = _p;
    v0 =0.;
    v1 = 1.;
    clen =l;
  }

  float distancePointsToLine( PVector p0, PVector p1, PVector l1, PVector l2)
  {
    PVector ul = new PVector();
    ul.set(l2);
    ul.sub(l1);
    //ul.normalize();  - not required

    PVector dp0 = new PVector();
    dp0.set(p0);
    dp0.sub(l1);

    PVector dp1 = new PVector();
    dp1.set(p1);
    dp1.sub(l1);

    float area0 = ul.cross(dp0).mag();
    float area1 = ul.cross(dp1).mag();
    return area0 + area1;
  }
  boolean IsFlat( float pswidth)
  {
    float tol =  pswidth;
    // from http://www.antigrain.com/research/adaptive_bezier/index.html
    // simple flatness test distance of  point to line
    // Try to approximate the full cubic curve by a single straight line
    //------------------
    float dx = p[3].x-p[0].x;
    float dy = p[3].y-p[0].y;
    float dz = p[3].z-p[0].z;

    float len = (dx*dx + dy*dy + dz*dz);

    float d2pd3 = distancePointsToLine( p[1],p[2],p[0],p[1]);
    return ((d2pd3)*(d2pd3) < tol * len);
    }
  Curve[] Subdivide( )
  {
    Curve curves[] = new Curve[2];
    curves[0] = new Curve();
    curves[1] = new Curve();
    // width automatically converted
    curves[0].p[0 ] = p[0 ];
    curves[1].p[3 ] = p[3 ];
    curves[0].p[1 ] =  Average( p[0],p[1]);
    curves[1].p[2 ] =  Average( p[2 ],p[3]);

    final PVector p11 = Average(p[1],p[2]);
    curves[0].p[2] = Average(curves[0].p[1], p11);
    curves[1].p[1]=  Average(curves[1].p[2],p11);

    final PVector p30 = Average(curves[0].p[2 ], curves[1].p[1]);
    curves[0].p[3] = p30;
    curves[1].p[0] = p30;

     // Use v0 for width as well
    curves[0].v0 =v0;
    curves[1].v1 =v1;
    
    final float midV = .5*(v0+v1);
    curves[0].v1 =midV;
    curves[1].v0 =midV;
 
   curves[0].clen = clen;
   curves[1].clen = clen;
    return curves;
  }
  void DrawFirstPoint(PVector view, HairShader hs, float rootW, float tipW )
  {
     PVector delta = new PVector();
    delta.set(p[1]);
    delta.sub(p[0]);
    delta.normalize();
    
    float w0 = lerp(rootW,tipW, v0)*clen;
    PVector tangent = view.cross( delta);
    tangent.normalize();
    tangent.mult(w0);
    PVector col0  = hs.GetShade(p[0], delta,view,  v0 );
    
     
    fill( color(col0.x*255.,col0.y*255.,col0.z*255.));
    
     vertex( p[0].x - tangent.x, p[0].y - tangent.y, p[0].z - tangent.z);
    vertex( p[0].x + tangent.x, p[0].y + tangent.y, p[0].z  + tangent.z);

  }
    void DrawEndPoint2( PVector view, HairShader hs, float rootW, float tipW )
  {        
     PVector  delta =new PVector();
     delta.set(p[3]);
     delta.sub(p[2]);
     delta.normalize();
     
    float w1 = lerp(rootW,tipW, v1)*clen;
    PVector tangent2 = view.cross( delta);
    tangent2.normalize();
    tangent2.mult(w1);
    
    PVector col1 =  hs.GetShade( p[3], delta,view, v1 );           
    fill( color(col1.x*255.,col1.y*255.,col1.z*255.));
    float p0x =  p[3].x + tangent2.x;
    float p1x =  p[3].x - tangent2.x;
    float p0y =  p[3].y + tangent2.y;
    float p1y =  p[3].y - tangent2.y;
    float p0z =  p[3].z + tangent2.z;
     float p1z =  p[3].z - tangent2.z;
    vertex( p0x, p0y, p0z);
    vertex( p1x, p1y, p1z);
    vertex( p1x, p1y, p1z);
    vertex( p0x, p0y, p0z);   
  } 
  void DrawEndPoint( PVector view, HairShader hs, float rootW, float tipW )
  {  
        
     PVector  delta =new PVector();
     delta.set(p[3]);
    delta.sub(p[2]);
     delta.normalize();
     
    float w1 = lerp(rootW,tipW, v1)*clen;
    PVector tangent2 = view.cross( delta);
    tangent2.normalize();
    tangent2.mult(w1);
    
    PVector col1 =  hs.GetShade( p[3], delta,view, v1 );           
    fill( color(col1.x*255.,col1.y*255.,col1.z*255.));
    vertex( p[3].x + tangent2.x, p[3].y + tangent2.y, p[3].z + tangent2.z);
    vertex( p[3].x - tangent2.x, p[3].y - tangent2.y, p[3].z - tangent2.z);

  } 
  void Draw( PVector view, HairShader hs, float rootW, float tipW )
  {   
    DrawFirstPoint(view,hs, rootW,tipW );
    DrawEndPoint( view, hs, rootW,tipW );
  }
}
boolean IsVis( Curve cp, PVector view )
{
  PVector dir = new PVector();
  dir.set(cp.p[1]);
  dir.sub(cp.p[0]);
  return dir.dot(view) < 0.0;
}
int DrawStack(  Curve  cp, PVector view ,HairShader hs, float rootW, float tipW ,
                float quality )
{
//     beginShape(QUAD_STRIP);

   Curve[] stack = new Curve[64];
   int stptr = 0;
   int count =0;
    
   quality = quality/(float)width;
   
   //  draw first Point
   cp.DrawFirstPoint(view, hs , rootW, tipW);
   while( true)
   {
     if ( cp.IsFlat(quality)  )
     {
       // draw endpoint cp;
       count++;
       if ( stptr == 0)
       {
         cp.DrawEndPoint(view, hs , rootW, tipW);
         return count;
       }
       cp.DrawEndPoint2(view, hs , rootW, tipW);
       cp = stack[--stptr];
       continue;
     }
     // compute mid edge data
     Curve[] cps = cp.Subdivide();
     cp = cps[0];
     stack[stptr++] = cps[1];
   }
     

}
PVector lerp( PVector a, PVector b, float t)
{
  return new PVector( lerp(a.x,b.x,t),lerp(a.y,b.y,t),lerp(a.z,b.z,t));
}
float pow6(float v)
{
  v  = v*v;
  float v4 = v*v;
  return v4*v;
}
float intSphereThickness( float r2, float ri2, PVector ro, float ro2, PVector dir, float maxT)
{
  float c = ro2 - r2;
  float c2 = ro2 - ri2;
  float b = ro.dot(dir);
  float t = b*b-c;
  if ( t > 0.0f) {
    float st =sqrt(t);
    float t2 = b*b -c2;
    if ( t2 > 0.0)
    {
        float st2 = sqrt(t2 );
        float tmn = -b - st2;
        float tmx = -b + st2;
        float tv= tmn<0. ? tmx : tmn;
        if ( tv> 0. && tv < maxT)
        {
         
          return  1000000.;
        }
    }
    float t0 = max(-b-st,0.);
    float t1=  max(-b+st,0.);
    t0 = min(t0,maxT);
    t1 = min(t1,maxT);
    return t1 -t0;
  }
  return 0.f;
}

class TLTable
{
  float[] vals;
  int      numVals = 256;
  
  TLTable()
  {
    vals =new float[numVals * numVals];
    for (int i =0; i < numVals;i++)
      for (int j =0; j < numVals; j++)
      {
        float fi  = ((float)i/(float)numVals ) *2.-1.;  // -> i = T.V
        float fj  = ((float)j/(float)numVals ) *2.-1.;  // ->j = T.L
        // calculate lighting val ( could use shader for this)
        float cosang =cos (abs(acos (fj) - acos (-fi )));
        float spec = max( pow6 (cosang),0.);
        vals[i*numVals + j] = spec;
      }
  }
  float GetSpec( float TdotV, float TdotL )
 {
   // convert into range
   int i = (int)(( TdotV*127.)+128.f);
   int j = (int)(( TdotL*127.)+128.f);
   return vals[ i*numVals + j ];
 } 
}
TLTable g_PrecomputeLighting = new TLTable();

// http://graphics.stanford.edu/lab/soft/purgatory/prman/Toolkit/AppNotes/appnote.19.html#hair
class HairShader
{
   final PVector rootcolor;
   final PVector tipcolor;
   final PVector speccolor;
   final PVector amb;   
   final PVector diffuse;
   final PVector shadSphere;
   final float   shadRadius;
   final float   shadInnerRadius;
   final float   shadScale;
   
    PVector L;  // normalized light direction
    PVector L1;  // normalized rim light direction
      
   HairShader( PVector _r, PVector _t, PVector _ss, float _sr, float _sir, PVector _L, PVector _L1 )
   {
     tipcolor = _t;
     rootcolor = _r;
      speccolor =  new PVector( (1 + tipcolor.x)/2,(1 + tipcolor.y)/2,(1 + tipcolor.z)/2);
      
      float Ks = .5 ;
      speccolor.mult(Ks);
       
      final float Ka = 0.1;
      amb = new PVector(0.13f* Ka,0.23f* Ka,0.33f * Ka);
      
      shadSphere = _ss;
      shadScale = 1./(_sr*.75);
      shadRadius = _sr*_sr;
      shadInnerRadius = _sir*_sir;
      
      L = _L;
      L1 = _L1;
      L.normalize();
      L1.normalize();
      
       final float Kd = .6; //, roughness = .15;
      diffuse = new PVector(1.1* Kd, 0.9* Kd,0.8* Kd);

    }    
    float GetShadow( PVector o, float ro2, PVector d, float maxT)
    {
        float th =max(1.-(intSphereThickness( shadRadius, shadInnerRadius, o, ro2, d, maxT)*shadScale),0);
        return th;
    }
     
PVector GetShade(
       PVector P, // position
       PVector T, // tangent along length of hair 
    PVector V,   // V is the view vector        
        float   v // normalized length along curve
  )
{
  PVector LL = new PVector();
  float atten=1.;
  float maxT =10000.;
  if( g_drawLawn)
  {
  LL.set(g_pushPoint);
   LL.sub(  P );
   maxT = LL.mag();
   atten = constrain(10000./LL.dot(LL),0,10.);
   LL.normalize();
  }
  else
  {
    LL.set(L1);
  }
   final float ro2 = P.dot(P);
   float  v2 = sqrt(v);
     // Loop over lights, catch highlights as if this was a thin cylinder     
    float TdotV = T.dot(V);
   
   float shad0 = GetShadow( P, ro2,L, 100000.f);
   float shad1 = GetShadow( P, ro2, LL, maxT);//L1);
   
 /*   float TdotL = T.dot(L);  
    float acosTdotV = acos (-TdotV );
   float cosang0 =cos (abs(acos (TdotL) - acosTdotV ));
   float Cspec =shad0 * v*max( pow6 (cosang0),0.);  //, 1/roughness)     
   float cosang1 =cos (abs (acos (T.dot(L1)) - acosTdotV));
   Cspec +=shad1 * v* max(pow6 (cosang1),0.);  //, 1/roughness)     
 */  
    float Cspec = shad0 *g_PrecomputeLighting.GetSpec( TdotV, T.dot(L));    
   Cspec += shad1 *g_PrecomputeLighting.GetSpec( TdotV, T.dot(LL))*atten;    
   Cspec *=v;
  
   float Cdiff =(shad0 +shad1*atten)*v2 ;
  
  // We multipled by v to make it darker at the roots.  This
 // assumes v=0 at the root, v=1 at the tip.
  PVector hcolor = lerp(rootcolor, tipcolor, v);
  PVector Ci = new PVector();
  Ci.set( amb);
  float ambShade = 1.;//constrain((-P.y*1./160)+.5,0.,1.);
  Ci.mult(v*ambShade);
  
  PVector Cd = new PVector();
  Cd.set(diffuse);
  Cd.mult(Cdiff);
  Ci.add( Cd);
  Ci.mult(hcolor);
  
  PVector Cs = new PVector();
  Cs.set(speccolor);
  Cs.mult(Cspec);
  Ci.add(Cs);
  //Ci.set(Cs);
  // Ci.set(shad1,shad1,shad1);
  
  // could do this as a table?
   Ci.x = sqrt(Ci.x);
   Ci.y = sqrt(Ci.y);
   Ci.z = sqrt(Ci.z);
   
   Ci.x = constrain( Ci.x,0.,1.);
   Ci.y = constrain( Ci.y,0.,1.);
   Ci.z = constrain( Ci.z,0.,1.);
   return Ci;                 
}
};

void ApplyVelocityToCurves( Curve[]  curves, PVector vel,
      float stiffness, float clen, float groundH, 
      PVector pushPoint, PVector viewDir , float shaveStength )
{
  float pushRadius = clen+5.;
  vel.mult(stiffness);
  for (int i =0; i < curves.length; i++)
  {
    Curve cp = curves[i];
    if (!IsVis(cp, viewDir) ) 
       continue;
    // calculate expected end point
    PVector dir = new PVector();
    dir.set(cp.p[1]);
    dir.sub(cp.p[0]);
    dir.normalize();
    PVector endpoint = new PVector();
    endpoint.set(dir);
    endpoint.sub(vel);
    // renormalize to keep length
    endpoint.normalize();
    
    float len = clen * cp.clen;
    cp.p[1].set(dir);
    cp.p[1].mult(len*.25);
    cp.p[1].add(cp.p[0]);
    
    cp.p[3].set(endpoint);
    cp.p[3].mult(len);
    cp.p[3].add(cp.p[0]);
    
    cp.p[2].set(endpoint);
    cp.p[2].add(dir);
    cp.p[2].mult(len*.75*.5);
    cp.p[2].add(cp.p[0]);
    
    
    // project up to ground
   PVector xzDir = new PVector();
    xzDir.set(dir);
    xzDir.y=0.f;
    xzDir.normalize();
    
    float ex = min( -(cp.p[2].y-groundH),0.);
  
    cp.p[2].x -= ex * xzDir.x;
    cp.p[2].z -= ex * xzDir.z;
    cp.p[2].y +=ex;
    ex = min( -(cp.p[3].y-groundH), 0.);
    cp.p[3].x -= ex * xzDir.x;
    cp.p[3].z -= ex * xzDir.z;
    cp.p[3].y +=ex;
     // project away from push point
     
     PVector pushDir = new PVector();
     pushDir.set(pushPoint);
     pushDir.sub(cp.p[3]);
     float pd = pushDir.mag();
     float pushamt = min( pd-pushRadius,0);
     pushamt = max( pushamt,-len);
     pushDir.mult(pushamt/pd);
     cp.p[3].add(pushDir);
     cp.p[2].add(pushDir);
     cp.clen *=max(1+(pushamt/pushRadius)*shaveStength,0.);
     if ( cp.clen < 0.01)
     {
       cp.clen = 0.;
     }
  }
}
Curve[] GenerateCurvesOnSphere( int amt, float rad, 
          float aclength, float mohawk, float face, float messy,
         float clumpStrength, float clumpScale, float planeHieght   )
{
  Curve[] cps = new Curve[amt*amt];
 
  PVector cut0 = new PVector(-20,-30,80.);
  PVector cut1 = new PVector(20,-30,80.);
  PVector faceCut0 = new PVector(0,20,80.);
  
  mohawk = 1.-mohawk;
  float cutSize =  28. + face *0.2f;
  float faceCutSize = face;
  float faceCutEnd = 1. - face*0.01f;
  int cnt = 0;  
  
  noiseDetail( 3,0.5);
  int amt2 = amt/2;
  for (int i = 0; i < amt; i++)
    for (int j = 0; j < amt2; j++)
    {
      float u = ((float)i + random(0,1))/(float)amt;
      float v = ((float)j + random(0,1))/(float)amt2;
      // not a good parameterizatin ( too much at the poles       

      // http://mathworld.wolfram.com/SpherePointPicking.html
      PVector nrm,p;
      if ( planeHieght == 0.)
      {
        float theta = u*2.*PI;
        float phi =acos(2.*v-1.);
        
        nrm = new PVector( sin(phi)*cos(theta), cos(phi), sin(phi)*sin(theta));
        p = new PVector();
        p.set(nrm);
        p.mult(rad);
      }
      else
      {
        nrm = new PVector( 0., -1., 0.);
        p = new PVector((u*2.-1.)*rad, planeHieght, (v-0.5)*rad);
      }
      
      // check for invalid areas and cut hair as appropriate
      float cut = 1.;
      cut += min( ( PVector.dist(cut1,p)- cutSize)*.5 ,0);
      cut += min(  (PVector.dist(cut0,p)- cutSize)*.5 ,0);            
      cut += min( (mohawk - abs(nrm.x) ) *4. ,0);
      cut += min( (PVector.dist(faceCut0,p)- faceCutSize)*.5 ,0);
      cut += constrain( (faceCutEnd - nrm.y ) *4. ,-1,0.);

      // tilt normal
      
      
      nrm.x += (noise(p.x*clumpScale,p.y*clumpScale,p.z*clumpScale)*2.-1 )*clumpStrength ;
      nrm.y += (noise(p.y*clumpScale,p.z*clumpScale,p.x*clumpScale)*2.-1 )*clumpStrength ;
      nrm.z += (noise(p.z*clumpScale,p.x*clumpScale,p.y*clumpScale)*2.-1 )*clumpStrength ;
      
      cut = sqrt(cut);
      float ranlen = noise(p.x*8.,p.y*8,p.z*8.)*messy + max(1.-messy,0.);
      ranlen*=cut;
     
      if ( ranlen < 0.01)  // hair too short
        continue;
      float clength = aclength*ranlen;
       
      PVector[] pts = new PVector[4];
      pts[0] = p;
      
      pts[1] = new PVector();
      pts[1].set(nrm);
      pts[1].mult(clength*.25f);
      pts[1].add(p);
        
      pts[3] = new PVector();
      pts[3].set( nrm);
      pts[3].mult(clength);
      pts[3].add(p);
      
      pts[2] = new PVector();
      pts[2].set(nrm);
      pts[2].mult(clength*.75f);
      pts[2].add(p);
       
       cps[ cnt] = new Curve( pts,ranlen);
       cnt++;
    }
    Curve[] rcps = new Curve[cnt];
    for (int i =0; i < rcps.length; i++)
    {
      rcps[i]=cps[i];
    }
   return rcps;
}

class HairStyle
{
  float Length = 20.f;
  float stiffness = 0.5f;
  float rootWidth = 2.f;
  float tipWidth = 0.5f;
  float mohawk = 0.;
  float face = 0.;
  float messy = 0.3f;
  float LightAngle = 0.55f;
  
  float clumpStrength = 1.;
   float clumpScale = 0.1;
      
HairStyle()
{}

  HairStyle( float _s, float _l, float _r, float _t, float _m, float _f, float _mes, float _cstr, float _csc)
  {
    Length = _l;
    stiffness = _s;
    rootWidth = _r;
    tipWidth = _t;
    mohawk = _m;
    face = _f;
    messy = _mes;
    clumpStrength = _cstr;
    clumpScale = _csc;
    
  }
  void Lerp(HairStyle a, HairStyle b, float t)
  {
    Length = lerp(a.Length,b.Length,  t);
    stiffness= lerp(a.stiffness, b.stiffness,t);
    rootWidth= lerp(a.rootWidth,b.rootWidth,t);
    tipWidth= lerp( a.tipWidth,b.tipWidth,t);
    mohawk= lerp(a.mohawk,b.mohawk,t);
    face= lerp(a.face, b.face,t);
    messy= lerp( a.messy, b.messy,t);    
    clumpStrength = lerp( a.clumpStrength, b.clumpStrength,t);
    clumpScale =  lerp( a.clumpScale, b.clumpScale,t);
  }
  boolean ApplyHairCutInput()
  {
     float dx  = ((float)((float)(mouseX-pmouseX)/(float)width));
    float dy = ( (float)((float)(mouseY-pmouseY)/(float)height));
    if ( keyPressed && keyCode == CONTROL)
    {
      mohawk = max( mohawk + dx*.5, 0.);
      face = max( face + -dy*20., 0.);
      return true;
    }
    else if ( keyPressed && keyCode == SHIFT)
    {
       rootWidth+=dx;
       tipWidth+=dy;
       return true;
    }
   else if ( keyPressed && keyCode == ALT)
    {
      // messy = max( messy + dx, 0.);    
      // LightAngle += dy;
      clumpStrength  = max(clumpStrength + dx, 0.);    
      clumpScale  = max(clumpScale -dy*0.1, 0.);    
       return true;
    }
    else
    { 
      Length =max(  Length +dx*20., 0.05);
     stiffness =max( stiffness+ dy, 0.);
     return false;
    }
  }
  String GetDescription()
  {
     return "| Stiffness " + nf(stiffness,2,2) +"| Length "+nf(Length,3,1) +"| Root Width " + nf(rootWidth,2,2)
    + "| Tip Width " +nf(tipWidth,2,2) + "|Side Cut " +   nf(mohawk,1,2)  + "|Face Cut " + nf(face,3,1) + "| Messiness " + nf(messy,1,2);
  }
}
// add a new hair style here
 HairStyle PresetHairStyles[]= {
  new HairStyle( 0.37,39.4,1.71,0.3,  0.25,0.f,0.3f, 1.,3.),
  new HairStyle(0.49,60.78,1.23,0.168,0.f,0.f,0.3f, 1.,3.),
   new HairStyle(0.42,99.7,1.23,00.17,0.7f,60.f,0.3f, 1.,3.),
  new HairStyle(0.88,28.81,2.67,1.67,0.f,0.f,0.3f, 1.,3.),
   new HairStyle(0.99,19.3,02.62,0.49,0.34f,32.f,1.89f, 1.,3.),
   new HairStyle(0.61,27.5,02.62,0.49,0.0,46.f,1.89f, 1.,3.)
   
};
import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class hairball extends PApplet {

// hairy
// Draws a hair character which can  have his
// hair styled. 
//
 
 // Controls : Click on him to make him jump
 // Drag mouse horizontally to change hair length
 // Drag mouse vertically to change stiffness
 // Shift Drag mouse horizontally to root width
 // Shift Drag mouse vertically to tip width
 // 0-7 preset hair styles
 // any other key shows his friends
 
 
Curve[] hairball;
GazeControl g_gaze[] = new GazeControl[7];
Movement g_movement = new Movement();
 
 float HairBallSize = 99.f;
 boolean g_drawHelp = false;
public void setup()
{
  size(700,400,P3D);
  hairball =  GenerateCurvesOnSphere( 48, HairBallSize,20.f);
  noStroke();
 
  for (int i = 0; i < 7; i++)
    g_gaze[i] = new GazeControl();
}

float g_hairStiffness = 0.5f;
float g_hairLength = 20.f;
float g_hairRootWidth = 2.f;
float g_hairTipWidth = 0.5f;
 
public void mouseDragged()
{
  float dx  = ((float)((float)(mouseX-pmouseX)/(float)width));
  float dy = ( (float)((float)(mouseY-pmouseY)/(float)height));
  if ( keyPressed && keyCode == SHIFT)
  {
    g_hairRootWidth+=dx;
    g_hairTipWidth+=dy;
  }
  else
  {
    g_hairLength =max(  g_hairLength +dx*20.f, 0.05f);
    g_hairStiffness =max( g_hairStiffness+ dy, 0.f);
  }
}
float glastVel = 0.f;
public void mouseReleased()
{
  float mx  =((float)(mouseX)/(float)width)*2.f-1.f;
  float my = ((float)(mouseY)/(float)height)*2.f-1.f;
  float d = mx*mx + my*my;
  if ( d < 0.1f)
    g_movement.Hit();
}
float PresetHairStyles[]={
  0.99f,41.31f,7.72f,0.66f,
  0.49f,60.78f,1.23f,0.168f,
  0.88f,28.81f,2.67f,1.67f,
  0.66f,58.53f,5.26f,0.01f,
  0.43f,12.24f,1.1f,0.0f,
  0.57f,26.34f,-3.3f,2.32f,
  1.43f,59.1224f,3.04f,0.54f,
  0.5f,20.f,2.f,0.5f
};
 
PVector hairColors[]= {
  new PVector(.109f, .037f, .007f),
  new PVector(.519f, .325f, .125f),
  new PVector( .109f, .05f, .109f),
  new PVector(.9f, .4f, 0.9f),
  new PVector( .007f, .109f, .037f),
  new PVector(.2f,  .7f, .5f),
  new PVector( .2f, .109f, .037f),
  new PVector(1.f,  .7f, 1.f)
};
public void drawDropShadow(float rad )
{
  beginShape(TRIANGLE_FAN);
  fill(0,0,0,12);
  vertex(0.0f,100.001f,0.0f);   
  for (float ang = 0.f; ang <= (2.0f * PI+0.001f); ang += 2.0f * PI/16.f)
    vertex(sin(ang)*rad, 100.001f,cos(ang)*rad);
  endShape();
}
public int DrawHairBall( float time,float quality, boolean isLow, GazeControl gaze )
{
  pushMatrix();
 
  drawDropShadow(constrain( (120+ g_hairLength -g_movement.y),0,80 + g_hairLength ));
  drawDropShadow(constrain( (60+ g_hairLength -g_movement.y),0,60+ g_hairLength) );
  float vel = -g_movement.yvel*0.01f;
  glastVel = 0.7f*glastVel + 0.3f*vel;
 
  // select hair color at random and blend
  float hairColorIndex = noise(time*0.01f+12497)*10.f;
  float hI = floor(hairColorIndex);
  float hbl = hairColorIndex - hI;
  int hl =hairColors.length;
  int hIdx0 = ((int)hI*2 )% hl;
  int hIdx1 = ((int)(hI+1)*2 )% hl;
  hl = hl*hl*(3-2*hl);
  hl = hl*hl*(3-2*hl);
  PVector rootColor = lerp(hairColors[hIdx0], hairColors[hIdx1], hbl );
  PVector tipColor = lerp(hairColors[hIdx0+1], hairColors[hIdx1+1], hbl );
 
   HairShader hs = new HairShader( rootColor,tipColor);
  // rotate to face
  float rot = gaze.lx*.25f;
  rotateY(rot);
  rotateX(-gaze.ly*.25f);
  PVector view = new PVector(sin(rot),0.f,-cos(rot));
  translate( 0, -g_movement.y,0);
 
  int step = 1;
  float rw= g_hairRootWidth;
  float tw = g_hairTipWidth;
  if ( isLow )
  {
    step = 4;
    rw *=3;
    tw *=2;
  }    
  beginShape(QUADS);
  int count =0;
  for(int i =0; i < hairball.length; i+=step)
    if (IsVis(hairball[i], view))
      count +=  DrawCurveAdaptive(hairball[i], view, hs, rw, tw, quality );
  endShape(QUADS);

  lights();
  sphereDetail( isLow ? 8 : 16 );
 
  fill(0);
  sphere( 100.f);
  EyesDraw(gaze, time); 
 
  noLights();
  popMatrix();
  return count;
}
 
boolean g_DrawBabies = false;
public void keyPressed()
{
  if ( keyCode >='0' && keyCode <='7')
  {
    int code = keyCode-'0';
    g_hairStiffness = PresetHairStyles[code*4+0];
    g_hairLength  =PresetHairStyles[code*4+1];
    g_hairRootWidth = PresetHairStyles[code*4+2];
    g_hairTipWidth =PresetHairStyles[code*4+3];
    return;
  }
  if ( keyCode =='H' || keyCode == 'h')
    g_drawHelp = !g_drawHelp;
  else  if  ( keyCode != SHIFT)
    g_DrawBabies = !g_DrawBabies;
}
public void draw()
{ 
  background(color(196,196,196));
  float time = (float)millis()/1000.f;
 
  g_movement.Update(time);
  for (int i = 0; i  < 7; i++)
    g_gaze[i].update(time+ +15897*i);
 
  float groundH = g_movement.y+100.f;
 
  ApplyVelocityToCurves( hairball, new PVector(0.f,glastVel -0.96f,0.f), g_hairStiffness, g_hairLength, groundH);
 
  translate( width/2, height*9/16);
  int numSegs = DrawHairBall( time,24.f, false, g_gaze[0]);
 
  // draw babies
  int numBabies = g_DrawBabies ? 6 :0;
  for (int i =0 ; i < numBabies;i++)
  {
    pushMatrix();
    translate( -(i*width)/8 + width/2 - 40 + ((i > 2) ? -140.f: 0.f), -height/8);
    scale(0.3f);      
    numSegs +=DrawHairBall( time+15897*(i+1),100.f,true,  g_gaze[i+1]);
 
    popMatrix();
  }
  if ( g_drawHelp)
  {
    textMode(SCREEN);
    text(  "| Fps " + (int)frameRate +"| NumSegs " + numSegs + "| Stiffness "
      + g_hairStiffness +"| Length "+g_hairLength +"| Root Width " + g_hairRootWidth
      + "| Tip Width " +g_hairTipWidth, 20,height-20);
  }
}

 

// character
class GazeControl
{
  float lx;
  float ly;

  GazeControl()
  {
    lx =0;
    ly = 0;
  }
  public void update( float time )
  {
    float mx  = ((float)((float)mouseX/(float)width)* 2.f-1.f);
    float my = ( (float)((float)mouseY/(float)height)* 2.f-1.f);

    float x = 0.f;
    float y =0.f;

    if ( abs(mx)<0.90f && abs(my) <0.90f)
    {
      x += mx;
      y += my;
    }
    else
    {
      x += constrain(noise( time*.2f+1257.f)*4.f-2.f,-1.f,1.f);
      y+= constrain(noise( time*.2f+127.f)*4.f-2.f,-1.f,1.f);
    }
    // blend with previous to stop pops
    lx = lerp(lx,x,0.1f);
    ly = lerp(ly,y,0.1f);
  }
};
public void EyesDraw( GazeControl gaze, float time )
{
  // eyes -> add blinking    
  float pupilOffsetX = gaze.lx*7.f;
  float pupilOffsetY =gaze.ly*10.f;    
  float blinkAmount = constrain((noise( time*6.f+1257.f)-0.65f ) *1.f/0.2f,0.f,1.f);

  float xeye = -20.f;
  for (int i =0;i < 2; i++)
  {
    pushMatrix();
    translate(xeye,-30,80.f);
    scale(1.f,1.3f,0.8f);
    fill(~0);
    pushMatrix();
    scale(1.f,1.f-blinkAmount,1.f);
    sphere(20.f);
    popMatrix();
    translate(pupilOffsetX,pupilOffsetY,15.f);
    fill(0);
    scale(1.f,1.1f,0.8f);
    sphere(10.f);
    popMatrix();
    xeye = 20.f;
  }
}

class Movement
{
  float y;
  float yvel;
  float ltime;
  Movement()
  {
    y = height*4.f;
    yvel=0.f;
    ltime =0.f;
  }
  public void Hit()
  {
    yvel += 800.f;
  }
  public void Update( float time)
  {
    float gravity = -698.2f;
    float dt = time - ltime;
    yvel += gravity *dt;
    y += yvel*dt;
    if ( y <= 0.f)
    {
      if ( yvel <= 0.f)
      {
        if ( yvel > -120.f)
          yvel = 0.f;
        yvel = -yvel*.6f;
      }
      y =0.0f;
    }
    yvel *=0.97f;
    ltime = time;
  }
}


//  hair
public PVector Average(PVector a, PVector b)
{
  return new PVector( .5f*(a.x+b.x), .5f*(a.y+b.y),.5f*(a.z+b.z));
}

class Curve
{
  PVector[] p;
  float     v0;
  float     v1;
  Curve() { 
    p = new PVector[4];
  }
  Curve( PVector _p[])
  {
    p = _p;
    v0 =0.f;
    v1 = 1.f;
  }

  public float distancePointsToLine( PVector p0, PVector p1, PVector l1, PVector l2)
  {
    PVector ul = new PVector();
    ul.set(l2);
    ul.sub(l1);
    //ul.normalize();  - not required

    PVector dp0 = new PVector();
    dp0.set(p0);
    dp0.sub(l1);

    PVector dp1 = new PVector();
    dp1.set(p1);
    dp1.sub(l1);

    float area0 = ul.cross(dp0).mag();
    float area1 = ul.cross(dp1).mag();
    return area0 + area1;
  }
  public boolean IsFlat( float pswidth)
  {
    float tol =  pswidth;
    // from http://www.antigrain.com/research/adaptive_bezier/index.html
    // simple flatness test distance of  point to line
    // Try to approximate the full cubic curve by a single straight line
    //------------------
    float dx = p[3].x-p[0].x;
    float dy = p[3].y-p[0].y;
    float dz = p[3].z-p[0].z;

    float lenSq = (dx*dx + dy*dy + dz*dz);

    float d2pd3 = distancePointsToLine( p[1],p[2],p[0],p[1]);
    return ((d2pd3)*(d2pd3) < tol * lenSq);
  }
  public Curve[] Subdivide( )
  {
    Curve curves[] = new Curve[2];
    curves[0] = new Curve();
    curves[1] = new Curve();
    curves[0].p[0 ] = p[0 ];
    curves[1].p[3 ] = p[3 ];
    curves[0].p[1 ] =  Average( p[0],p[1]);
    curves[1].p[2 ] =  Average( p[2 ],p[3]);

    final PVector p11 = Average(p[1],p[2]);
    curves[0].p[2] = Average(curves[0].p[1], p11);
    curves[1].p[1]=  Average(curves[1].p[2],p11);

    final PVector p30 = Average(curves[0].p[2 ], curves[1].p[1]);
    curves[0].p[3] = p30;
    curves[1].p[0] = p30;

    curves[0].v0 =v0;
    curves[1].v1 =v1;
    final float midV = .5f*(v0+v1);
    curves[0].v1 =midV;
    curves[1].v0 =midV;

    return curves;
  }
  public void Draw( PVector view, HairShader hs, float rootW, float tipW )
  {
    PVector Light = new PVector(0.707f,0.707f,0.f);
    PVector delta = new PVector();
    delta.set(p[1]);
    delta.sub(p[0]);
    delta.normalize();

    float w0 = lerp(rootW,tipW, v0);
    PVector tangent = view.cross( delta);
    tangent.normalize();
    tangent.mult(w0);
    PVector col0 = hs.GetShade(delta,view, Light, v0 );

    delta.set(p[3]);
    delta.sub(p[2]);
    delta.normalize();

    float w1 = lerp(rootW,tipW, v1);
    PVector tangent2 = view.cross( delta);
    tangent2.normalize();
    tangent2.mult(w1);

// note one of these is a duplicate
// could calculate on a split
    PVector col1 =  hs.GetShade(delta,view, Light, v1 );  
    fill( color(col0.x*255.f,col0.y*255.f,col0.z*255.f));

    vertex( p[0].x - tangent.x, p[0].y - tangent.y, p[0].z - tangent.z);
    vertex( p[0].x + tangent.x, p[0].y + tangent.y, p[0].z  + tangent.z);

    fill( color(col1.x*255.f,col1.y*255.f,col1.z*255.f));
    vertex( p[3].x + tangent2.x, p[3].y + tangent2.y, p[3].z + tangent2.z);
    vertex( p[3].x - tangent2.x, p[3].y - tangent2.y, p[3].z - tangent2.z);
  }
}

public boolean IsVis( Curve cp, PVector view )
{
  PVector dir = new PVector();
  dir.set(cp.p[1]);
  dir.sub(cp.p[0]);
  return dir.dot(view) < 0.0f;
}
public int DrawCurveAdaptive(  Curve  cp, PVector view,HairShader hs, float rootW, float tipW,
float quality )
{
  Curve[] stack = new Curve[64];
  int stptr = 0;
  int count =0;

  quality = quality/(float)width;

  while( true)
  {
    if ( cp.IsFlat(quality) )
    {
      cp.Draw(view, hs, rootW, tipW);
      count++;
      if ( stptr == 0)
      {
        return count;
      }
      cp = stack[--stptr];
      continue;
    }
    Curve[] cps = cp.Subdivide();
    cp = cps[0];
    stack[stptr++] = cps[1];
  }
}
public PVector lerp( PVector a, PVector b, float t)
{
  return new PVector( lerp(a.x,b.x,t),lerp(a.y,b.y,t),lerp(a.z,b.z,t));
}
public float pow6(float v)
{
  float v2  = v*v;
  float v4 = v2*v2;
  return v4*v;
}
// http://graphics.stanford.edu/lab/soft/purgatory/prman/Toolkit/AppNotes/appnote.19.html#hair
class HairShader
{
  PVector rootcolor;
  PVector tipcolor;
  PVector speccolor;
  float amb;

  HairShader( PVector _r, PVector _t )
  {
    tipcolor = _t;
    rootcolor = _r;
    speccolor =  new PVector( (1.f + tipcolor.x)*.5f,
                          (1.f + tipcolor.y)*.5f,
                          (1.f + tipcolor.z)*.5f);

    float Ks = .35f ;
    speccolor.mult(Ks);

    final float Ka = 1.f;
    amb = 0.3f* Ka;
  }

  public PVector GetShade(
  PVector T, // tangent along length of hair
  PVector V,   // V is the view vector
  PVector L,  // normalized light direction
  float   v // normalized length along curve
  )
  {
    final float Kd = .6f; //, roughness = .15;

    // Loop over lights, catch highlights as if this was a thin cylinder    
    float cosang =cos (abs (acos (T.dot(L)) - acos (-T.dot(V) )));
    float Cspec =max(v * pow6 (cosang),0.f);  //, 1/roughness)

    float Cdiff = v*Kd;
    // We multipled by v to make it darker atthe roots.  This
    // assumes v=0 at the root, v=1 at the tip.

    Cdiff += amb;
    
    PVector hcolor = lerp(rootcolor, tipcolor, v);
    PVector Ci = new PVector();
    Ci.set( hcolor);
    Ci.mult(Cdiff);

    PVector Cs = new PVector();
    Cs.set(speccolor);
    Cs.mult(Cspec);
    Ci.add(Cs);
    
    // apply gamma
    Ci.x= sqrt(Ci.x);
    Ci.y= sqrt(Ci.y);
    Ci.z= sqrt(Ci.z);
    return Ci;
  }
};

public void ApplyVelocityToCurves( Curve[]  curves, PVector vel,
float stiffness, float len, float groundH )
{
  vel.mult(stiffness);
  for (int i =0; i < curves.length; i++)
  {
    Curve cp = curves[i];
    // calculate expected end point
    PVector dir = new PVector();
    dir.set(cp.p[1]);
    dir.sub(cp.p[0]);
    dir.normalize();
    PVector endpoint = new PVector();
    endpoint.set(dir);
    endpoint.sub(vel);
    // renormalize to keep lenght
    endpoint.normalize();

    cp.p[1].set(dir);
    cp.p[1].mult(len*.25f);
    cp.p[1].add(cp.p[0]);

    cp.p[3].set(endpoint);
    cp.p[3].mult(len);
    cp.p[3].add(cp.p[0]);

    cp.p[2].set(endpoint);
    cp.p[2].add(dir);
    cp.p[2].mult(len*.75f*.5f);
    cp.p[2].add(cp.p[0]);

    // project up to ground
    PVector xzDir = new PVector();
    xzDir.set(dir);
    xzDir.y=0.f;
    xzDir.normalize();
    
    float ex = min( -(cp.p[2].y-groundH),0.f);
  
    cp.p[2].x -= ex * xzDir.x;
    cp.p[2].z -= ex * xzDir.z;
    cp.p[2].y +=ex;
    ex = min( -(cp.p[3].y-groundH), 0.f);
    cp.p[3].x -= ex * xzDir.x;
    cp.p[3].z -= ex * xzDir.z;
    cp.p[3].y +=ex;
  }
}
public Curve[] GenerateCurvesOnSphere( int amt, float rad,
float clength)
{
  Curve[] cps = new Curve[amt*amt];

  PVector cut0 = new PVector(-20,-30,80.f);
  PVector cut1 = new PVector(20,-30,80.f);
  float cutSize = 25.f; 
  int cnt = 0; 
  for (int i = 0; i < amt; i++)
    for (int j = 0; j < amt; j++)
    {
      float u = ((float)i + random(0,1))/(float)amt;
      float v = ((float)j + random(0,1))/(float)amt;

      // http://mathworld.wolfram.com/SpherePointPicking.html
      float theta = u*2.f*PI;
      float phi =acos(2.f*v-1.f);

      PVector nrm = new PVector( sin(phi)*cos(theta), cos(phi), sin(phi)*sin(theta));
      PVector p = new PVector();
      p.set(nrm);
      p.mult(rad);

      // check for invalid areas ( eyes)
      PVector cutD0 = new PVector();
      PVector cutD1 = new PVector();

      cutD0.set(cut0);
      cutD0.sub(p);

      cutD1.set(cut1);
      cutD1.sub(p);
      if (cutD1.mag() < cutSize || cutD0.mag() < cutSize)
        continue;

      // tilt normal
      nrm.x += noise(p.x*3.f,p.y*3,p.z*3.f)*2.f-1;
      nrm.y += noise(p.y*3.f,p.z*3,p.x*3.f)*2.f-1;
      nrm.z += noise(p.z*3.f,p.x*3,p.y*3.f)*2.f-1;

      PVector[] pts = new PVector[4];
      pts[0] = p;

      pts[1] = new PVector();
      pts[1].set(nrm);
      pts[1].mult(clength*.25f);
      pts[1].add(p);

      pts[3] = new PVector();
      pts[3].set( nrm);
      pts[3].mult(clength);
      pts[3].add(p);

      pts[2] = new PVector();
      pts[2].set(nrm);
      pts[2].mult(clength*.75f);
      pts[2].add(p);

      cps[ cnt] = new Curve( pts);
      cnt++;
    }
  Curve[] rcps = new Curve[cnt];
  for (int i =0; i < rcps.length; i++)
    rcps[i]=cps[i];

  return rcps;
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#F0F0F0", "hairball" });
  }
}


// additive blends a sphere on the screen
void DrawLightGlow( PVector p, float sc, float b)
{
  //smooth();
  PVector vel = new PVector(2.,3.,0.);
  
  int cx = (int)p.x*ss.textScale() + ss.width()/2;
  int cy = (int)p.y*ss.textScale() + ss.height()*9/16;
  int sx = constrain(cx-(int)sc,0,ss.width());
  int sy = constrain(cy-(int)sc,0,ss.height());
  int ey = constrain(cy+(int)sc,0,ss.height());
  int ex = constrain(cx+(int)sc,0,ss.width());
  float csc = 1./(sc*sc);
  for (int y = sy; y <ey; y++)
  {
    float dy = (float)(y-cy);
    dy*=dy;
    int idx = y*ss.width() + sx;
    for (int x = sx; x < ex; x++,idx++)
    {
      float dx = (float)(x-cx);
      float iten = dx * dx + dy;
      iten *=csc;
      iten = constrain(1.-iten,0.,1.)*b;
      iten*=iten;
      iten*=iten;
      color c = pixels[idx];
      pixels[idx] = color(red(c) +iten*230,green(c) +iten*200,blue(c) +iten*180.,255);
    }
  }
//  noSmooth();
  
}
PVector NoiseOffset( float time, float offset)
{
  PVector p = new PVector(
    noise(time*2.+offset)*2.-1.,
    noise(time*2.+offset+1275.13)*2.-1.,
    noise(time*2.+offset+869.78)*2.-1.
    );
  p.normalize();
  return p;
}
class Streamer
{
  PVector col;
  PVector[] points;
  Streamer( PVector _c) 
  {
    col=_c;
  }
  void update( PVector pos, float time, float offset )
  {
    PVector rpos = new PVector();
    rpos.set( NoiseOffset(time,offset));
    rpos.mult(30.);
    rpos.add(pos);
    if ( points == null )
    {
      points = new PVector[12];
      for (int i = 0; i < points.length;i++)
      {
        points[i]=new PVector();
        points[i].set(rpos);
      }
    }
    for (int i = points.length-1; i >0;i--)
      points[i].set(points[i-1]);
    points[0].set(rpos);
  }
  void Draw(PVector view )
  {
//    smooth();
    noFill();
    strokeWeight(2);
    beginShape();

    for(int i =0; i < points.length-1; i++)
    {      
      float w = 1. - (float)i/((float)points.length-1);
      w = sqrt(w);
      stroke(color(col.x,col.y,col.z,255.*w));
      curveVertex( points[i].x,  points[i].y,0.);
    }
    endShape();
    noStroke();
  }
  void DrawGlow()
  {
     DrawLightGlow( points[1], 18,1.);
  }
}


// supersampling with guassian blur 
final float clamp(float a) {
    return (a < 1) ? a : 1;
  }
class SuperSampler
{
PImage downsampled;
PImage tempImage;
PGraphics pgDirect;
PGraphics pg;
 boolean m_useDirect=false;
boolean m_tempUseDirect=false;

// from http://www.teamten.com/lawrence/graphics/gamma/
float GAMMA = 2.0;
int[] linear_to_gamma = new int[32769];
void SetupGammaTables()
{
    for (int i = 0; i < 32769; i++) {
        int result = (int)(sqrt(i/32768.0)*255.0 + 0.5);
        linear_to_gamma[i] = result;
    }
} 
SuperSampler()
{
  SetupGammaTables();
  pgDirect=g;
  pg= createGraphics(width*2,height*2,P3D);
  tempImage = createImage(width,height*2, RGB); 
}
void useDirect(boolean v) { m_tempUseDirect=v;}
int textScale(){ return m_useDirect ? 1 : 2;}

int height() { return pgDirect.height*textScale();}
int width() { return pgDirect.width*textScale();}


void GuassianSampleSpanFast( color[] inpix, color[] outpix, int stride, int offset0, int offset1, int width )
{
  int idx0 = offset0 +2*stride;
  int idx1 = offset1;
 
  int stride2 = stride*2;
  for (int i=2;i<width-2;i+=2)
  {   
    // convert to all integer
    // TODO perform gamma space correction
    color c0=inpix[idx0-stride2];
    int r0 =  c0 >> 16 & 0xFF;
    int g0 =  c0  >> 8 & 0xFF;
    int b0 =  c0  & 0xFF;
   
    r0=r0*r0;
    g0=g0*g0;
    b0=b0*b0;
   
    c0 = inpix[idx0+stride2];
    int r4 = c0 >> 16 & 0xFF;
    int g4 = c0 >> 8 & 0xFF;
    int b4 = c0  & 0xFF;
    r4=r4*r4;
    g4=g4*g4;
    b4=b4*b4;
   
    c0 = inpix[idx0-stride];
    int r1 = c0 >> 16 & 0xFF;
    int g1 = c0 >> 8 & 0xFF;
    int b1 = c0 & 0xFF;
    r1=r1*r1;
    g1=g1*g1;
    b1=b1*b1;
    c0 = inpix[idx0+stride];
    int r2 = c0  >> 16 & 0xFF;
    int g2 = c0  >> 8 & 0xFF;
    int b2 = c0  & 0xFF;
    r2=r2*r2;
    g2=g2*g2;
    b2=b2*b2;
   
    r2 = (r1+r2)<<2; // *4
    g2 = (g1+g2)<<2;
    b2 = (b1+b2)<<2;
   
    c0 = inpix[idx0];
    int r3 = c0 >> 16 & 0xFF;
    int g3 = c0 >> 8 & 0xFF;
    int b3 = c0  & 0xFF;
    r3=r3*r3;
    g3=g3*g3;
    b3=b3*b3;
    int r = r0+r4+r2+r3*6;
    int g = g0+g4+g2+g3*6;
    int b = b0+b4+b2+b3*6;
 
    r = linear_to_gamma[ r >>5]; // /16
    g = linear_to_gamma[g >>5];
    b = linear_to_gamma[b >>5]; 
    
    color res = (r<<16)|(g<<8)|b;
    outpix[idx1]= res;
    idx1+=stride;
    idx0+=stride2;
  }   
}
void GuassianSampleSpanFirst( color[] inpix, color[] outpix, int stride, int stridex, int stridex2,
                          int offset0, int offset1, int width, int step )
{
  int idx0 = offset0 +2*stride;
  int idx1 = offset1;
 
  int stride2 = stride*2;
 
  color c0=inpix[idx0];
 
  int r0 =  c0 >> 16 & 0xFF;
  int g0 =  c0  >> 8 & 0xFF;
  int b0 =  c0  & 0xFF;
  r0=r0*r0;
  g0=g0*g0;
  b0=b0*b0;
   
  int r1=r0;int r2=r0;
  int g1=g0;int g2=g0;
  int b1=b0;int b2=b0; 
  for (int i=step;i<width-step;i+=step)
  {   
    c0 = inpix[idx0];
    int r3 = c0 >> 16 & 0xFF;
    int g3 = c0 >> 8 & 0xFF;
    int b3 = c0  & 0xFF;
    r3=r3*r3;
    g3=g3*g3;
    b3=b3*b3;
   
    c0 = inpix[idx0+1];
    int r4 = c0 >> 16 & 0xFF;
    int g4 = c0 >> 8 & 0xFF;
    int b4 = c0 & 0xFF;
    r4=r4*r4;
    g4=g4*g4;
    b4=b4*b4;
   
    int r = r0+r4+((r1+r3)<<2)+r2*6;
    int g = g0+g4+((g1+g3)<<2)+g2*6;
    int b = b0+b4+((b1+b3)<<2)+b2*6;
 
     r0=r2;g0=g2;b0=b2;
     r1=r3;g1=g3;b1=b3;
     r2=r4;g2=g4;b2=b4;
       
    r = linear_to_gamma[ r >>5]; // /16
    g = linear_to_gamma[g >>5];
    b = linear_to_gamma[b >>5]; 
    color res = (r<<16)|(g<<8)|b;
    outpix[idx1]= res;// transpose here
    idx1++;
    idx0+=2;
  }   
}
 
 
import java.util.concurrent.atomic.AtomicInteger;

AtomicInteger g_guassianWorkCnt;
 
class GuassianStrip implements WorkItem
{
  PImage in;
  color[]  out;
  PImage temp;
  int pass;
  int s;
  int e;

  GuassianStrip( PImage _in, color[]  _out, PImage _temp, int _pass, int _s, int _e) {
    pass=_pass;s=_s;e=_e;in=_in;out=_out;temp=_temp;
  }
  public void run(int threadId )
  {
    if ( pass==0){
       for (int i=s;i<e;i++)
            GuassianSampleSpanFirst( in.pixels, temp.pixels, 1, 1,2,i*in.width, i*temp.width, in.width,2);

      if ( g_guassianWorkCnt.decrementAndGet()==0){
         int oh=temp.width;
         int amt=(oh/32)+(oh%32)==0 ? 0 : 1;
         g_guassianWorkCnt.set(amt);
         for (int i=1;i<oh-2;i+=32)
          g_renderQueue.execute( new GuassianStrip(in,out,temp,1,i,min(i+32,oh-2)));
      }  
    }
    else
    {
        for (int i=s;i<e;i++)
          GuassianSampleSpanFast( temp.pixels, out, temp.width, i,i,temp.height);
      
    //  if ( g_guassianWorkCnt.decrementAndGet()==0)    
      //    pgDirect.updatePixels();

    }
  }
};
 

void DownSampleGuassian( PImage in, color[] out, PImage temp )
{
  in.updatePixels();   
    int oh=in.height;
   int amt=(oh/32)+(oh%32)==0 ? 0 : 1;
   
    g_guassianWorkCnt  = new AtomicInteger(amt);
     for (int i=1;i<oh-2;i+=32)
    {
      g_renderQueue.execute( new GuassianStrip(in,out,temp,0,i,min(i+32,oh-2)));
    }
}
// faster version required
void Apply()
{
  loadPixels();
  DownSampleGuassian( pg, pixels, tempImage);
} 
void beginDraw(boolean reset){
  m_useDirect=m_tempUseDirect;
  pgDirect =(g);
  if (!m_useDirect){
    g=pg;
    pg.beginDraw();
    if (reset)
      pg.resetMatrix();
     else{
      pg.scale(2,2,1);
     }
  }
}
void endDraw()
{
   if (!m_useDirect)
   {
     pg.endDraw();
     g=pgDirect;
     Apply();
   }
}
}


