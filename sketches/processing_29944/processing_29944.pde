
class Animal extends Cell implements Runnable
{
  protected float maxSpeed, sensoryRange;
  public Brain myBrain;
  //public PVector velocity;
  public boolean chosenCellRelative;

  float carn;

  public Animal()
  {
    super();
    
    maxSpeed = modify(2);
    sensoryRange = modify(50);

    carn = random(-.1,.2);

    myBrain = new Brain(this);
    chosenCellRelative = false;

    calcCost();
  }
  public Animal(Animal parent)
  {
    super(parent);

    //velocity = new PVector();
    maxSpeed = modify(parent.maxSpeed);
    sensoryRange = modify(parent.sensoryRange);

    carn = parent.carn;
    if((carn == 0 || carn == 1 && random() < .3) || !(carn == 0 || carn == 1))
      carn += randomNormal() * .3;

    myBrain = parent.myBrain.makeChild(this);
    chosenCellRelative = parent.myBrain instanceof BrainManual || parent.chosenCellRelative;

    calcCost();
  }

  // return a random value in the range [0..1] with normal distribution around 0.
  // Implements the Marsaglia Polar Method, as described in wikipedia, but only returns one of the values.
  float randomNormal()
  {
    float x = 1.0, y = 1.0, s = 2.0; // s = x^2 + y^2
    while(s >= 1.0)
    {
      x = random(-1.0f, 1.0f);
      y = random(-1.0f, 1.0f);
      s = x*x + y*y;
    }
    return x * sqrt(-2.0f * log(s)/s);
  }
  
  private void calcCost()
  {
    carn = constrain(carn,0,1);
    livingCost += (myDish.animalCostMod/200) + (sensoryRange/500) + (maxSpeed/1000);
  }

  public void run()
  {
    Dish nearbyCells = new Dish();

    for(int k = 0; k < myDish.size(); k++)
      if(dist(myDish.get(k)) < effectiveSensoryRange())
        nearbyCells.add(myDish.get(k));

    move(myBrain.move(nearbyCells));

    if(touchingCells.size() > 0)//if there are some adjacent cells, eat one of them
    {
      Cell best = touchingCells.get(0);

      for(int k = 1; k < touchingCells.size(); k++)
      {
        Cell c = touchingCells.get(k);

        if(myBrain.goodToEat(c) && amtGained(c) > amtGained(best))
          best = c;
      }

      if(myBrain.goodToEat(best))
      {
        w += amtGained(best);
        best.sub(amtEaten(best));
      }
    }

    if(carn == 0)
      myColor = color(70,300,360*w/maxSize);
    else if(carn == 1)
      myColor = color(-10,360,360*w/maxSize);
    else
      myColor = color(60*(1.0-carn),360,360*w/maxSize);

    super.run();
  }
  
  public void show()
  {
    pushMatrix();
    translate(loc);
    
    if(loc.dist(PVector.sub(cursor,myDish.loc)) < sqrt(w) * 1.3)
      mouseOver();
    
    if(chosenCell())
    {
      strokeWeight(2);
      stroke(240, 255, 255);
      drawCellCircle();//draw the cell
    }
    
    popMatrix();
    super.show();
  }

  public float amtGained(Cell c)
  {
    if(c instanceof Animal)
      return amtEaten(c) * .8*carn;
    else//if its a plant
    return amtEaten(c) * .25*sqrt(1.0-carn);
  }

  public float amtEaten(Cell c)
  {
    float eaten;

    if(c instanceof Animal)
      if(carn == 1)
        eaten = (carn*8) + 1;
      else
        eaten = (carn*5) + 1 - c.def;
    else//if its a plant
    if(carn == 0)
      eaten = 4;
    else
      eaten = 3.5 - c.def;

    return constrain(eaten, 0, c.w);
  }

  protected void mouseOver()
  {
    if(hasCell || dishes.size() != 1)
      return;
    
    myBrain = new BrainManual(this);
    hasCell = true;
    
    zoom = .5*width / effectiveSensoryRange();
    ((Dish)dishes.get(0)).loc = PVector.mult(loc,-1);//places the camera directly above the controlled cell
  }

  /**
  Moves the cell a distance determined by the PVector parameter.
   Decreases the size of the cell based on the distance moved.
   */
  protected void move(PVector v)
  {
    v.limit(maxSpeed);
    w -= sq(v.mag()) / 50;
    v.div(myDish.viscosity);

    loc.add(v);
    //velocity.add(v);
    loc.limit(radius);
  }

  public float effectiveSensoryRange()
  {
    return 2*sqrt(w) + sensoryRange*myDish.visibility;
  }

  public String toString()
  {
    return "  maxSpeed: "+maxSpeed+"  sensoryRange: "+sensoryRange+"  carn: "+carn+super.toString()+myBrain.toString();
  }
  
  public boolean chosenCell()
  {
    return myBrain instanceof BrainManual;
  }
}

