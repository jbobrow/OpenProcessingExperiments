
float change = 0.001;
class Amoeba extends Cell implements Alive
{
  ArrayList family = new ArrayList();
  float angle = random(6.28);
  float spd;
  float carn, herb, bitesize, vision, def = 0.01;
  float maxRadius = random(15,30);
  boolean following = false,running = false;;
  String sta = "";
  float turn = 0.3;
  boolean dead;
  public Amoeba(float x,float y,float a,float ca,float sight,float bite)
  {
    super(x,y,a);
    carn = ca;
    herb = 1-carn;
    bitesize=bite;
    checkVals();
    vision = sight;
  }
  void live()
  {
    area-=2.5*(1-sunlight);
    r = calcRadius(area,maxRadius*2);
    spd = 1-(r/100);
    checkFamily();
    following = false;
    for (int i=0;i<cells.size();i++)
    {
      Amoeba a = ((Amoeba)cells.get(i));
      if (PVector.dist(loc,a.loc)<vision*carn)
      {
        if (checkCell(a)=="GOOD")
        {
          following = true;
          break;
        }
      }
    }
    running = false;
    for (int i=0;i<cells.size();i++)
    {
      Amoeba a = ((Amoeba)cells.get(i));
      if (PVector.dist(loc,a.loc)<vision*carn)
      {
        if (checkCell(a)=="BAD")
        {
          running = true;
          break;
        }
      }
    }
    if (running&&following)
    {
      if (carn>0.3) following = true;
      else running = true;
    }
    if (area<100) die();
    if (following)
    {
      follow();
    }
    else if (running)
    {
      run();
    }
    if (!following&&!running)
    {
      lookForPlants();
    }
    if (loc.x<r)loc.x=r;
    else if (loc.x>width-r)loc.x=width-r;
    if (loc.y<r)loc.y=r;
    else if (loc.y>height-r)loc.y=height-r;
    if (selected == this)
    { 
      showStats(this);
    }
    else noStroke();
    fill((carn+herb)*255,herb*255,0);
    ellipse(loc.x,loc.y,r*2,r*2);
    for (int i=0;i<plants.size();i++)
    {
      Plant p = ((Plant)plants.get(i));
      if (PVector.dist(loc,p.loc)<r+p.r)
      {
        eat(p);
      } 
    }
    if (following)
    {
      for (int i=0;i<cells.size();i++)
      {
        Amoeba a = ((Amoeba)cells.get(i));
        if (PVector.dist(loc,a.loc)<r+a.r)
        {
          eat(a); 
        }
      } 
    }
    if (r>=maxRadius)
    {
      reproduce(this);
      cells.remove(this);
      dead = true;
      if (selected==this) selected = null;
    }
  }
  void eat(Plant p)
  {
    area+=bitesize*herb/2;
    p.area-=bitesize*herb/2;
    carn-=change*herb;
    herb+=change*herb;
    checkVals();
  }
  void eat(Amoeba a)
  {
    boolean isFamily = false;
    for (int i=0;i<family.size();i++)
    {
      Amoeba b = ((Amoeba)family.get(i));
      if (a==b) isFamily = true;
    }
    if (!isFamily)
    {
      area+=bitesize*carn;
      area*=1-a.def;
      a.area-=bitesize*carn;
      carn+=change*carn;
      herb-=change*carn;
      checkVals();
    }
  }
  void die()
  {
    if (selected==this)selected=null;
    dead = true;
    cells.remove(this);
  }
  String checkCell(Amoeba a)
  {
    String goodness = "";
    if (PVector.dist(a.loc,loc)<vision)
    {
      if ((a.carn<carn)||(a.carn>=carn&&a.r<r))
      {
        goodness = "GOOD";
      }
      else goodness = "BAD";
    }
    else goodness = "OUT_OF_RANGE";
    return goodness;
  }
  void checkVals()
  {
    if (carn<0)carn=0;
    else if (carn>1)carn=1;
    if (herb<0)herb=0;
    else if (herb>1)herb=1;
    if (bitesize<5)bitesize=5;
    else if (bitesize>75)bitesize=75;
  }
  void follow()
  {
    sta = "Following";
    ArrayList goodCells = new ArrayList();
    for (int i=0;i<cells.size();i++) { if (checkCell(((Amoeba)cells.get(i)))=="GOOD") goodCells.add(((Amoeba)cells.get(i))); }
    Amoeba closest = new Amoeba(0.0,0.0,0.0,0.0,0.0,0.0);
    for (int i=0;i<goodCells.size();i++)
    {
      if (PVector.dist(((Amoeba)goodCells.get(i)).loc,loc)<=PVector.dist(closest.loc,loc))
        closest = ((Amoeba)goodCells.get(i));
    }
    PVector movement = PVector.sub(closest.loc,loc);
    movement.limit(spd);
    loc.add(movement);
    for (int i=0;i<cells.size();i++)
    {
      Amoeba c = ((Amoeba)cells.get(i));
      if (PVector.dist(c.loc,loc)<r+c.r)
      {
        eat(c);
      }
    }
    if (goodCells.size()<=0) following = false;
  }
  void run()
  {
    sta = "Running";
    PVector movement = PVector.sub(findNearestCell(this).loc,loc);
    movement.limit(spd);
    loc.sub(movement);
  }
  void lookForPlants()
  {
    sta = "Roaming";
    PVector movement = PVector.sub(findNearestPlant(this).loc,loc);
    movement.limit(spd);
    loc.add(movement);
  }
  void checkFamily()
  {
    ArrayList remaining = new ArrayList();
    for (int i=0;i<family.size();i++)
    {
      if (!((Amoeba)family.get(i)).dead) remaining.add(((Amoeba)family.get(i)));
    }
    family = new ArrayList();
    for (int i=0;i<remaining.size();i++)
    {
      family.add(((Amoeba)remaining.get(i)));
    } 
  }
}
float calcRadius(float area,float maxSz)
{
  float r = sqrt(area/PI);
  if (2*r > maxSz) r = maxSz / 2;
  return r;
}
PVector midPoint(PVector v1, PVector v2)
{
  PVector mid = new PVector(v2.x-v1.x,v2.y-v1.y);
  return new PVector(v1.x+mid.x,v1.y+mid.y); 
}
Amoeba findNearestCell(Amoeba a)
{
  Amoeba closest = new Amoeba(999999999,9999999,0,0.0,0.0,0.0);
  for (int i=0;i<cells.size();i++)
  {
    Amoeba b = ((Amoeba)cells.get(i));
    if (PVector.dist(a.loc,b.loc)<=PVector.dist(a.loc,closest.loc)&&b!=a)
    {
      closest = b;
    }
  }
  return closest;
}
Plant findNearestPlant(Amoeba a)
{
  Plant closest = new Plant(99999999,9999999,0);
  for (int i=0;i<plants.size();i++)
  {
    Plant p = ((Plant)plants.get(i));
    if (PVector.dist(a.loc,p.loc)<PVector.dist(a.loc,closest.loc)) closest = p;
  }
  return closest;
}

