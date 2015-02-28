

//==========================================================
// file:   Attractors.pde - by Gerd Platl
// implements class Attractors                   
// v1.0  2013-07-14  inital release
// v1.1  2013-11-21  added Aizawa Attractor
//       2013-11-21  working on ...
//----------------------------------------------------------
// infos:
//   http://www.3d-meier.de/Galerie/Attraktor/Attraktor.html
//   http://www.3d-meier.de/tut19/Seite0.html
//   http://www.behance.net/gallery/MathRules-Strange-Attractors/7618879
//   http://chaoticatmospheres.com/125670/1204030/gallery/mathrules-strange-attractors
//   http://paulbourke.net/fractals/
//----------------------------------------------------------
// content:
//  interface AttractorFunction     attractor function definition
//  implementations of attractor functions
//  class Attractor                 attractor handling
//     Attractor (index)            constructor
//     selectFunction(index)        select attractor 
//     selectPrevious()             select previous attractor
//     selectNext()                 select next attractor
//     createCurve()                create new attractor curve
//     advanceCurve()               advance attractor curve 
//     drawCurve()                  draw attractor curve
//     drawPoints()                 draw attractor points
//     savePicture()                save attractor picture
//     writeAttractorList()          list of all attractors
//
//==========================================================

int Lorenz = 0;
int Roessler = 1;
int Aizawa = 2;
int Arneodo = 3;
int Chen = 4;
int ChenLee = 5;
int Thomas = 6;
int Platl = 7;
//int LotkaVolterra = 8;
//int MooreSpiegel = 9;
int startAttractor = Lorenz;    // attractor starting index

PVector startPosition = new PVector(1.0, 0.0, 0.0);

float a, b, c, dt;       // attractor parameters   
float zDist, scf, csf;   // 3d parameters 

//----------------------------------------------------------
// set list of all attractors 
//----------------------------------------------------------
AttractorFunction[] attractors = new AttractorFunction[]
{ 
  new LorenzAttractor(),
  new RoesslerAttractor(),
  new AizawaAttractor(),
  new ArneodoAttractor(),
  new ChenAttractor(),
  new ChenLeeAttractor(),
  new ThomasAttractor(),
  new PlatlAttractor(),
//  new LotkaVolterraAttractor(),
//  new MooreSpiegelAttractor(),
};

//----------------------------------------------------------
// function definition: calculate value at given 3d position 
//----------------------------------------------------------
interface AttractorFunction 
{ 
  String getName();               // return attractor name
  void initParameters();          // set attractor parameters
  void getNextPosition (PVector pos);   // calc next position
  PVector step = new PVector();   // help vector
}
//----------------------------------------------------------
void randomStartPosition(float range)
{
  startPosition.set (random(range),random(range), random(range));
}

//==========================================================
// define class Attractor to handle current attractor functions
//==========================================================
class Attractor
{
  int index;                // current function index 
  String name;              // attractor name
  AttractorFunction sFunc;  // current attractor function
  int count = attractors.length;  // number of attractors

  // curve 
  int curvePointCount = 10000;   // number of curve points
  int newPointCount = 20;        // number of curve points to add
  LinkedList<PVector> curve = new LinkedList<PVector>();
  
  //---------------------------------------------------------
  // constructor:  set attractor function by index
  //---------------------------------------------------------
  public Attractor (int functionIndex) 
  { 
    selectFunction (functionIndex);
  }

  //---------------------------------------------------------
  // select attractor function by index
  //---------------------------------------------------------
  void selectFunction(int functionIndex) 
  { 
    index = (functionIndex + count) % count;
    name = attractors[index].getName();
    println("select: " + index + "  " + name);
    sFunc = attractors[index];     // set function call
    sFunc.initParameters();
    createCurve();
  }
  //---------------------------------------------------------
  // select previous attractor function
  //---------------------------------------------------------
  void selectPrevious() 
  {
    selectFunction (index - 1);
  } 
  //---------------------------------------------------------
  // select next attractor function
  //---------------------------------------------------------
  void selectNext() 
  {
    selectFunction (index + 1);
  } 

  //---------------------------------------------------------
  // create a new attractor curve
  //---------------------------------------------------------
  void createCurve()
  {
    //println ("createCurve()");
    curve.clear();
    PVector p = new PVector();
    p.set(startPosition);
    for (int i = 0; i < curvePointCount; i++) 
    {
      p = new PVector(p.x, p.y, p.z);
      sFunc.getNextPosition(p);  // calculate next position
      curve.add(p);
    }
  }
  //---------------------------------------------------------
  void advanceCurve() 
  { 
    //println ("advanceCurve(" + newPointCount + ")");
    for (int ni = 1; ni<newPointCount; ni++)
    {
      PVector p = curve.pollFirst();   // take and remove the first PVector from list
  //    print (ni + " ");
      p.set(curve.peekLast());         // copy values from the most advanced PVector
      sFunc.getNextPosition(p);  // calculate next position
      curve.add(p);
    }
  //  println();
  }
  //---------------------------------------------------------
  void drawCurve()
  {
    Iterator<PVector> it = curve.iterator();
    PVector q, p = it.next();  // first point
//    if (frameCount == 300)
//      println (p);             // show curve position
    while (it.hasNext ()) 
    {
      q = it.next();             // second point
      stroke(color( (q.x - p.x) * csf
                   ,(q.y - p.y) * csf
                   ,(q.z - p.z) * csf, 88));
      line ( p.x*scf, p.y*scf, p.z*scf + zDist
           , q.x*scf, q.y*scf, q.z*scf + zDist);
      //point(p.x,p.y,p.z);
      p.set(q);    // p = q
    }
  }
  //---------------------------------------------------------
/*
  void drawPoints()  // v2.0
  {
    Iterator<PVector> it = curve.iterator();
    PVector q, p = it.next();   // first point
    PShape aShape = createShape(); 
    aShape.beginShape(POINTS);
    aShape.strokeWeight(thickness*2);
    while (it.hasNext ()) 
    {
      q = it.next();             // second point
      aShape.stroke(color( (q.x - p.x) * csf
                          ,(q.y - p.y) * csf
                          ,(q.z - p.z) * csf, 88));
      
      aShape.vertex(p.x*scf, p.y*scf, p.z*scf + zDist);
//      aShape.vertex(q.x*scf, q.y*scf, q.z*scf + zDist);
     
      p.set(q);    // p = q
    }
    aShape.endShape();
    shape(aShape);
  }
*/
  //---------------------------------------------------------
  // save attractor picture as "<attractorName>.png"
  //---------------------------------------------------------
  void savePicture()
  {
    save(name + ".png");
  }
  //---------------------------------------------------------
  // write list of all attractors
  //---------------------------------------------------------
  void writeAttractorList()
  {
    for (int ni = 0; ni < count; ni++)
      println (ni + ":  " + attractors[ni].getName()); 
  }
}    // end of class Attractor



//==========================================================
// implementation of attractor functions
//==========================================================

//---------------------------------------------------------
// Lorenz attractor
// http://en.wikipedia.org/wiki/Lorenz_system
// http://paulbourke.net/fractals/lorenz/
//---------------------------------------------------------
class LorenzAttractor implements AttractorFunction 
{ 
  String getName() { return "Lorenz Attractor"; }
  
  // initialize attractor parameters
  void initParameters()
  {
    a = 10.0;
    b = 28.0;
    c = 8.0 / 3.0;   
    dt = 0.75;
    zDist = -200.0;
    scf = 7.0;
    csf = 255.0;
    randomStartPosition(1.0);
  }

  // calculate next attractor position
  void getNextPosition(PVector p) 
  {
    step.x = a * (p.y - p.x);
    step.y = p.x * (b - p.z) - p.y;
    step.z = p.x * p.y - c * p.z;
    step.mult (dt / step.mag());    // step *= dt / |step|;
    p.add(step);                    // p = p + step;
  }
}

//---------------------------------------------------------
// Roessler attractor
// http://en.wikipedia.org/wiki/R%C3%B6ssler_attractor
// http://paulbourke.net/fractals/rossler/
//---------------------------------------------------------
class RoesslerAttractor implements AttractorFunction 
{ 
  String getName() { return "Rössler Attractor"; }

  // initialize attractor parameters
  void initParameters()
  {
    a = 0.1;
    b = 0.1;
    c = 14;   
    dt = 0.5;
    zDist = -100.0;
    scf = 5.3;
    csf = 255.0;
  }

  // calculate next attractor position
  void getNextPosition(PVector p) 
  {
    step.x = -p.y -p.z;      
    step.y = p.x + a * p.y;
    step.z = b + p.z * (p.x - c);
    step.mult (dt / step.mag());    // step *= dt / |step|;
    p.add(step);                    // p = p + step;
  }
}
//---------------------------------------------------------
// Aizawa Attractor
// http://www.3d-meier.de/tut19/Seite3.html
//---------------------------------------------------------
class AizawaAttractor implements AttractorFunction 
{ 
  String getName() { return "Aizawa Attractor"; }

  // initialize attractor parameters
  void initParameters()
  {
    a = 0.95;
    b = 0.7;
    c = 0.6;
    
    dt = 0.02;
    zDist = -55.0;
    scf = 111.0;
    csf = 5555.0;
    startPosition.set(0.01, 0.01, 0.005);
    randomStartPosition (0.01);
  }

  // calculate next attractor position
  void getNextPosition(PVector p) 
  {
    float d = 3.5;
    float e = 0.25;
    float f = 0.1;
    float xy = p.x * p.y;
    step.x =  (p.z - b) * p.x - d * p.y;   
    step.y = d * p.x + (p.z - b) * p.y;
    step.z = c + a * p.z - pow(p.z,3)*0.3333333 - (p.x*p.x+p.y*p.y)*(1+e*p.z) + f*p.z*pow(p.x,3);
    step.mult (dt / step.mag());    // step *= dt / |step|;
    p.add(step);                    // p = p + step;
  }
}
//---------------------------------------------------------
// Arneodo attractor
// http://www.3d-meier.de/tut19/Seite4.html
// http://pinterest.com/pin/549509592003619333/
//---------------------------------------------------------
class ArneodoAttractor implements AttractorFunction 
{ 
  String getName() { return "Arneodo Attractor"; }

  // initialize attractor parameters
  void initParameters()
  {
    a = -5.5;
    b = 3.5;
    c = -1.0;   
    dt = 0.08;
    zDist = 0.0;
    scf = 18.0;
    csf = 3333.0;
    startPosition.set(0.1, 0.0, 0.0);
    //randomStartPosition(0.1);
  }

  // calculate next attractor position
  void getNextPosition(PVector p) 
  {
    step.x = p.y;      
    step.y = p.z;
    step.z = -a*p.x - b*p.y -p.z + c*(p.x*p.x*p.x);
    step.mult (dt / step.mag());    // step *= dt / |step|;
    p.add(step);                    // p = p + step;
  }
}

//---------------------------------------------------------
// Chen Attractor
// http://www.3d-meier.de/tut5a/Seite42.html
//---------------------------------------------------------
class ChenAttractor implements AttractorFunction 
{ 
  String getName() { return "Chen Attractor"; }

  // initialize attractor parameters
  void initParameters()
  {
    a = 35.0;
    b = 8 / 3.0;
    c = 28;   
    dt = 0.5;
    zDist = -170.0;
    scf = 6.66;
    csf = 355.0;
    startPosition.set(-3.0, 2.0, 20.0);
  }

  // calculate next attractor position
  void getNextPosition(PVector p) 
  {
    step.x = a * (p.y - p.x);      
    step.y = (c - a)*p.x - p.x * p.z + c* p.y;
    step.z = p.x * p.y - b*p.z;
    step.mult (dt / step.mag());    // step *= dt / |step|;
    p.add(step);                    // p = p + step;
  }
}
//---------------------------------------------------------
// Chen-Lee Attractor
// http://pinterest.com/pin/549509592003619326/
//---------------------------------------------------------
class ChenLeeAttractor implements AttractorFunction 
{ 
  String getName() { return "Chen-Lee Attractor"; }

  // initialize attractor parameters
  void initParameters()
  {
    a = 5.0;
    b = -10;
    c = -0.38;   
    dt = 0.5;
    zDist = -100.0;
    scf = 8.0;
    csf = 255.0;
    startPosition.set(-3.0, 2.0, 20.0);
  }

  // calculate next attractor position
  void getNextPosition(PVector p) 
  {
    step.x = a * p.x - p.y * p.z;      
    step.y = b * p.y + p.x * p.z;
    step.z = c * p.z + p.x * p.y / 3.0;
    step.mult (dt / step.mag());    // step *= dt / |step|;
    p.add(step);                    // p = p + step;
  }
}
//---------------------------------------------------------
// Thomas Attractor
// http://www.behance.net/gallery/MathRules-Strange-Attractors/7618879
// http://pinterest.com/pin/549509592003619270/
//---------------------------------------------------------
class ThomasAttractor implements AttractorFunction 
{ 
  String getName() { return "Thomas Attractor"; }

  // initialize attractor parameters
  void initParameters()
  {
    b = 0.19;
    dt = 0.5;
    zDist = 0.0;
    scf = 40.0;
    csf = 255.0;
    startPosition.set(1.0, 0.0, 0.0);
  }

  // calculate next attractor position
  void getNextPosition(PVector p) 
  {
    step.x = -b * p.x + sin(p.y);   
    step.y = -b * p.y + sin(p.z);
    step.z = -b * p.z + sin(p.x);
    step.mult (dt / step.mag());    // step *= dt / |step|;
    p.add(step);                    // p = p + step;
  }
}
//---------------------------------------------------------
// Platl Attractor
//---------------------------------------------------------
class PlatlAttractor implements AttractorFunction 
{ 
  String getName() { return "Platl Attractor"; }

  // initialize attractor parameters
  void initParameters()
  {
    a = 0.07;
    b = 0.033;
    c = 0.11;
    dt = 0.4;
    zDist = 0.0;
    scf = 15.0;
    csf = 255.0;
    startPosition.set(1.0, 2.0, 3.0);
  }

  // calculate next attractor position
  void getNextPosition(PVector p) 
  {
    step.x = -a * p.x + b*cos(p.y) - cos(p.z);   
    step.y = -b * p.y + c*cos(p.z) - cos(p.x);
    step.z = -c * p.z + a*cos(p.x) - cos(p.y);
    step.mult (dt / step.mag());    // step *= dt / |step|;
    p.add(step);                    // p = p + step;
  }
}
//---------------------------------------------------------
// Lotka Volterra Attractor
// http://www.3d-meier.de/tut5a/Seite43.html
//---------------------------------------------------------
class LotkaVolterraAttractor implements AttractorFunction 
{ 
  String getName() { return "Lotka Volterra Attractor"; }

  // initialize attractor parameters
  void initParameters()
  {
    a = 2.9851;
    b = 3.0;
    c = 2.0;
    //a = 3.3;
    //b = 3.5;
    //c = 2.0;
    dt = 0.004;
    zDist = 1.0;
    scf = 45.0;
    csf = 255.0;
    startPosition.set(1.0, 2.0, 2.0);
  }

  // calculate next attractor position
  void getNextPosition(PVector p) 
  {
    float x2 = p.x * p.x;
    float xy = p.x * p.y;
    step.x =  p.x - xy + c*x2 - a * p.z * x2;   
    step.y = -p.y + xy;
    step.z = -b * p.z + a * p.z * x2;
    step.mult (dt / step.mag());    // step *= dt / |step|;
    p.add(step);                    // p = p + step;
  }
}
//---------------------------------------------------------
// Moore Spiegel Attractor
// http://www.3d-meier.de/tut5a/Seite49.html
//---------------------------------------------------------
class MooreSpiegelAttractor implements AttractorFunction 
{ 
  String getName() { return "Moore Spiegel Attractor"; }

  // initialize attractor parameters
  void initParameters()
  {
    a = 100.0;
    b = 26.0;
    dt = 0.9;
    zDist = 0.0;
    scf = 5.0;
    csf = 255.0;
    startPosition.set(0.1, 1.1, 0.1);
  }

  // calculate next attractor position
  void getNextPosition(PVector p) 
  {
    step.x = p.y;      
    step.y = p.z;
    step.z = -p.z -(b -a +a*p.x*p.x)*p.y - b*p.x;
    step.mult (dt / step.mag());    // step *= dt / |step|;
    p.add(step);                    // p = p + step;
  }
}


