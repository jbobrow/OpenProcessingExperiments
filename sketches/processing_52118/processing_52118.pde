

// Class for making the Mesh
class Mesh {
  
  // Set variables
  int h = 1;
  int a = 1;
  float x, y, z;
  
  
  Mesh() {
    update();

  }
  
  // Update positions
  void update() {
    // new PVector array of points
    points = new PVector[num+1][circleNum+1][num+1];
    points2 = new PVector[num+1][circleNum+1];
    
    // get positions for PVector array
    for(int h=0; h<num; h++) 
      for(int i=0; i<circleNum+1; i++) 
        for(int j=0; j<num; j++)
          points[h][i][j] = calculate(h, i, j);
    for(int h=0; h<num; h++) 
      for(int i=0; i<circleNum+1; i++) 
          points2[h][i] = calculate2(h, i);
        
  }
  
  // Calculate positions points
  PVector calculate(float h, float i, float j) {
    // fill PVector array with x, y and z positions
    float x = (katrina[(int)j][3]*10) + cos(radians(i*10)) * katrina[(int)j][1];
    float y = (katrina[(int)j][4]*10) + sin(radians(i*10)) * katrina[(int)j][1];
    float z = h*10;
    
    // send x, y, z positions
    return new PVector(x, y, z); 
  }
  
  // Calculate positions points2
  PVector calculate2(float h, float i) {
    // fill PVector array with x, y and z positions
    float x = (katrina[(int)h][3]*10) + cos(radians(i*10)) * katrina[(int)h][1];
    float y = (katrina[(int)h][4]*10) + sin(radians(i*10)) * katrina[(int)h][1];
    float z = 20;
   
    // send x, y, z positions
    return new PVector(x, y, z); 
  }
  
  
  
  void draw() {
    
    for (int v = 0; v < circleNum; v++) {
          // Distorstion mapped to windSpeed
          float Distortion = map(katrina[a][1], 20, 150, 0, 10000); 
  
        // MESH 1: RINGS HORIZONTAL
          beginShape(TRIANGLES);
          
          fill(200, 90, 100);
          // variables for distortion
          float r1 = var1 * Distortion * random(-1,1);
          float r2 = var1 * Distortion * random(-1,1);
          float r3 = var1 * Distortion * random(-1,1);
          
          // To make mesh: draw two triangles, together they form a square 
          // to cover the space between four points. 
          
          // draw first triangle
          vertex(points[h][v][a].x+r1, points[h][v][a].y+r2, points[h][v][a].z+r3);
          vertex(points[h+1][v+1][a].x+r1, points[h+1][v+1][a].y+r2, points[h+1][v+1][a].z+r3);
          vertex(points[h][v+1][a].x+r1, points[h][v+1][a].y+r2, points[h][v+1][a].z+r3);
          endShape();
 


          beginShape(TRIANGLES);   
          
          // call distortion variables again so the two triangles have different distortion
          r1 = var1 * Distortion * random(-1,1);
          r2 = var1 * Distortion * random(-1,1);
          r3 = var1 * Distortion * random(-1,1);
          
          fill(230, 130, 100);
          // draw second triangle 
          vertex(points[h][v][a].x+r1, points[h][v][a].y+r2, points[h][v][a].z+r3);
          vertex(points[h+1][v+1][a].x+r1, points[h+1][v+1][a].y+r2, points[h+1][v+1][a].z+r3);
          vertex(points[h+1][v][a].x+r1, points[h+1][v][a].y+r2, points[h+1][v][a].z+r3);
          endShape();
          
        // MESH 2: RINGS VERTICAL
          beginShape(TRIANGLES);
          
          // call distortion variables again so these two triangles have different distortion
          r1 = var1 * Distortion * random(-1,1);
          r2 = var1 * Distortion * random(-1,1);
          r3 = var1 * Distortion * random(-1,1);
                                
          fill(200, 90, 100);
          // draw first triangle
          vertex(points2[a][v].x+r1, points2[a][v].y+r2, points2[a][v].z+r3);
          vertex(points2[a+1][v+1].x+r1, points2[a+1][v+1].y+r2, points2[a+1][v+1].z+r3);
          vertex(points2[a][v+1].x+r1, points2[a][v+1].y+r2, points2[a][v+1].z+r3);
          endShape();
 
        
          beginShape(TRIANGLES);  
          
          // call distortion variables again so the two triangles have different distortion
          r1 = var1 * Distortion * random(-1,1);
          r2 = var1 * Distortion * random(-1,1);
          r3 = var1 * Distortion * random(-1,1); 
          
          
          fill(230, 130, 100);
          // draw second triangle
          vertex(points2[a][v].x+r1, points2[a][v].y+r2, points2[a][v].z+r3);
          vertex(points2[a+1][v+1].x+r1, points2[a+1][v+1].y+r2, points2[a+1][v+1].z+r3);
          vertex(points2[a+1][v].x+r1, points2[a+1][v].y+r2, points2[a+1][v].z+r3);
          endShape();
          

    }

  
  
  
    // for everyframe draw new mesh so that size constantly changes
    a++;
    // when al data used, start over
    if (a >= num-1) a = 1;


    
  }
 
  
 
  
  
  
  
  
}

