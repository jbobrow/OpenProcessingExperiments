

// sketch: PG_AlgebraicSurface_Balls.pde - by Ing. Gerd Platl
// Simulation: Approximate balls to selected algebraic surface.
// http://openprocessing.org/portal/?userID=7234
// v1.0 25.8.2011
// v1.1 26.8.2011  surface name & help text added
//
// algorithm:
// - place balls at random positions within a cube
//   and get algebraic surface value at it's position
// - repeat for every ball:
//   - get new position by adding a random direction step
//   - get new algebraic surface value at new position
//   - if new value is nearer to zero than current value:
//     -> jump with ball to the new position
//     -> save new value as current value
//   - if balls are closer than a given distance:
//     -> push away nearby balls
//     -> calculate new value of pushed balls
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

// import processing.opengl.*;

int maxBalls = 1000;    // maximum number of balls
int ballno = 100;       // starting with n balls

int s = 200;            // half base size
int surface = 4;        // current surface number
int surfaces = 7;       // number of surfaces
float mrsInit = 5.0;    // mrs initalize value
float mrs = mrsInit;    // max. random step
float mrsMult = 0.998;  // mrs multiplier

float rotX = 0;         // vertical angle
float rotY = 100;       // horizontal angle
float fov = 1.2;        // vertical field-of-view angle (in radians)

boolean drawCube = true;
boolean doUpdate = true;
boolean doRotate = false;
boolean showHelp = false;
boolean transparent = false;
boolean debug = false;
boolean showPush = false;
boolean doPush = false;

//----------
void setup()
{
//  size(600, 600, !online ? OPENGL : P3D);
  size(600, 600, P3D);
  frameRate(30);
  colorMode (RGB);
  sphereDetail (6, 6);  // set sphere details
  setupBalls();         // set balls to random positions
  SelectSurface(4);
}
//---------
void draw()
{
  // set light v1
  ambientLight(100,100,180);
  directionalLight(555, 555, -555, 1, -1, -1);
/*
  // set light v2
  ambientLight(100,100,180);
  lightSpecular(204, 204, 204);
  directionalLight(192, 180, 138, 0.0, -1.0, -0.5);
  directionalLight(128, 32, 0,  0.5, -0.1, 0.5);
  specular(128, 128, 128);   
 */
 
  background(116, 150, 255);

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
            0, 15, 0,    // centerX, centerY, centerZ
            0, -1, 0);  // upX, upY, upZ
  endCamera();
  rotateY (rotX / 100.0);    // left/right

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

  if (mrs > 0.1) mrs = mrs * mrsMult;

  if (frameCount < 40) 
    showText("press h for help", 260, 60);
    
  if (showHelp)                          // F10: show help
  {
    fill(255);
    textMode(SCREEN);
    text("[" + currentName + "]  0..6:surface  F1:prev  F2:next  o:rotate  r:restart  s:savePic  F3/F4,+/-:zoom, <esc>", 10, 16);
    text("on/off:  c:cube  d:debug  t:transparent  u:update position  p:pushLines  fps:" + nf(frameRate,0,1), 10, 36);
  }  

  if (debug)
    println ("fps: " + nf(frameRate, 0, 2)
      +"  mrs=" + nf(mrs, 0, 2)
      +"  rX=" + nf(rotX, 0, 1)
      +"  rY=" + nf(rotY, 0, 1)
      +"  fov=" + nf(fov, 0, 2)
      +"  balls=" + nf(ballno, 0));
}

//-----------------------------------
void keyPressed()
{
  //  if (debug) println (keyCode + " '" + key + "'    ");

  if (keyCode ==  LEFT) rotX -= 0.5;   // <- auto scroll to left
  else if (keyCode == RIGHT) rotX += 0.5;    // -> auto scroll to right
  else if (keyCode ==    UP) rotY += 0.5;     // W: scroll up
  else if (keyCode ==  DOWN) rotY -= 0.5;     // S: scroll down
  else if ((keyCode ==   112)                      // F1
       || (keyCode ==     8)) ChangeSurface (-1);  // backspace
  else if ((keyCode ==   113)                      // F2
       || (keyCode ==    32)) ChangeSurface (+1);  // blanc

  else if ((key     >=   '0')
        && (key     <=   '6')) SelectSurface(keyCode-48);   // 1..n: select function
  else if (key =='o') doRotate = !doRotate;
  else if (key =='c') drawCube = !drawCube;
  else if (key =='d') debug = !debug;
  else if (key =='p') showPush = !showPush;
  else if (key =='u') doUpdate = !doUpdate;
  else if (key =='t') transparent = !transparent;
  else if (key =='r') restartBalls();
  else if (key =='s') save ("AlgoSurfBalls" + surface + ".png");  // save picture as file
  else if ((keyCode ==   114)
        || (key     ==   '+')) fov /= 1.01;      // F3, +  zoom in
  else if ((keyCode ==   115)
        || (key     ==   '-')) fov *= 1.01;      // F4, -  zoom out
  else if ((key     ==   'h')
        || (keyCode ==   121)) showHelp = !showHelp;    // F10,  H: toggle help text
  else if (!showHelp)
    showText("press h for help", 260, 60);
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
//  algebraic surface functions
//===================================

String[] names = {"Plane", "Cylinder", "Sphere", "Torus", "Blob", "Tetrahedral", "McMullen"};
String currentName = "";
float f1 = 25.0;
float scaleFactor = 0.025;
PVector v1 = new PVector ();
//PVector v2 = new PVector ();

//-----------------------------------
// z^2 = 0
//-----------------------------------
float Plane_SurfaceValue (PVector pos)
{
  return 0.1 * sq(pos.z);
}
//-----------------------------------
//  y^2+z^2=r^2      r=radius
//-----------------------------------
float Cylinder_SurfaceValue (PVector pos)
{
  return 0.1 * (sq(pos.z) + sq(pos.y) - 1000);
}
//-----------------------------------
// x^2+y^2+z^2 = r^2    r=radius
//-----------------------------------
float Sphere_SurfaceValue (PVector pos)
{
  return 0.1 * (sq(pos.x) + sq(pos.y) + sq(pos.z) - sq(150));
}
//-----------------------------------
// y*y +sqr(sqrt(x*x+z*z)-f1) = f2*f2
//-----------------------------------
float tr=140;    // torus radius
float rr=25*25;  // ring radius ^ 2
float Torus_SurfaceValue (PVector pos)
{
  return 0.1*(sq(pos.z) + sq (sqrt(sq(pos.x) + sq(pos.y)) - tr) - rr);
}
//-----------------------------------
// Implicit Blob Surface
//   x^2+y^2+z^2+cos(4*x)+cos(4*y)+cos(4*z)+k
//-----------------------------------
float Blob_SurfacePoint (PVector pos)
{
  v1.set(pos);
  v1.mult(0.008);   // v1 = pos * 0.008
  return 1000 * (v1.dot(v1) +cos(4*v1.x) +cos(4*v1.y) +cos(4*v1.z) -0.1);
}
//-----------------------------------
// Tetrahedral Surface
// http://www.javaview.de/services/algebraic/index.html
// (x^2 + y^2 + z^2)^2 + 8*x*y*z - 10*(x^2 + y^2 + z^2) + 25=0
//-----------------------------------
float Tetrahedral_SurfaceValue (PVector pos)
{
  v1.set(pos);
  v1.mult(scaleFactor);
  float f2 = v1.dot(v1);     // f2 = (x^2 + y^2 + z^2)
  return f2*f2 + 8 * v1.x * v1.y * v1.z - 10*f2 + 25.0;
}
//-----------------------------------
// Implicit McMullenK3
// (1 + x*x) * (1 + y*y) * (1 + z*z) + 8 * x * y * z - k
// http://local.wasp.uwa.edu.au/~pbourke/geometry/mullen/
//-----------------------------------
float McMullen_SurfaceValue (PVector pos)
{
  v1.set(pos);
  v1.mult(0.009);
  float x2 = v1.x*v1.x;
  float y2 = v1.y*v1.y;
  float z2 = v1.z*v1.z;
  return 100 * ((1+x2) * (1+y2) * (1+z2) + 8 * v1.x * v1.y * v1.z - 1.4);
}
//-----------------------------------
//  get algebraic surface value
//-----------------------------------
float Calc_Value (PVector pos)
{
  switch (surface)
  {
  case 0:
    return abs(Plane_SurfaceValue (pos));
  case 1:
    return abs(Cylinder_SurfaceValue (pos));
  case 2:
    return abs(Sphere_SurfaceValue (pos));
  case 3:
    return abs(Torus_SurfaceValue (pos));
  case 4:
    return abs(Blob_SurfacePoint (pos));
  case 5:
    return abs(Tetrahedral_SurfaceValue (pos));
  case 6:
    return abs(McMullen_SurfaceValue (pos));
  }
  return 0.0;
}



//===================================
//    handle BALLS
//===================================

ArrayList balls = new ArrayList();

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
void SelectSurface (int sno)
{
  surface = (sno + surfaces) % surfaces;
  restartBalls();
}
//-----------------------------------
void ChangeSurface (int delta)
{
  surface = (surface + surfaces + delta) % surfaces;
  restartBalls();
}
//-----------------------------------
void restartBalls()
{
  currentName = names[surface];
  if (debug) println ("starting surface: " + surface + "  " + currentName);
  doUpdate = true;
  ballno = 100;
  for (int bi = 0; bi < balls.size(); bi++ )
  {
    Ball b = (Ball)balls.get(bi);
    b.create();
  }
  mrs = mrsInit;
}
//-----------------------------------
void updateBalls()
{
  noSmooth();
  for (int bi = 0; bi < ballno; bi++ )
  {
    Ball b = (Ball)balls.get(bi);
    b.update();
  }
  if (ballno <= maxBalls-10) ballno+=10;  // use more balls ?
}
//-----------------------------------
// try to distribute balls uniformly:
// - select a random ball
// - check distance to other balls
// - if distance < 10 -> push it away
//-----------------------------------
void pushAwayBalls()
{
  float minDist = 10;
  Ball a, b;
  float x, y, z, k;
  PVector ap, bp;

  stroke (255, 88, 88);
  //  strokeWeight(1);

  for (int ai = 0; ai < ballno; ai++)
  {
    a = (Ball)balls.get(ai);
    ap = a.pos;
    if (a.value < 10.0)
      for (int bi = ai+1; bi < ballno; bi++)
      {
        b = (Ball)balls.get(bi);
        bp = b.pos;
        x = bp.x - ap.x;
        if (b.value < 6.0)
          if (abs(x) < minDist)
          {
            y = bp.y - ap.y;
            if (abs(y) < minDist)
            {
              z = bp.z - ap.z;
              if (abs(z) < minDist)
              { // get push strength
                k = mrs * (1/(1+x*x+y*y+z*z));
                x *= k;
                y *= k;
                z *= k;
                /*
                 println (nf(ai,4) + '-' + nf(bi,4) + ": " + nf(a.value,6,6)
                 + "  x=" + nfs(x,0,2) + "  y=" + nfs(y,0,2) + "  z=" + nfs(z,0,2)  + "  k=" + nfs(8000*k,6,0));
                 */
                // push away ball a
                a.pos.x -= x;
                a.pos.y -= y;
                a.pos.z -= z;
                a.value = Calc_Value(a.pos);

                // push away ball b
                b.pos.x += x;
                b.pos.y += y;
                b.pos.z += z;
                b.value = Calc_Value(b.pos);

                if (showPush)
                {
                  stroke (222, 55, 55, 155);
                  line(ap.x, ap.y, ap.z, bp.x, bp.y, bp.z);
                }
              }
            }
          }
      }
  }
}

//===================================
//    class definition of BALLS
//===================================
public class Ball
{
  int id;
  PVector pos;        // current position
  PVector newPos;     // new position
  color ballColor;    // ball color
  float value;        // function value at pos

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
    newPos = new PVector (pos.x, pos.y, pos.z);
    value = 99999999.9;
  }

  //------------------
  public void update()
  {
    if (pos.x > s) pos.x = s; else if (pos.x < -s) pos.x = -s;
    if (pos.y > s) pos.y = s; else if (pos.y < -s) pos.y = -s;
    if (pos.z > s) pos.z = s; else if (pos.z < -s) pos.z = -s;

    if (doUpdate)
    {
      // movement
      newPos.set (pos.x+random(-mrs, mrs), pos.y+random(-mrs, mrs), pos.z+random(-mrs, mrs));
      float newValue = Calc_Value(newPos);     // get function value
      if (newValue < value)                    // new value closer to zero ?
      {
        // println (nf(id,4) + ": " + "  value=" + nfs(value,6,2)+ "  new=" + nfs(newValue,6,2));
        pos.set (newPos);
        value = newValue;
      }
    }

    // get ball color
    int colorAlpha = round(constrain (255-value*1.5, 0, 255));
    if (transparent) ballColor = color((pos.x+s)/s*126, (pos.y+s)/s*126, (pos.z+s)/s*126, colorAlpha * 2 / 3);
    else             ballColor = color((pos.x+s)/s*126, (pos.y+s)/s*126, (pos.z+s)/s*126);

    // draw balls
    if (colorAlpha > 120)
    {
      fill (ballColor);
      noStroke();
      pushMatrix();
      translate (pos.x, pos.y, pos.z);
      sphere (1+colorAlpha*0.01);
      popMatrix();
    }
    else
    {
      stroke(ballColor);
      strokeWeight(2);
      point(pos.x, pos.y, pos.z);
    }
  }
}


