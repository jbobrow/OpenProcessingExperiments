

// sketch: PG_AlgebraicSurface_Balls.pde - by Ing. Gerd Platl
//
// Simulation: Approximate balls to selected algebraic surface.
//
// http://openprocessing.org/portal/?userID=7234
// v1.0 25.08.2011  inital release
// v1.1 26.08.2011  surface name & help text added
// v2.0 27.09.2011  dynamic call of surface function 
//      17.10.2011  using forces summary
//      15.12.2011  last changes
//
// algorithm:
// - place balls at random positions within a cube
//   and get algebraic surface value at it's position
// - repeat for every ball:
//   - get new position by adding a random direction step
//   - get new surface value at new position
//   - if new value is nearer to zero than current value:
//     -> move ball to the new position
//     -> save new value as current value
//   - if balls are closer than a given distance:
//     -> push away nearby balls
//     -> calculate current value of pushed balls
//   - colorize ball depending of it's RGB cube position
// 
// Algebraic Surface Examples:     
//   http://www.bru.hlphys.jku.at/surf/
//   http://www1-c703.uibk.ac.at/mathematik/project/bildergalerie/gallery.html                               
// Algebraic Surface Solver:      
//   http://www.javaview.de/services/algebraic/index.html
//   http://www.imaginary2008.de/surfer.php?lang=en
//   http://k3dsurf.sourceforge.net/
// german:
//   http://media2mult.uos.de/pmwiki/fields/cg-II-09/index.php?n=VolumeRendering.VolumeRendering
//   http://www.spektrum.de/artikel/967715&_z=798888

/*
Simulation: Approximate balls to selected algebraic surface.
 
 key commands:
 f10, h toogle help
 cursor left/right auto scrolling
 cursor up/down turn up/down
 0 .. 9  select surface
 F1, backspace show previous surface
 F2, blanc show next surface
 F3, + zoom in
 F4, - zoom out
 F5 less balls
 F6 more balls
 F8 toggle pause
 o toggle rotate
 c toogle cube
 d toogle debugging
 p show pushing lines
 u toogle update
 t toogle transparency
 r restart
 s save SurfaceBalls#.png
 z reset camera
--------------------------*/

// import processing.opengl.*;

int initSurface = 8;       // index of first surface

int maxBalls = 2000;       // maximum number of balls
int useBalls = 1000;       // maximum number of balls
int ballno = 100;          // starting with n balls

int s = 200;               // half base size
float rsMin = 0.1;         // min. random step
float rsMax = 5.0;         // max. random step 
float rstep = rsMax;       // current random step
float rsMult = 0.998;      // random step multiplier

float pushMin =  1.0;      // min push distance 
//float pushMin =  20.0;      // min push distance 
float pushMax = 40.0;      // max push distance 
float pushDist = pushMax;  // min distance of 2 balls for pushing
float pushMult = 0.99;     // push distance multiplier

boolean paused = false;    // global flags
boolean drawCube = true;   
boolean doUpdate = true;
boolean doRotate = false;
boolean showHelp = false;
boolean transparent = false;
boolean debug = false;
boolean showPush = false;
boolean showBalls = false;

PSurface surface;          // handle surface functions

//----------
void setup()
{
  //  size(800, 800, !online ? OPENGL : P3D);
  size(800, 800, P3D);
  frameRate(30);
  colorMode (RGB);
  sphereDetail (6, 6);  // set sphere details
  setupBalls();         // set balls to random positions
  surface = new PSurface(initSurface);
  //frameRate(1);
}
//---------
void draw()
{
  background(116, 150, 255);

  // set light v1
  ambientLight(100, 100, 180);
  directionalLight(555, 555, -555, 1, -1, -1);
  
  HandleCamera();
  
  // draw wire cube
  if (drawCube)
  {
    noFill ();
    smooth();
    stroke (44, 44, 128, 88);
    strokeWeight(2);
    box(2*s);
    // draw base plane
    fill (1, 100, 128, 28);
    beginShape (QUADS);
      vertex(-s, -s, -s);
      vertex( s, -s, -s);
      vertex( s, -s, s);
      vertex(-s, -s, s);
    endShape();
  }

  // draw light source
  /*
  noStroke();
  fill (255, 255, 0);
  pushMatrix();
  translate (s,100,s);
  sphere (12);
  popMatrix();
  */

  updateBalls();      // move and draw balls
  pushAwayBalls();    // push nearly balls away

  if (doRotate) rotX += 1.9;

  if (frameCount < 40) 
    showText("press h for help", width/2-30, 60);

  fill(255);
  textMode(SCREEN);
  if (showHelp)                          // F10: show help
  {
    fill(255);
    //    textMode(SCREEN);
    text(surface.name + "    0..6:surface  F1:prev  F2:next  o:rotate  r:restart  s:savePic  F3/F4,+/-/z:zoom, <esc>", 10, 16);
    text("on/off:  c:cube  d:debug  h: help  t:transparent  u:update position  p:pushLines  fps:" + nf(frameRate, 0, 1), 10, 36);
  }
  else text(surface.name, 10, 16); 

  if (showBalls)
  { 
    showText("use " + useBalls + " balls", width/2-30, 60);  
    showBalls = false;
  }

  if (debug)
    println ("fps: " + nf(frameRate, 0, 2)
      +"  rs=" + nf(rstep, 0, 2)
      +"  pushD=" + nf(pushDist, 0, 2)
      +"  rX=" + nf(rotX, 0, 1)
      +"  rY=" + nf(rotY, 0, 1)
      +"  fov=" + nf(fov, 0, 2)
      +"  balls=" + nf(ballno, 0));

  if (showPush)
    drawPushFunction();
}

//-----------------------------------
void keyPressed()
{
  //  if (debug) println (keyCode + " '" + key + "'    ");

  if      (keyCode ==  LEFT) rotX -= 0.5;   // <- auto scroll to left
  else if (keyCode == RIGHT) rotX += 0.5;   // -> auto scroll to right
  else if (keyCode ==    UP) rotY += 0.5;   // W: scroll up
  else if (keyCode ==  DOWN) rotY -= 0.5;   // S: scroll down
  else if ((keyCode ==   112)                      // F1
        || (keyCode ==     8)) ChangeSurface (-1);  // backspace
  else if ((keyCode ==   113)                      // F2
        || (keyCode ==    32)) ChangeSurface (+1);  // blanc
  else if ((key     >=   '0')
        && (key     <=   '9')) SelectSurface(keyCode-48);   // 0..n: select function
  else if (key =='o') doRotate = !doRotate;
  else if (key =='c') drawCube = !drawCube;
  else if (key =='d') debug = !debug;
  else if (key =='p') showPush = !showPush;
  else if (key =='u') doUpdate = !doUpdate;
  else if (key =='t') transparent = !transparent;
  else if (key =='r') restartBalls();
  else if (key =='s') save ("SurfaceBalls" + surface.index + ".png");  // save picture as file
  else if ((keyCode ==   114)
        || (key     ==   '+')) fov /= 1.01;           // F3, +  zoom in
  else if ((keyCode ==   115)
        || (key     ==   '-')) fov *= 1.01;           // F4, -  zoom out
  else if (keyCode ==   116) changeBallCount(-10);    // F5  less balls
  else if (keyCode ==   117) changeBallCount(+10);    // F6  more balls      
  else if (keyCode ==   119) paused = !paused;        // F8  more balls      
  else if ((key     ==   'h')
        || (keyCode ==   121)) showHelp = !showHelp;  // F10,  H: toggle help text
  else if (key == 'z') ResetCamera();
  else if (!showHelp)
    showText("press h for help", width/2-30, 60);
}
//----------------------------------------------------------
void mouseClicked()
{
  if (mouseButton == CENTER) ResetCamera();
}

//===================================
//    handle camera
//===================================
float rotX = 0;            // vertical angle
float rotY = 100;          // horizontal angle
float fov = 1.2;           // vertical field-of-view angle (in radians)
//----------------
void ResetCamera()
{
  rotX = 0;         // vertical angle
  rotY = 100;       // horizontal angle
  fov = 1.2;        // vertical field-of-view angle (in radians)
  doRotate = false;
}  
//------------------
void HandleCamera()
{
  beginCamera();
  if (fov < 0.1) fov = 0.1;
  if (fov > 1.5) fov = 1.5;
  perspective(fov, float(width)/height, 1, 10000);

  if (mousePressed)
  {
    rotX -= 0.5 * (mouseX - pmouseX);
    rotY += 0.5 * (mouseY - pmouseY);
  }
  camera (0, rotY, 400, // eyeX, eyeY, eyeZ
          0, 15, 0,     // centerX, centerY, centerZ
          0, -1, 0);    // upX, upY, upZ
  endCamera();
  rotateY (rotX / 100.0);    // left/right
}

//----------------------------------------------------------
// show 2d text
//----------------------------------------------------------
void showText(String infoText, int x, int y)
{
  fill(255);
  textMode(SCREEN);
  text(infoText, x, y);
}

//===================================
//    handle SURFACES
//===================================
void SelectSurface (int sno)
{
  surface.SelectFunction(sno);
  restartBalls();
}
//-----------------------------------
void ChangeSurface (int delta)
{
  surface.SelectFunction(surface.index + delta);
  restartBalls();
}

//===================================
//    handle BALLS
//===================================

ArrayList balls = new ArrayList();

//-----------------------------------
//  create balls
//-----------------------------------
void setupBalls()
{
  for ( int bi = 0; bi < maxBalls; bi++ )
  {
    Ball b = new Ball();
    b.id = bi;
    balls.add (b);
  }
}
//-----------------------------------
void restartBalls()
{
  println ("selected surface: " + surface.index + "  " + surface.name);
  pushDist = pushMax;
  doUpdate = true;
  ballno = 100;
  for (int bi = 0; bi < balls.size(); bi++ )
  {
    Ball b = (Ball)balls.get(bi);
    b.create();
  }
  rstep = rsMax;
}
//-----------------------------------
// do ball animation 
//-----------------------------------
void updateBalls()
{
  noSmooth();
  for (int bi = 0; bi < ballno; bi++ )
  {
    Ball b = (Ball)balls.get(bi);
    if (!paused) 
      b.update();
    b.draw();
  }
  if (!paused) if (rstep > rsMin) 
  rstep *= rsMult;  // reduce random step size 

  if (ballno != useBalls)
  { 
    if (ballno <= useBalls-10) ballno+=10;  // use more balls ?
    if (ballno < useBalls) ballno++;        // use more balls ?
    if (ballno > useBalls) ballno--;        // use less balls ?
    if (ballno >= useBalls+10) ballno-=10;  // use less balls ?
  }
}
//-----------------------------------
// do ball animation 
//-----------------------------------
void changeBallCount (int deltaCount)
{
  useBalls = constrain(useBalls + deltaCount, 100, maxBalls);
  showBalls = true;
  if (deltaCount > 0)
    if (rstep < rsMax) rstep += 0.1;
}
//-----------------------------------
// draw push away function
//-----------------------------------
void drawPushFunction()
{
  stroke (188, 111);
  line(-s, 0, -s, s, 0, -s);

  stroke (188, 188, 111);
  float kold = 0.0;
  for (float xi = -s; xi < s; xi++)
  { 
    float dist = (10.0 * xi) / s; 
    float k = 40 * rstep * (1/(1+sq(dist)));
    if (xi > -s) line(xi, kold, -s, xi+1, k, -s);
    kold = k;
  }
}
//-----------------------------------
// try to distribute balls uniformly:
// - select a random ball
// - check distance to other balls
// - if distance < 10 -> push it away
//-----------------------------------
void pushAwayBalls()
{
  if (paused) return;

  float minValue = 11.0;  // min ball value
  float pushDistSq = sq(pushDist);
  Ball a, b;
  float x, y, z, k, dq = 0.0;
  PVector ap, bp;
  PVector d = new PVector();

  stroke (222, 55, 55, 155);
  strokeWeight(2);

  int pushCount = 0;
  for (int ai = 0; ai < ballno; ai++)
  {
    a = (Ball)balls.get(ai);
//    a.pos.z = 0;    // only for plane testing
    ap = a.pos;
    if (a.value > minValue) continue;
    for (int bi = ai+1; bi < ballno; bi++)
    {
      b = (Ball)balls.get(bi);
      bp = b.pos;
      x = bp.x - ap.x;
      if (b.value < minValue)
      if (abs(x) < pushDist)
      {
        y = bp.y - ap.y;
        if (abs(y) < pushDist)
        {
          z = bp.z - ap.z;
          if (abs(z) < pushDist) 
          {
            dq = x*x+y*y+z*z;
            if (dq < pushDistSq) 
            {
              pushCount++;
              k = 2 / (1+dq);    // 0.0 < force <= 1.0
              d.set (x*k, y*k, z*k);
              
              // println (nf(ai,4) + '-' + nf(bi,4) + ": " + nf(a.value,6,6)
              //  + "  x=" + nfs(x,0,2) + "  y=" + nfs(y,0,2) + "  z=" + nfs(z,0,2)  + "  k=" + nfs(8000*k,6,0));
              
              a.force.sub(d);  // push back ball a
              b.force.add(d);  // push away ball b
              if (showPush)
              { 
                stroke (222, 55, 55, 111+k*100);
                line(a.pos.x, a.pos.y, a.pos.z, bp.x, bp.y, bp.z);
              }
            }
          }
        }
      }
    }
  }
  if (showPush) showText("pushes: " + pushCount, width/2-30, 80); 
  if (showPush) showText("pushDist: " + nf(pushDist, 0, 2), width/2-30, 100); 
  if ((pushCount > 1000) && (pushDist > pushMin))  pushDist *= pushMult;
}


//===================================
//    class definition of BALLS
//===================================
public class Ball
{
  int id;
  PVector pos;        // current position
  PVector force;      // summary of forces
  float value;        // function value at pos
  int ballSize;       // ball size 
  color ballColor;    // ball color

  //-----------
  public Ball()    // constructor
  {
    create();
  }
  //-----------
  float SquareDist(PVector pnt)
  {
    return sq(pos.x-pnt.x) + sq(pos.x-pnt.x);
  }
  //------------------
  public void create()     // create new ball
  {
    pos = new PVector (random(-s, s), random(-s, s), random(-s, s));
    force = new PVector ();
    value = 99999999.9;
  }

  //------------------
  public void update()    // move the ball
  {
    PVector newPos = new PVector ();

    pos.add (force);                  // move to new position
//    force.set(0,0,0);                 // reset force 
    force.mult(0.25);                  // reduce force
    pos.x = constrain(pos.x, -s, s);  // hold ball in cube
    pos.y = constrain(pos.y, -s, s);
    pos.z = constrain(pos.z, -s, s);
    value = abs(surface.Value(pos));  // get new value

    if (doUpdate)
    {
      // do some random move
      newPos.set (pos.x+random(-rstep, rstep)
                 ,pos.y+random(-rstep, rstep)
                 ,pos.z+random(-rstep, rstep));
      //------------------------------------------
      float newValue = abs(surface.Value(newPos));    // get function value
      //------------------------------------------
      if (newValue < value)                           // new value closer to zero ?
      {
        //        println (nf(id,4) + ": " + "  value=" + nfs(value,6,2)+ "  new=" + nfs(newValue,6,2));
        pos.set (newPos);
        value = newValue;
      }
    }
    // get ball color
    ballSize = round(constrain (170-value*1.5, 0, 170));  // 0 .. 170
    if (transparent) ballColor = color((pos.x+s)/s*126, (pos.y+s)/s*126, (pos.z+s)/s*126, ballSize);
    else             ballColor = color((pos.x+s)/s*126, (pos.y+s)/s*126, (pos.z+s)/s*126);
  }

  //------------------
  public void draw()   // draw the ball
  {
    
    if (ballSize < 40)
    {                       // draw point
      stroke(ballColor);
      strokeWeight(2);
      point(pos.x, pos.y, pos.z);
    }
    else
    {                      // draw sphere
      fill (ballColor);
      noStroke();
      pushMatrix();
      translate (pos.x, pos.y, pos.z);
      sphere (1+ballSize*0.01);
      popMatrix();
    }
  }
}


