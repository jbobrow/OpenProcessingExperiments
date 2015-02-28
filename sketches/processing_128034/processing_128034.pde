
//Exercise for Creating Geometric and Generative Art with Code with
//Kunstwurfelspiel Academy

//triangle original composition 
//trying a system to create artistic composition
//also using transform 2d from processing tutorials

// set up 
void setup()
{
  // set size
  size(400, 400);
  
  // set background to blue
  background(0,0,255);
  
  // giving a stepped increase for y movement, put triangle in rows
  for (int j = 20; j < 350; j = j + 54)
  {
  // giving a stepped increase for x movement, put triangle in columns 
  for (int i = 10; i < 350; i = i + 54)
  {
    // put in triangle, see function below
    mytriangle(i, j);
  }
  }
}

// defining mytriangle
void mytriangle(int x, int y)
{
  // moving the grid for each iteration
  pushMatrix();
  translate(x, y);
  
  // set weight of stroke and colour to green
  strokeWeight(4);
  stroke(0,255,0);
  
  // filling the triangles, which will change as x and y changes
  fill(255, y-30, x-30);
  
  // defining a mytriangle
  triangle(30, 5, 5, 30, 52, 30);

  // put grid back
  popMatrix();
}


