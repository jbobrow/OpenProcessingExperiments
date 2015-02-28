

void setup()
{
  size(600, 519);
}

void draw()
{
  background(0);
  
  int nColumns = 0;
  if (mouseX < width / 3)
    nColumns = 3;
  else if (mouseX < 2 * width / 3)
    nColumns = 5;
  else
    nColumns = 7;
  
  int nRows = nColumns;
  float triW = width / nColumns;
  float triH = sqrt(3) * triW * .5f;

  for (int i = 0; i < nColumns; i++)
  {
    for (int j = 0; j < nRows; j++)
    {
      
      noFill();
      stroke(255);
      int complexity = abs(j - (nRows  -1) / 2) + abs(i - (nColumns - 1)/ 2);
      
      float left = i * triW;
      float right = (i + 1) * triW;
      float top = j * height / nRows;
      float bottom = top + triH;
      float middle = lerp(left, right, 0.5);
      sierpinskiTriangle(new PVector(middle, top), 
      new PVector(left, bottom), 
      new PVector(right, bottom), 
      0, complexity);
      
      drawAroundTri(new PVector(middle, top), 
      new PVector(left, bottom), 
      new PVector(right, bottom));
    }
  }
}

void sierpinskiTriangle(PVector top, PVector left, PVector right, int trisAbove, int nTriangles)
{
  if (trisAbove > nTriangles)
    return;

  line(top.x, top.y, left.x, left.y);
  line(top.x, top.y, right.x, right.y);
  line(left.x, left.y, right.x, right.y);

  PVector midLeft = PVector.lerp(top, left, 0.5f);
  PVector midRight = PVector.lerp(top, right, 0.5f);
  PVector midBottom = PVector.lerp(left, right, 0.5f);
  sierpinskiTriangle(top, midLeft, midRight, trisAbove + 1, nTriangles);
  sierpinskiTriangle(midLeft, left, midBottom, trisAbove + 1, nTriangles);
  sierpinskiTriangle(midRight, midBottom, right, trisAbove + 1, nTriangles);
}

void drawAroundTri(PVector top, PVector left, PVector right)
{
  noStroke();
  fill(50, 50, 60, 70);
  
  beginShape();
  vertex(top.x, top.y);
  vertex(left.x, left.y);
  vertex(left.x, top.y);
  endShape(CLOSE);
  
  beginShape();
  vertex(top.x, top.y);
  vertex(right.x, right.y);
  vertex(right.x, top.y);
  endShape(CLOSE);
}



