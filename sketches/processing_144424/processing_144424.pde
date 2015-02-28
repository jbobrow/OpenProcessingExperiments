

//==========================================================
// file: DLA3D.pde - by Gerd Platl
//
// A Diffusion Limited Aggregation in Space Simulator
//
// v1.0  2014-04-14  inital release 
//       2014-04-15  working on...
//
// http://en.wikipedia.org/wiki/Diffusion-limited_aggregation
// http://de.wikipedia.org/wiki/Diffusionsbegrenztes_Wachstum
// http://forum.processing.org/two/discussion/1532/how-to-grow-dla-over-3d-geometry/p1
// http://vimeo.com/48902614
//==========================================================

//----------------------------------------------------------------------------------------
//  handle a plant sprout 
//----------------------------------------------------------------------------------------
class Branch
{
  PVector p1, p2;     // start and end point
  float bThickness;   // diameter of the branch
  color bColor;       // branch color 

    // create root branch
  Branch (PVector root)
  { 
    p1 = new PVector(root.x, root.y, root.z);
    p2 = p1;
    bThickness = 1.0;
    bColor = color (66);
  }

  // create a branch
  Branch (PVector a, PVector b, float thickness, int aColor)
  { 
    //println (nf(thickness, 0, 2) +" " +a +" " +b);
    p1 = new PVector(a.x, a.y, a.z);
    p2 = new PVector(b.x, b.y, b.z);
    bThickness = thickness;
    bColor = aColor;
  }

  // draw branch
  void draw()
  { 
    stroke (bColor);
    strokeWeight(bThickness);
    line (p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
    //stroke(88,88,0);
    point (p2.x, p2.y, p2.z);
    /*
    pushMatrix();
      translate (p2.x, p2.y, p2.z);
      sphere(bThickness);
    popMatrix();
    */
  }
}


//----------------------------------------------------------------------------------------
// DLA3D:  Diffusion Limited Aggregation in Space
//----------------------------------------------------------------------------------------
class DLA3D
{
  int maxBranches = 10000;          // maximum branch count
  int branchCount = 0;              // current branch count 
  Branch[] branch;                  // list of all branches
  float branchLength = 4.0;         // current branch length
  float thickness = 8.0;            // current thickness
  float thick_dec = 0.005;          // decrease value of thickness
  float thick_min = 1.2;            // minimum thickness
  boolean grow = true;              // true: add branch
  
  //-----------------------------------------------------
  // create DLA 3D, set maximum number of branches 
  //-----------------------------------------------------
  DLA3D (int maxBranchCount)
  {
    maxBranches = maxBranchCount;
    branch = new Branch[maxBranchCount];
    branchCount = 0;
    grow = true;
    //println ("b=" + aBranch.size);
  }

  //-----------------------------------------------------
  // attach new branch to the organism and draw it
  //-----------------------------------------------------
  public void attach (PVector newPosition)
  {
    if (branchCount >= maxBranches) 
    { 
      grow = false;
      return;
    }

    // set starting point ? 
    if (branchCount == 0)
    {
      branch[0] = new Branch (newPosition);
      branchCount = 1;
      return;
    } 

    // find the closest branch of the organism
    float minDist = 9999;
    int pin = 0;
    for (int ni=0; ni < branchCount; ni++)
    {                      
      float distance = branch[ni].p2.dist(newPosition);
      if (distance < minDist) 
      { 
        // set closest point  
        minDist = distance;
        pin = ni;
      }
    }

    // add branch to tree
    float thick = 0.5 * (branch[pin].bThickness + thickness);
    PVector op = branch[pin].p2; 
    PVector np = new PVector();
    np.set (op);
    newPosition.sub (np);
    newPosition.normalize();
    newPosition.mult(branchLength);
    np.add (newPosition);

    float r = round(map(thick, 0, 8, 60, 111));
    float g = round(map(thick, 0, 8, 166, 60));
    float b = round(map(thick, 0, 8, 111, 60));
    branch[branchCount] = new Branch (op, np, thick, color(r, g, b));

    branchCount++;
    if (thickness >= thick_min)
      thickness -= thick_dec;   // restrain minimum stroke weight
  }

  //-----------------------------------------------------
  // draw DLA 3D
  //-----------------------------------------------------
  public void draw ()
  {
    // draw new branch
    for (int ni = 1; ni < branchCount; ni++)
    {
      strokeWeight(thickness);
      //    line (pp[count].x, pp[count].y, pp[count].z, pp[pin].x, pp[pin].y, pp[pin].z);       
      //      println (ni + ":  " + branch[ni].bColor);
      branch[ni].draw();
    }
  }
}


