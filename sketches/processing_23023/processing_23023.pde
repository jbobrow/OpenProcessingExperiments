
class Bush {

  private Vec2D Root;
  int depthReached;
  float plantScale;
  boolean sectionComplete = false;
  private boolean plantComplete = false; 

  private TColor plantCol;

  Bush( Vec2D root )
  {
    Root = root;
    plantCol=TColor.GREEN.getAnalog(20, 0.5);


    plantScale = norm(Root.y,0.0,height);
  }


  void update()
  {
  }


  boolean isComplete()
  {
   if (depthReached > MAX_DEPTH)
    {
       return true; 
    }
    else
    {return false;}
  }

  void draw ()
  {

    Vec2D section;

    if (sectionComplete && depthReached <= MAX_DEPTH)
    {

      //draw next trunk kink
      smooth();
      stroke(plantCol.toARGB());
      float brangle = random(-10,10);
      float yangle = 30.0* plantScale;

      section = new Vec2D(Root.x+brangle, Root.y-yangle);

      strokeWeight(10*plantScale*(1.0-depthReached/5.0));

      tl.line(Root, section);

      depthReached++;
      sectionComplete = false;
      Root = section;
      noSmooth();
    }
    else if (!sectionComplete)
    {

      if (depthReached <= MAX_DEPTH)
      {

        for (int b =0; b<depthReached; b++)
        {
          drawBranches(Root,depthReached,plantScale);
        }
        
        
        for (int i=0;i<5; i++)
        {
        VerletParticle2D p = new VerletParticle2D(Root);
        physics.addParticle(p);
        // add a negative attraction force field around the new particle
        physics.addBehavior(new AttractionBehavior(p, 10, -0.5f, 0.01f));
        }
        
        sectionComplete = true;
      }
    }
    
   
  }

  void drawBranches( Vec2D root, int depth, float scl)
  {

    //println(depth);


    float brangle = random(-30,30);  // choose branch angle

    float brlen =  100 * scl *(1.0-depth/7.0);

    //println(brlen);

    int nd = depth+1;

    pushMatrix();

    translate(root.x, root.y);
    rotate(radians(brangle));

    Vec2D section = new Vec2D(0,-brlen);

    for (int i=0; i<=depth; i++)
    {

      strokeWeight(1);
      line(0,0, 0, -brlen);

      if (depth > MAX_DEPTH)
      {
        flower(0,(int)-brlen, scl);
      }

      else //if (depth <= MAX_DEPTH)
      {

        drawBranches(section, nd, scl);
      }
    }

    popMatrix();
  }

  void flower(int px, int py, float scl)
  {

    TColor fCol =TColor.YELLOW.getAnalog(50, 0.3);
    stroke(fCol.toARGB());  // yellow- ish

    int steps = int (10.0 * scl);
    int radius = int (10.0 * scl);
    float x = 0;
    float y = 0;
    
    beginShape(LINES);

    for(int i=0; i<steps+1; i++) {

       x = px+sin( TWO_PI/steps*i)*radius;

       y = py+cos( TWO_PI/steps*i)*radius;

      vertex(x,y);
      vertex(px,py);
    }
    endShape();
    
   


    stroke (plantCol.toARGB());
  }
}


