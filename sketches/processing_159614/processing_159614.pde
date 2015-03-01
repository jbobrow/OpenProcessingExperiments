

Vec2[] points;
float[] pointMasses;
Vec2[] totalForces;

int numPoints = 15;
final float G = 6.67 * pow(10, -2);
final float emptyMass = 10;

int y = 0;
int cellSize = 8;
boolean animated = false;

int currTime = 0;
int prevTime = 0;
int seed = 0;

void setup()
{
  size(1024, 768, JAVA2D);
  colorMode(HSB);

  restart();
}

void restart()
{
  points = new Vec2[numPoints];
  pointMasses = new float[numPoints];
  totalForces = new Vec2[numPoints];

  y = 0;
  background(0);
  randomSeed(seed);

  for (int i = 0; i < numPoints; ++i)
  {
    points[i] = new Vec2(random(width), random(height));
    pointMasses[i] = random(1000, 1500);
    totalForces[i] = new Vec2();

    stroke(255, 0, 255);
    ellipse(points[i].x, points[i].y, 2, 2);
    noStroke();
  }

  currTime = millis();
  prevTime = currTime;

  if (animated)
  {
    cellSize = max(cellSize, 2);
  }

  loop();
}

void mouseReleased()
{
  seed = millis();
  restart();
}

void keyReleased()
{
  if(key == ']')
  {
    if(cellSize < width / 4)
    {
      cellSize *= 2;
      restart();
    }
  }
  else if(key == '[')
  {
    if(cellSize > 1)
    {
      cellSize /= 2;
      
      if(animated)
      {
        cellSize = min(cellSize, 2);
      }
      
      restart();
    }
  }
  else if(key == '+')
  {
    numPoints = min(numPoints + 1, 1000);
    restart();
  }
  else if(key == '-')
  {
    numPoints = max(numPoints - 1, 1);
    restart();
  }
  else if(key == ' ')
  {
    cellSize = 1;
    restart();
  }
  else if(key == 'p' || key == 'P')
  {
    animated = true;
    restart();
  }
}

void draw()
{
  if (animated)
  {
    prevTime = currTime;
    currTime = millis();
    float dt = (currTime - prevTime) * 0.001f;

    for (int i = 0; i < numPoints; ++i)
    {
      totalForces[i].Set(0, 0);

      for (int j = 0; j < numPoints; ++j)
      {
        if (j == i)
          continue;

        Vec2 v = points[j].Subtract(points[i]);
        float sqDist = v.Dot(v);
        v.Normalize();

        if (sqDist <= 256.0f)
        {
          pointMasses[i] += pointMasses[j];

          Vec2[] newPoints = new Vec2[numPoints - 1];
          int index = 0;
          for (int n = 0; n < numPoints; ++n)
          {
            if (n == j)
              continue;

            newPoints[index] = new Vec2(points[n].x, points[n].y);
            ++index;
          }

          --numPoints;
          points = newPoints;
        }
        else
        {
          float force = G * ((pointMasses[i] * pointMasses[j]) / sqDist);

          totalForces[i] = totalForces[i].Add(v.Multiply(force));
        }
      }
    }

    for (int i = 0; i < numPoints; ++i)
    {
      points[i] = points[i].Add(totalForces[i].Multiply(dt));

      if (points[i].x < 0)
        points[i].x = 0;
      if (points[i].x >= width)
        points[i].x = width - 1;

      if (points[i].y < 0)
        points[i].y = 0;
      if (points[i].y >= height)
        points[i].y = height - 1;
    }
  }

  if (animated)
    y = 0;

  for (; y < height; )
  {
    for (int x = 0; x < width; x += cellSize)
    {
      Paint(x, y);
    }

    y += cellSize;

    if (animated == false)
    {
      if (y >= height)
      {
        noLoop();
        println("Done.");
      }
      else
      {
        break;
      }
    }
  }

  if (animated)
  {
    for (int i = 0; i < numPoints; ++i)
    {
      stroke(255, 0, 255);
      ellipse(points[i].x, points[i].y, 2, 2);
      noStroke();
    }
  }
}

void Paint(int x, int y)
{
  Vec2 totalForce = new Vec2();

  for (int i = 0; i < numPoints; ++i)
  {
    Vec2 p1 = new Vec2(x, y);
    Vec2 p2 = points[i];

    Vec2 v = p2.Subtract(p1);
    float sqDist = v.Dot(v);
    v.Normalize();

    float f = G * ((emptyMass * pointMasses[i]) / sqDist);

    totalForce = totalForce.Add(v.Multiply(f));
  }

  float angle = totalForce.AsNormal().Angle();
  angle = map(angle, PI, -PI, 0, 255);

  float l = totalForce.Length();
  float sat = pow(l, log(l) / log(10));

  fill(color(angle, 255, sat));
  rect(x, y, cellSize, cellSize);
}


class Vec2
{
  public float x, y;

  public Vec2()
  {
    this.x = 0;
    this.y = 0;
  }

  public Vec2(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  public void Set(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  public Vec2 Add(Vec2 v)
  {
    return new Vec2(x + v.x, y + v.y);
  }
  
  public Vec2 Add(float x, float y)
  {
    return new Vec2(this.x + x, this.y + y);
  }
  
  public Vec2 Subtract(Vec2 v)
  {
    return new Vec2(x - v.x, y - v.y);
  }
  
  public Vec2 Subtract(float x, float y)
  {
    return new Vec2(this.x - x, this.y - y);
  }
  
  public Vec2 Multiply(float f)
  {
    return new Vec2(this.x * f, this.y * f);
  }
  
  public float Length()
  {
    return sqrt(x*x + y*y);
  }
  
  public void Normalize()
  {
    float norm = this.Length();
    this.x /= norm;
    this.y /= norm;
  }
  
  public Vec2 AsNormal()
  {
    Vec2 v = new Vec2(this.x, this.y);
    v.Normalize();
    return v;
  }
  
  public float Dot(Vec2 v)
  {
    return this.x * v.x + this.y * v.y;
  }
  
  public float Angle()
  {
    return atan2(this.y, this.x);
  }
}



