
float gray = 0.0;
int[] arrayX= { 50, 61, 83, 20, 71, 50, 29, 31, 17, 39};
int[] arrayY= { 18, 37, 43, 60, 82, 73, 82, 60, 43, 37};

int[] x2 = new int[5];
int[] y2 = new int[5];


void setup() 
{
  size(400, 400);
  background(0);
  for (int i = 0; i < 5; i++)
  {
    x2[i] = (int)random(1, 50);
    y2[i] = (int)random(40, 100);
  }    
}

void draw() 
{
  for( int i = 0; i <400; i++)
  {
    float percent = (float)i /400;
    stroke(255 * percent);
    line(0, i, 400, i);
  }
  for (int i = 0; i < 400; i += 40)
  {
    stroke(255);
    line(0, i, 400, i);
    line(i, 0, i, 400);
  }
  pushMatrix();
  translate(100,0);
  drawShapes(0,0);
  popMatrix();
  
  pushMatrix();
  translate(50,0);
  drawShapes(0,0);
  popMatrix();
  for (int i = 0; i < 400; i += 30)
  {
    stroke(150);
    line(0, i, 400, i);
    for(int j = 0; j < 400; j += 30)
    {
      stroke(150);
      line(j, 0, j, 400);
    }
  }
  beginShape();
  for (int i = 0; i < arrayX.length; i++)
  {
    vertex(arrayX[i], arrayY[i]);
  }
  endShape();
  beginShape();
  for( int i = 0 ; i < x2.length; i++)
  {
    vertex(x2[i], y2[i]);  
  }
  endShape();
  drawShapes(0, 0);
  drawShapes(100, 40);
  drawShapes(200, 50);
}

void drawShapes(float offset, float yoffset)
{
    beginShape();
  for (int i = 0; i < arrayX.length; i++)
  {
    vertex(arrayX[i] + offset, arrayY[i] + yoffset);
  }
  endShape();
  beginShape();
  for(int i = 0; i < x2.length; i++)
  {
    vertex(x2[i], y2[i]);  
  }
  endShape();  
}


