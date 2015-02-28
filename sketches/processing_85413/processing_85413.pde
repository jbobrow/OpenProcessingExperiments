
class Particle 
{
  float cx, cy;
  float tx, ty;
  float speed = 0;
  boolean targetRechead = false;

  Particle (float cx, float cy, float tx, float ty)
  {
    this.cx = cx;
    this.cy = cy;
    this.tx = tx;
    this.ty = ty;
  }

  void update (float tx, float ty)
  {
    targetRechead = false;
    speed = 0;
    this.tx = tx;
    this.ty = ty;
  }

  void move ()
  {
    if (!targetRechead)
    {
      float amt = sin (speed);
      cx = lerp (cx, tx, amt);
      cy = lerp (cy, ty, amt);
      speed += 0.002;
      if ( (int) cx ==  (int) tx && (int) cy == (int) ty) targetRechead = true;
      if (speed >= 0.13) 
      {
        targetRechead = true;
        cx = tx;
        cy = ty;
      }
    }
  }

  void draw ()
  {
    point (cx, cy);
  }
}

class PointCloud 
{
  boolean paused = false;
  Particle [] p;
  float [] [] pp;
  float[][] myEdges;
  int length;
  Delaunay dl;

  PointCloud (int n)
  {
    this.length = n;
    p = new Particle [0];
    pp = new float [0] [0];
    myEdges = new float [0] [0];
  }


  void addPatricel (Particle cp)
  {
    if (p.length <= length) {
      p = (Particle[]) append (p, cp);
      pp = (float [] []) append (pp, new float [] {
        p[p.length-1].cx, 
        p[p.length-1].cy
      }
      );
    }
  }

  void update (float [] [] target)
  {
    ArrayList <Integer> index = new ArrayList();
    ArrayList <Float> targetX = new ArrayList();
    ArrayList <Float> targetY = new ArrayList();

    for (int i = 0; i < target.length; i++) index.add (i);

    int closestIndex = 0;
    float closestDist = width*2;
    float dis = 0;

    for (int i = 0; i < p.length; i++)
    {
      closestIndex = 0;
      closestDist = width*2;

      for (int j = 0; j < index.size(); j++)
      {
        dis = dist (p[i].cx, p[i].cy, target [index.get(j)] [0], target [index.get(j)] [1]);
        {
          if (dis < closestDist) 
          {
            closestDist = dis;
            closestIndex = j;
          }
        }
      }

      targetX.add ( target [index.get(closestIndex)] [0]);
      targetY.add ( target [index.get(closestIndex)] [1]);
      try 
      {
        index.remove (closestIndex);
      }
      catch (IndexOutOfBoundsException e)
      {
        println (e);
      }
    }


    for (int i = 0; i < p.length; i++)
    {

      p[i].update (targetX.get (i), targetY.get (i));
    }

    paused = false;
  }

  void updateSimple (float [] [] target)
  {
    for (int i = 0; i < p.length; i++)
    {
      p[i].update (target [i] [0], target [i] [1]);
    }

    paused = false;
  }

  void checkFinishing ()
  {

    boolean targetRechead = true;
    for (int i = 0; i < p.length; i++)
    {
      if (!p[i].targetRechead)
      {
        targetRechead = false;
        break;
      }
    }

    if (targetRechead) paused = true;
  }

  void draw ()
  {
    for (int i = 0; i < p.length; i++)
    {
      if (!paused) {
        //if (p.length-1 < length && !p[i].targetRechead) p[i].move();
        //else if (p.length-1 == length) 
        p[i].move();
        pp [i] [0] = p[i].cx;
        pp [i] [1] = p[i].cy;
      }
     // p[i].draw();
    }

    dl = new Delaunay (pp);

    checkFinishing();

    myEdges = dl.getEdges();

    for (int i=0; i<myEdges.length; i++)
    {
      line( myEdges[i][0], myEdges[i][1], myEdges[i][2], myEdges[i][3] );
    }
  }
}


