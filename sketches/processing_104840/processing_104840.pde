
public static final double BORDER = 10;
public static final int NUM_RED_BUGS = 20;
public static final int NUM_BLUE_BUGS = 20;
public static ArrayList<Bug> bugsRed = new ArrayList<Bug>();
public static ArrayList<Bug> bugsBlue = new ArrayList<Bug>();

void setup()
{
  frameRate(30);
  size(1000, 600);
  for(int i = 0; i < NUM_RED_BUGS; i++)
  {
    double posX = BORDER + Math.random()*(0.25*width - 2*BORDER);
    double posY = BORDER + Math.random()*(height - 2*BORDER);
    double dir = Math.random()*2*Math.PI;
    
    bugsRed.add(new Bug(posX, posY, dir, bugsRed, bugsBlue, new int[]{255, 0, 0}));
  }
  for(int j = 0; j < NUM_BLUE_BUGS; j++)
  {
    double posX = width*0.75 + Math.random()*(width - BORDER - width*0.75);
    double posY = BORDER + Math.random()*(height - 2*BORDER);
    double dir = Math.random()*2*Math.PI;
    
    bugsBlue.add(new Bug(posX, posY, dir, bugsBlue, bugsRed, new int[]{0, 0, 255}));
  }
}

void draw()
{
  //update
  for(Bug b: bugsRed)
  {
    b.update();
  }
  for(Bug b: bugsBlue)
  {
    b.update();
  }
  
  for(Bug b: bugsRed)
  {
    b.update2();
  }
  
  for(Bug b: bugsBlue)
  {
    b.update2();
  }
  
  //render
  background(255);
  stroke(0);
  rect((float)BORDER, (float)BORDER, (float)(width - 2*BORDER), (float)(height - 2*BORDER));
  for(Bug b: bugsRed)
  {
    b.render();
  }
  for(Bug b: bugsBlue)
  {
    b.render();
  }
}
public class Bug
{
  public static final double SIZE = 5,
                             VELOCITY = 2, //1
                             DIR_INC = 0.05,
                             NOTICE_RAD = 50, //30
                             DETERRATION = 0;
  public static final int ROAM = 0,
                          EXPLORE = 1,
                          ATTACK = 2,
                          BREED = 3,
                          MERGE = 4,
                          RALLY = 5;
  
  public boolean isDead;
  public double posX, posY, direction;
  public double goalX, goalY;
  public ArrayList<Bug> bugs;
  public ArrayList<Bug> enemyBugs;
  public int task;
  public int[] colour;
  public Bug targetBug;
  
  public Bug(double x, double y, double dir, ArrayList<Bug> bgs, ArrayList<Bug> ebgs, int[] clr)
  {
    posX = x; posY = y; direction = dir; bugs = bgs; enemyBugs = ebgs; task = MERGE; colour = clr; targetBug = null;
    isDead = false;
  }
  
  public void update()
  {
    if (isDead == true)
      return;
      // Sets the current task
    if(mousePressed)
      task = RALLY;
    else if(hasVisibleEnemyBugs())
      task = ATTACK;
    else if(hasBugsInRange())
      task = MERGE;
    else
      task = ROAM;
    
    // Updates the direction of the bug to achieve its task
    switch(task)
    {
      case ROAM:    if(Math.random() < 0.5)
                      direction += DIR_INC;
                    else
                      direction -= DIR_INC;
                    break;
      case MERGE:   double[] pos = getAverageBugPos();
                    goalX = pos[0]; goalY = pos[1];
                    turnToGoal();
                    break;
      case ATTACK:  targetBug = getAttackBug();
                    goalX = targetBug.posX; goalY = targetBug.posY;
                    turnToGoal();
                    break;
      case BREED:   break;
      case EXPLORE: break;
      case RALLY:   goalX = mouseX; goalY = height - mouseY;
                    turnToGoal();
    }
    
  }
  
  public void update2()
  {
    if (isDead)
      return;
    
    
    // Change position of bug
    posX += VELOCITY*Math.cos(direction);
    posY += VELOCITY*Math.sin(direction);
    
    // Attack if needed
    if(targetBug != null && getDistance(targetBug) <= 0)
      attack();
      
    // Account for wall collisions
    if(posX < BORDER + SIZE/2)
      posX = BORDER + SIZE/2;
    else if(posX > width - BORDER - SIZE/2)
      posX = width - BORDER - SIZE/2;
    if(posY < BORDER + SIZE/2)
      posY = BORDER + SIZE/2;
    else if(posY > height - BORDER - SIZE/2)
      posY = height - BORDER - SIZE/2;  
  }
  
  public void render()
  {
    if (isDead)
      return;
    fill(255, 255, 255, 0);
    stroke(colour[0], colour[1], colour[2]);
    ellipse((float)posX, (float)(height - posY), (float)(2*NOTICE_RAD), (float)(2*NOTICE_RAD));
    line((float)posX, (float)(height - posY), (float)(posX + NOTICE_RAD*Math.cos(direction)), (float)(height - posY - NOTICE_RAD*Math.sin(direction)));
    ellipse((float)posX, (float)(height - posY), (float)SIZE, (float)SIZE);
  }
  
  /**
   * Turns the bug in a direction that would get it towards its goal
   */
  public void turnToGoal()
  {
    double dir = getVectorDirDiff(direction, getDirection(posX, posY, goalX, goalY));
    boolean deter = false;
    if(Math.random() < DETERRATION)
      deter = true;
    if(dir < 0)
    {
      if(!deter)
        direction -= DIR_INC;
      else
        direction += DIR_INC;
    }
    else if(dir > 0)
    {
      if(!deter)
        direction += DIR_INC;
      else
        direction -= DIR_INC;
    }
  }
  
  public Bug getAttackBug()
  {
    return getClosestEnemyBugInRange();
  }
  
  public Bug getClosestEnemyBugInRange()
  {
    double dist = Math.sqrt(height*height + width*width) + 5;
    Bug closest = null;
    ArrayList<Bug> eBugs = getAllEnemyBugs();
    for(Bug b: eBugs)
    {
      double d = getDistance(b);
      if(!b.isDead && d < dist)
      {
        dist = d;
        closest = b;
      }
    }
    return closest;
  }
  
  public void attack()
  {
    if (targetBug.targetBug != this)
      targetBug.isDead = true;
    else
    {
      if (Math.random() < 0.5)
        targetBug.isDead = true;
      else
        isDead = true;
    }
    targetBug.targetBug = null;
    targetBug = null;
  }
  
  /**
   * Gets the distance between this bug and the parameter bug
   */
  public double getDistance(Bug b)
  {
    return Math.sqrt((b.posX - posX)*(b.posX - posX) + (b.posY - posY)*(b.posY - posY)) - 2*SIZE;
  }
  
  /**
   * Gets an ArrayList of all bugs within the notice radius of this bug
   */
  public ArrayList<Bug> getBugsInRange()
  {
    ArrayList<Bug> bgs = new ArrayList<Bug>();
    for(Bug b: bugs)
    {
      if(b != this && !b.isDead && isWithinRange(b))
        bgs.add(b);
    }
    return bgs;
  }
  
  /**
   * Gets an ArrayList of all enemy bugs within the notice radius of this bug
   */
  public ArrayList<Bug> getEnemyBugsInRange()
  {
    ArrayList<Bug> bgs = new ArrayList<Bug>();
    for(Bug b: enemyBugs)
    {
      if(!b.isDead && isWithinRange(b))
        bgs.add(b);
    }
    return bgs;
  }
  
  /**
   * Returns the coordinates of the average position of all bugs within this bugs notice range
   * *To be changed to all connected bugs*
   */
  public double[] getAverageBugPos()
  {
    double posXSum = 0; double posYSum = 0;
    ArrayList<Bug> connected = new ArrayList<Bug>();
    getConnectedBugs(connected);
    for(Bug b: connected)
    {
      posXSum += b.posX; posYSum += b.posY;
    }
    if(connected.size() == 0)
      return new double[]{-1, -1};
    return new double[]{posXSum/connected.size(), posYSum/connected.size()};
  }
  
  /**
   * Returns true if there are bugs within this bugs notice radius
   */
  public boolean hasBugsInRange()
  {
    for(Bug b: bugs)
    {
      if(b != this && !b.isDead && isWithinRange(b))
        return true;
    }
    return false;
  }
  
  /**
   * Returns true if there are enemybugs within this bugs notice radius
   */
  public boolean hasEnemyBugsInRange()
  {
    for(Bug b: enemyBugs)
    {
      if(!b.isDead && isWithinRange(b))
        return true;
    }
    return false;
  }
  
  /**
   * Returns true if this bug has information on any enemy bug
   */
  public boolean hasVisibleEnemyBugs()
  {
    ArrayList<Bug> eBugs = getAllEnemyBugs();
    for(Bug b: eBugs)
    {
      if(!b.isDead)
        return true;
    }
    return false;
  }
  
  /**
   * Retrns true if the parameter bug is within the notice radius of this bug
   */
  public boolean isWithinRange(Bug b)
  {
    if(getDistance(b) <= NOTICE_RAD)
      return true;
    return false;
  }
  
  /**
   * Gets the directed difference between two angles
   */
  public double getVectorDirDiff(double dirFrom, double dirTo)
  {
    double dirDiff = correctAngle(dirTo - dirFrom);
    if(dirDiff >= Math.PI)
      dirDiff = -(2*Math.PI - dirDiff);
    return dirDiff;
  }
  
  /**
   * Gets the direction of (x1, y1) from (x0, y0)
   */
  public double getDirection(double x0, double y0, double x1, double y1)
  {
    return correctAngle(Math.atan2((y1 - y0), (x1 - x0)));
  }
  
  /**
   * Returns an equivalent angle between 0 and 360 degrees
   */
  public double correctAngle(double angle)
  {
    if(angle >= 2*Math.PI)
      return angle;
    else if(angle < 0)
    {
      while(angle < 0)
        angle += 2*Math.PI;
    }
    return angle;
  }
  
  /**
   * Adds all connected bugs to the passed ArrayList
   */
  public void getConnectedBugs(ArrayList<Bug> bgs)
  {
    ArrayList<Bug> closeBugs = getBugsInRange();
    boolean first = false;
    if(bgs.size() == 0)
      first = true;
    closeBugs.add(this);
    for(Bug b: closeBugs)
    {
      if(!bgs.contains(b))
      {
        bgs.add(b);
        b.getConnectedBugs(bgs);
      }
    }
    if(first)
      bgs.remove(this);
  }
  
  /**
   * Returns all the enemy bugs that can be seen by the connected network of this bug
   */
  public ArrayList<Bug> getAllEnemyBugs()
  {
    ArrayList<Bug> connected = new ArrayList<Bug>();
    connected.add(this);
    getConnectedBugs(connected);
    ArrayList<Bug> eBugs = new ArrayList<Bug>();
    for(Bug b: connected)
    {
      ArrayList<Bug> e = b.getEnemyBugsInRange();
      for(Bug b2: e)
      {
        if(!eBugs.contains(b2))
          eBugs.add(b2);
      }
    }
    return eBugs;
  }
  
  public String toString()
  {
    return "Pos: (" + posX + ", " + posY + ")\tDir: " + direction*180/Math.PI;
  }
  
  /**
   */
  //public ArrayList<Bug> combineWithoutDuplicates(ArrayList<Bug> bugs1, ArrayList<Bug> bugs2)
  //{
  //  ArrayList<Bug> bgs = new ArrayList<Bug>();
  //  for(Bug b1: bugs1)
  //  {
  //    bgs.add(b1);
  //  }
  //  for(Bug b2: bugs2)
  //  {
  //    if(!bgs.contains(b2))
  //      bgs.add(b2);
  //  }
  //  return bgs;
  //}
}


