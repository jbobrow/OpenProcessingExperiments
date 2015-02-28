
/**
 * Triangle Strip Order
 * Interactive helper for determining an ordering
 * of vertices to completely cover a cube using a
 * TRIANGLE_STRIP without without overlaps.
 *
 * - The cube's vertices are numbered 1,2,3,4,5,6,7,8.
 * - Vertices 1-4 are at the front; 6-8 at the back.
 * - Vertex number is visually represented by size.
 * - Press a number key to add that numbered vertex
 *   to the order specified for the TRIANGLE_STRIP.
 * - Press BACKSPACE to remove the last vertex from
 *   the order.
 * - When three or more vertices are specified, the
 *   TRIANGLE_STRIP is rendered.
 */

public static final int MAX_POINTS = 100;

PVector[] vertices;
int[] sequence = new int[MAX_POINTS];

int numPoints = 0;

void setup()
{
  size(640, 480, P3D);
  vertices = new PVector[8];
  // Front
  vertices[0] = new PVector(-1,  1,  1); // SW
  vertices[1] = new PVector( 1,  1,  1); // SE
  vertices[2] = new PVector( 1, -1,  1); // NE
  vertices[3] = new PVector(-1, -1,  1); // NW
  // Back
  vertices[4] = new PVector(-1,  1, -1); // SW
  vertices[5] = new PVector( 1,  1, -1); // SE
  vertices[6] = new PVector( 1, -1, -1); // NE
  vertices[7] = new PVector(-1, -1, -1); // NW
  
  sphereDetail(2);
}

public void draw()
{
  background(0);
  translate(width/2, height/2, 0);
  rotateX(-0.4);
  rotateY(0.1 * sin(frameCount * 0.01));
  scale(100, 100, 100);
  stroke(255);
  noFill();
  for (int i = 0; i < vertices.length; i++)
  {
    pushMatrix();
    translate(vertices[i].x, vertices[i].y, vertices[i].z);
    sphere(0.01 * (i + 1));
    popMatrix();
  }

  stroke(255,255,255,127);
  int grey = 120;
  if (numPoints > 2)
  {
    beginShape(TRIANGLE_STRIP);

    for (int i = 0; i < numPoints; i++)
    {
      PVector v = vertices[sequence[i]];
      
      grey += 5;
      fill(grey, grey, grey, 50);
      
      vertex(v.x, v.y, v.z);
    }

    endShape();
  }
}

void keyPressed()
{
  if (key >= '1' && key <= '8')
  {
    if (numPoints < MAX_POINTS)
    {
      sequence[numPoints] = (int)(key - '1');
      numPoints++;
    }
  }
  
  if (key == BACKSPACE && numPoints > 0)
  {
    numPoints--;
  }
  
  if (key == 'p')
  {
    for (int i = 0; i < numPoints; i++)
    {
      if (i > 0) print(" ");
      print(sequence[i] + 1);
    }
    println();
  }
}


