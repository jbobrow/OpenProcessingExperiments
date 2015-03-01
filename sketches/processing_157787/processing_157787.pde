
int[][] indices;
PVector[] vertices;
float[] vertexColors;

//Use flat shading for polygons
boolean flatShading = true;

//Number of horizontal/vertical vertices
int gridResolution = 50;

//Number of triangles formed from grid resolution
int numShapes = ((gridResolution - 1) * 2) * (gridResolution - 1);

//Random vertex jiggle amount
float randomOffset = 10;
float randomColourOffset = 3;

void setup() {
  size(1000, 1000, P2D);
  smooth();
  noStroke(); 
  
  //Create arrays to hold vertex and shape data
  vertices = new PVector[gridResolution * gridResolution]; 
  vertexColors = new float[gridResolution * gridResolution];
  indices = new int[numShapes][3];
  
  //Find out how wide one triangle will be based on the distance between grid points
  float shapeWidth = width / gridResolution;

  //Build vertex grid
  for (int x = 0; x < gridResolution; x++) {
    for (int y = 0; y < gridResolution; y++) {
      //Find the index of the vertex array we should put the new vertex into
      int index = (x * gridResolution) + y;
      
      //Create a vertex and a colour
      vertices[index] = new PVector(x * shapeWidth + random(randomOffset)-randomOffset*0.5, y * shapeWidth+ random(randomOffset)-randomOffset*0.5);
      vertexColors[index] = norm(index + random(numShapes/randomColourOffset), 0, numShapes);
    }
  }
  
  //Build indices
  int currentShapeIndex = 0;
  for (int row = 0;  row < gridResolution - 1; row++) {
    for (int col = 0;  col < gridResolution - 1; col++) {
      
      //Build first triangle indicies
      int a1 = (row * gridResolution) + col;
      int b1 = (row * gridResolution) + col + 1;
      int c1 = ((row + 1) * gridResolution) + col;
      
      //Build second triangle indicies
      int a2 = c1;
      int b2 = b1;
      int c2 = ((row + 1) * gridResolution) + col + 1;
      
      indices[currentShapeIndex] = new int[] {
        a1, b1, c1
      };
      indices[currentShapeIndex+1] = new int[] {
        c2, b2, a2
      };
      
      //Since we created 2 triangles this loop, move the shape counter forward by 2
      currentShapeIndex += 2;
    }
  }
}

void draw() {
  background(0);
  
  //Draw one shape for each stored group of indices
  for (int i = 0; i < indices.length; i++) {
    beginShape(TRIANGLES);
    
    //If we're using flat shading, only use the colour of the upper-left vertex
    if(flatShading) fill( vertexColors[indices[i][0]] * 255 );
    
    //Pull vertices out of the vertex array based on the indices for the shape
    PVector v1 = vertices[indices[i][0]];
    PVector v2 = vertices[indices[i][1]];
    PVector v3 = vertices[indices[i][2]];
    
    //Draw the vertices. If we're not using flat shading
    //set the colours for each vertex manually so we can blend between them.   
    if(!flatShading) fill( vertexColors[indices[i][0]] * 255 );
    vertex(v1.x, v1.y);

    if(!flatShading) fill( vertexColors[indices[i][1]] * 255 );
    vertex(v2.x, v2.y);

    if(!flatShading) fill( vertexColors[indices[i][2]] * 255 );
    vertex(v3.x, v3.y);

    endShape();
  }
}

