
Mover[] mover = new Mover[20];
final int DIVISIONS = 50;
float[][][] field = new float [DIVISIONS] [DIVISIONS + 2] [DIVISIONS + 2];
//  PImage logo;

void setup()
{
  size (500, 500, P3D);
  colorMode (RGB, 1);
  
  for (int i = 0; i != mover.length; ++i)
  {
    PVector p = new PVector (
      random (-1, 1),
      random (-1, 1),
      random (-1, 1)
    );
    p.normalize();
    PVector v = new PVector (
      random (-1, 1),
      random (-1, 1),
      random (-1, 1)
    );
    v.normalize();
    v.mult (0.02);
    mover [i] = new Mover (p, v);
  }
  
  for (int i = 0; i != field.length; ++i)
    for (int j = 0; j != field [i].length; ++j)
      for (int k = 0; k != field [i] [j].length; ++k)
        field [i] [j] [k] = 0;
  
  frameRate (25);
  
  //  logo = loadImage("logo.png");
  //  logo.filter(INVERT);
}

class Mover
{
  public Mover (PVector p, PVector v)
  {
    position = p;
    velocity = v;
  }
  
  public PVector position;
  public PVector velocity;
  
  private void indexSet (PVector p, int index, float value)
  {
    switch (index)
    {
      case 0: p.x = value; break;
      case 1: p.y = value; break;
      case 2: p.z = value; break;
    }
  }
  
  private float indexGet (PVector p, int index) throws Exception
  {
    switch (index)
    {
      case 0: return p.x;
      case 1: return p.y;
      case 2: return p.z;
    }
    
    throw new Exception ("no such index");
  }
  
  public void update()
  {
    position.add (velocity);
    
    for (int i = 0; i != 3; ++i)
    {
      try
      {
        while (
          indexGet (position, i) < -1 || 
          1 < indexGet (position, i)
        )
        {
          indexSet (velocity, i, -indexGet (velocity, i));
          if (indexGet (position, i) < 0)
            indexSet (position, i, -2 - indexGet (position, i));
          else
            indexSet (position, i, 2 - indexGet (position, i));
        }
      }
      catch (Exception e)
      {
        println (e.getMessage());
      }
    }
  }
  
  public float fieldStrength (float x, float y, float z)
  {
    float xx = pow (x - position.x, 2);
    float yy = pow (y - position.y, 2);
    float zz = pow (0 - position.z, 2);
    
    return 1.0 / (xx + yy + zz);
  }
}

void draw()
{
  
  //  update
  
  for (int i = 0; i != mover.length; ++i)
  {
    mover [i].update();
  }
  
  //  draw
  
  //  set up view
  background (0);
 
  pushMatrix();
  translate (width / 2, height / 2, -width * 0.8);
  rotateZ (PI / 2);
  rotateX (PI / 4);
  
  //  calculate field strength on plane
  
  //  init empty plane
  final int UPDATE_INDEX = getUpdateIndex (frameCount);
  for (int i = 0; i != field [UPDATE_INDEX].length; ++i)
  {
    for (int j = 0; j != field [UPDATE_INDEX] [i].length; ++j)
    {
      field [UPDATE_INDEX] [i] [j] = 0;
    }
  }
  
  //  populate empty plane with field values
  for (int i = 0; i != mover.length; ++i)
  {
    for (int j = 0; j != DIVISIONS; ++j)
    {
      float x = ((2.0 * j) / (DIVISIONS - 1)) - 1;
      for (int k = 0; k != DIVISIONS; ++k)
      {
        float y = ((2.0 * k) / (DIVISIONS - 1)) - 1;

        field [UPDATE_INDEX] [j + 1] [k + 1] += mover [i].fieldStrength (x, y, 0);
      }
    }
  }
  
  //  draw fields
  
  stroke (0, 1, 1, 0.5);
  strokeWeight (0.5);
  
  //  for each stored field
  for (int b = 0; b != DIVISIONS; ++b)
  {
    
    //  for the number of nested contours we want to display
    for (int a = 0; a != 2; ++a)
    {
      
      //  calculate a field threshold
      final float THRESH = a * 30 + 30;
      
      //  create some storage for marching squares cell values
      int[][] cell = new int [DIVISIONS + 1] [DIVISIONS + 1];
      
      //  calculate marching squares cell values
      for (int j = 0; j != cell.length; ++j)
      {
        for (int k = 0; k != cell [j].length; ++k)
        {
          cell [j] [k] = 0;
          
          for (int i = 0; i != 4; ++i)
            if (field [b] [j + (((i + 1) / 2) % 2)] [k + (i / 2)] < THRESH)
              cell [j] [k] += pow (2, 3 - i);
        }
      }
            
      //  for each cell
      for (int i = 0; i != cell.length; ++i)
      {
        for (int j = 0; j != cell [i].length; ++j)
        {
          
          //  draw the appropriate line(s)
          float x0 = gridPosition (i - 1);
          float x1 = gridPosition (i - 0.5);
          float x2 = gridPosition (i);
          
          float y0 = gridPosition (j - 1);
          float y1 = gridPosition (j - 0.5);
          float y2 = gridPosition (j);
          
          float z = gridPosition (getUpdateIndex (frameCount - b));
    
          switch (cell [i] [j])
          {
            case 0:
            case 15:
              break;
            case 1:
            case 14:
              line (x0, y1, z, x1, y2, z);
              break;
            case 2:
            case 13:
              line (x1, y2, z, x2, y1, z);
              break;
            case 3:
            case 12:
              line (x0, y1, z, x2, y1, z);
              break;
            case 4:
            case 11:
              line (x1, y0, z, x2, y1, z);
              break;
            case 7:
            case 8:
              line (x0, y1, z, x1, y0, z);
              break;
            case 6:
            case 9:
              line (x1, y0, z, x1, y2, z);
              break;
            case 5:
              line (x0, y1, z, x1, y0, z);
              line (x1, y2, z, x2, y1, z);
              break;
            case 10:
              line (x0, y1, z, x1, y2, z);
              line (x1, y0, z, x2, y1, z);
              break;
              
            default:
              break;
          }
        }
      }
    }
  }
  
  popMatrix();
  
  //  reset view, display logo, store frame
  camera();

  //  image (logo, width - logo.width, height - logo.height);
  
//  saveFrame ("f####.png");
}

float gridPosition (float index)
{
  return (((2.0 * index) / (DIVISIONS - 1)) - 1) * width / 2;
}

int getUpdateIndex (int i)
{
  return (i + DIVISIONS - 1) % DIVISIONS;
}
