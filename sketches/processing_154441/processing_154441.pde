
/*----------------------------------
     
 Copyright by Diana Lange 2014
 Don't use without any permission. Creative Commons: Attribution Non-Commercial.
     
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 vimeo: https://vimeo.com/dianalange/videos
    
 -----------------------------------*/

Hull h;

void setup()
{
  size (600, 600);
  smooth();
  frameRate (30);
  PointCloud p = new PointCloud (50, 100, 220, 20, width/2, height/2);
  h = new Hull(p);
}

void draw ()
{
  background (15);

  strokeWeight (1);
  noFill();
  stroke(255, 120);

  h.move();
  h.display();

  h.displayPoints();
}

void mousePressed ()
{
  h.init();
}

public class Hull
{
  private PointCloud p;
  private color c;
  private int [] extrema, ordered;
  private float centerX, centerY;

  public Hull (PointCloud p)
  {
    int dir = (int) random (2);
    if (dir == 0) c = color (0, 80);
    else c = color (255, 80);
    this.p = p;
    extrema = new int [4]; // 1 top // 2 right // 3 bottom // 4 left // 5 center
    ordered = new int [p.getPointCloud().length];
    setExtrema();
    setAngles();
  }
  
  public void init ()
  {
    p.init(0);
    setExtrema();
    setAngles();
  }

  public void move ()
  {
    p.move();
    p.check();
    setExtrema();
    setAngles();
  }

  private void setExtrema ()
  {
    float [] [] pc = p.getPointCloud();
    float top = height, right = 0, bottom = 0, left = width;

    for (int i = 0; i < pc.length; i++)

    {
      if (pc [i] [1] < top) {
        top = pc [i] [1];
        extrema [0] = i;
      }

      if (pc [i] [0] > right) {
        right = pc [i] [0];
        extrema [1] = i;
      }

      if (pc [i] [1] > bottom) {
        bottom = pc [i] [1];
        extrema [2] = i;
      }

      if (pc [i] [0] < left) {
        left = pc [i] [0];
        extrema [3] = i;
      }
    }

    centerX = pc[extrema[3]] [0] + (pc[extrema[1]] [0] - pc[extrema[3]] [0]) / 2.0;
    centerY = pc[extrema[0]] [1] + (pc[extrema [2]] [1] - pc[extrema[0]] [1]) / 2.0;

    //centerX = width/2;
    // centerY = height/2;
  }

  private void setAngles ()
  {
    float [] [] pc = p.getPointCloud();
    float [] anglesUnsorted = new float [pc.length];
    float [] anglesSorted = new float [pc.length];
    for (int i = 0; i < anglesUnsorted.length; i++)
    {
      float r = dist (pc[i] [0], pc [i] [1], centerX, centerY);

      if ( pc[i] [1] < centerY) anglesUnsorted[i] = degrees (acos ((pc[i] [0]-centerX) / r));
      else anglesUnsorted[i] = 270 + degrees (asin ((pc[i] [0]-centerX) / r));
    }

    arrayCopy (sort (anglesUnsorted), anglesSorted);
    ordered = quicksearch (anglesUnsorted, anglesSorted);
  }

  private int [] quicksearch (float [] unsorted, float [] sorted)
  {
    int [] sortNum = new int [sorted.length];
    for (int i = 0; i < sorted.length; i++)
    {
      float sortedVal = sorted [i];
      for (int j = 0; j < unsorted.length; j++)
      {
        float unsortedVal = unsorted [j];

        if (sortedVal == unsortedVal) {
          sortNum [i] = j;
          break;
        }
      }
    }
    return sortNum;
  }

  public void displayCenter ()
  {
    strokeWeight (1);
    stroke (120);
    line (centerX, 0, centerX, height);
    line (0, centerY, width, centerY);
  }

  public void display ()
  {
    float [] [] pc = p.getPointCloud();
    beginShape();
    curveVertex (pc[ordered[ordered.length-1]] [0], pc [ordered[ordered.length-1]] [1]);

    for (int i = 0; i < pc.length; i++) {
      curveVertex (pc[ordered[i]] [0], pc [ordered[i]] [1]);
    }
    curveVertex (pc[ordered[0]] [0], pc [ordered[0]] [1]);

    endShape(CLOSE);
  }

  public void displayPoints ()
  {

    p.display();
  }
}

public class PointCloud
{
  private float [] [] points;
  private float [] speed;
  private PVector [] dir;
  private int maxDist, minDist;
  private float centerX, centerY;
  private float padding;

  public PointCloud (int res, int minDist, int maxDist, int padding, float centerX, float centerY)
  {
    this.padding = padding;
    this.maxDist = maxDist;
    this.minDist = minDist;
    this.centerX = centerX;
    this.centerY = centerY;
    points = new float [res] [2];

    init(0);
  }
  public PointCloud (float [] [] p, int maxDist, int minDist, float centerX, float centerY)
  {
    padding = 30;
    points = new float [p.length] [2];
    arrayCopy (p, points);
    this.maxDist = maxDist;
    this.minDist = minDist;
    this.centerX = centerX;
    this.centerY = centerY;

    init (2);
  }

  public void init (int mode)
  {
    speed = new float [points.length];
    dir = new PVector [points.length];
    for (int i = 0; i < speed.length; i++)
    {
      speed [i] = random (0.5, 1.5);
      float angle = random (TWO_PI);
      dir [i] = new PVector (cos (angle), sin (angle));
    }

    if (mode == 0) createPointsCircle ();
    else if (mode == 1) createPointsRandom ();
  }


  public void check ()
  {
    float dis, nextDis;
    for (int i = 0; i < points.length; i++)
    {
      for (int j = 0; j < points.length; j++)
      {
        if (i == j) continue;
        nextDis = dist (points [i] [0] + dir [i].x*speed [i], points [i] [1] + dir [i].y*speed[i], points [j] [0]+dir [j].x*speed[j], points [j] [1]+dir [j].y*speed[i]);
        dis = dist (points [i] [0], points [i] [1], points [j] [0], points [j] [1]);

        if (dis < padding  || nextDis < padding)
        {
          float angle = atan2 (points [i] [1]-points [j] [1], points [i] [0]-points [j] [0]);

          PVector centerCross = new PVector (lerp (points [i] [0], points [j] [0], 0.5), lerp (points [i] [1], points [j] [1], 0.5));//new PVector ( points [j] [0] + cos (angle)*dis/2, points [j] [1] + sin (angle)*dis/2);

          if (dis < padding)
          {
            points [i] [0] = centerCross.x + cos (angle)*padding/2;
            points [i] [1] = centerCross.y + sin (angle)*padding/2;
          }


          PVector repeal_01 = new PVector (cos (-angle), sin (-angle));
          PVector repeal_02 = new PVector (cos (angle), sin (angle));
          repeal_01.mult (0.5);
          repeal_02.mult (0.5);


          dir [i].add (repeal_02);
          dir [i].normalize();

          dir [j].add (repeal_01);
          dir [j].normalize();


          break;
        }
      }
    }
  }

  private void createPointsCircle ()
  {

    for (int i = 0; i < points.length; i++) {
      float angle = map (i, 0, points.length, 0, TWO_PI);
      float r = (maxDist);
      points [i] [0] = centerX + cos (angle) * r;
      points [i] [1] = centerY + sin (angle) * r;
    }
  }

  private void createPointsRandom ()
  {
    for (int i = 0; i < points.length; i++) {
      float angle = random (TWO_PI);
      float r = random (minDist, maxDist);
      points [i] [0] = centerX + cos (angle) * r;
      points [i] [1] = centerY + sin (angle) * r;
    }
  }

  public float [] [] getPointCloud ()
  {
    return points;
  }



  public void display ()
  {


    for (int i = 0; i < points.length; i++)
    {
      strokeWeight (1);
      stroke(#A75265);
      noFill();
      ellipse (points[i] [0], points[i] [1], padding, padding);

      strokeWeight (6);
      stroke(#ffedbc);
      point (points[i] [0], points[i] [1]);
    }

    //move ();
  }


  public void move ()
  {
    for (int i = 0; i < points.length; i++)
    {

      points[i] [0] += speed [i] * dir[i].x;
      points[i] [1] += speed [i] * dir[i].y;

      float dis = dist (points[i] [0], points[i] [1], centerX, centerY);

      if (dis > maxDist)
      {
        float angle = atan2 (points[i] [1]-centerY, points[i] [0]-centerX);
        points[i] [0] = centerX + cos (angle)*maxDist;
        points[i] [1] = centerY + sin (angle)*maxDist;

        dir [i].mult (-1);
      }
      else if (dis <= minDist)
      {
        float angle = atan2 (points[i] [1]-centerY, points[i] [0]-centerX);
        points[i] [0] = centerX + cos (angle)*minDist;
        points[i] [1] = centerY + sin (angle)*minDist;

        dir [i].mult (-1);
      }
    }
  }
}


