
/**
 * DotProductSums2.pde
 * original by <a href="http://www.jackkern.com/processing">Jack Kern</a>
 * usage of PVector by Toni Holzer   
 * <p>
 * DotProductSums lets the user move the vertices of a triangle around
 * and visibly see the dot product of the adjacent edges, as well as
 * the sum of all three dot products.
 * </p>
 */
// tags: dot, math, demo, triangle, vector, dot sum

PVector   selPt  = null;
PVector[] points = new PVector[3];
int w2 = 250;
int h2 = 500;
String[] pointNames = {"A","B","C"};
String[] vectorNames = {"u","v","w"};
//----------------------------------------------------------
void setup()
{
  size(500, 640);
  points[0] = new PVector(width/2, 40);
  points[1] = new PVector(width-40, 240);
  points[2] = new PVector(40, 340);
  //smooth();
  w2 = width/2;
  h2 = height - 130;
}
//----------------------------------------------------------
void draw()
{
  background(255);
  stroke(0);
  fill(200);
/* 
  beginShape(TRIANGLE);
  for (PVector v: points)
    vertex(v.x, v.y);
  endShape();
*/  
  triangle(points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y);

  int index = 0;
  float dotSum = 0;
  for (PVector v: points)
  {
    // First clear the area that will be behind the points name
    noStroke();
    fill(255,122);
    String name = " " + pointNames[index] + " ";
    rect(v.x + 3, v.y - 12, textWidth(name) + 2, 16 );    

    // Color red when not selected, blue when selected
    if (selPt == v) fill(188, 0, 0);  // selected ?
    else            fill(0, 0, 188);

    // Draw the point
    stroke(0);
    ellipse(v.x, v.y, 10, 10);

    // draw the point name
    noStroke();
    text(name, v.x + 6, v.y);
  
    // draw dot value
    int i2 = (index+1) % 3;
    int i3 = (i2+1) % 3;
    PVector a = PVector.sub(points[index], points[i2]);
    PVector b = PVector.sub(points[i3], points[index]);
    name = vectorNames[index] + " dot " + vectorNames[i2];
    dotSum += drawDot(name, index*30+10, a, b);
    ++index;
  }
  fill(0, 155, 0);
  drawBar("dotSum(u,v,w)", h2+ 3*30+10, dotSum);

  stroke(0);
  line(0, h2, width, h2);
  line(w2, h2, w2, height);

  fill(0);
  text("1.0", w2-8, h2-4);
}
//----------------------------------------------------------
float drawDot(String txt, int x, PVector v0, PVector v1)
{
  v0.normalize();
  v1.normalize();
  float dotProduct = v0.dot(v1);
  fill(abs(dotProduct * width/2), 122,122);
  drawBar(txt, h2+x, dotProduct);
  return dotProduct;
}
//----------------------------------------------------------
void drawBar(String txt, int y, float value)
{
  noStroke();
  rect(0, y, abs(value * width/2), 18);
  fill(0);
  text (txt, 0, y+14);
  text (nf(value,0,6), width - 100, y+14);
}
//----------------------------------------------------------
void mousePressed()     //  select close point
{ 
  float minDist = 999;
  for (PVector point: points)
  {
    float dist = sq (point.x - mouseX) + sq(point.y - mouseY);
    if (dist < 222.0)
      if (dist < minDist)
      { selPt = point;
        minDist = dist;
      }
  }
}
//----------------------------------------------------------
void mouseReleased() 
{ 
  selPt = null;   // clear selection
}
//----------------------------------------------------------
void mouseDragged() 
{ 
  if ( selPt != null )
    selPt.set( mouseX, mouseY, 0);  //  drag selection
}
//----------------------------------------------------------
void keyPressed() 
{ 
  if (key == 's') save("DotProductSums2.png");
}


