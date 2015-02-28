
color c1, c2;

void setup()
{
  size(400, 400);
  background(0);
  
  c1 = color(#1532E8);
  c2 = color(#FF1205);
}

void draw()
{   
  setGradient(0, 0, width, height, c1, c2);
  
  stroke(0);
    
  for (int x = 0; x < width; x+=20)
  {
    for (int y = 0; y < height; y+=20)
    {
      line(0, y, height, y);
    }
    line(x, 0, x, width);
  }
  
  stroke(255);
  fill(255);
  drawShape(150, 150);

  pushMatrix();
  translate(200, 200);
  for (float a = 0; a < 31.5; a++)
  {
    rotate(0.2);
    drawShape(60, 60);
  }
  popMatrix();
}

void setGradient(int x, int y, float w, float h, color c1, color c2)
{
      for (int i = x; i <= x+w; i++) 
    {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
}

void drawShape(float offx, float offy)
{
  int[] x = {50, 61, 83, 69, 71, 50, 29, 31, 17, 39};
  int[] y = {18, 37, 43, 60, 82, 73, 82, 60, 43, 37};
  
  beginShape();
  for (int i = 0; i < x.length; i++)
  {
    vertex(x[i] + offx, y[i] + offy);
  }
  endShape();
}



