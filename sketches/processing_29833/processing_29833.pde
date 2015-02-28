
// Velocity: How fast each pixel is moving up or down
// Density: How much "fluid" is in each pixel.

// *note* 
// Density isn't conserved as far as I know. 
// Changing the velocity ends up changing the density too.

class GridSolver {
  int cellSize;
  
  // Use 2 dimensional arrays to store velocity and density for each pixel.
  // To access, use this: grid[x/cellSize][y/cellSize]
  float [][] velocity;
  float [][] density;
  float [][] oldVelocity;
  float [][] oldDensity;
  
  float friction = 0.58;
  float speed = 20;
  
  /* Constructor */
  GridSolver (int sizeOfCells) {
    cellSize = sizeOfCells;
    velocity = new float[int(width/cellSize)][int(height/cellSize)];
    density = new float[int(width/cellSize)][int(height/cellSize)];
  }
  
  /* Drawing */
  void draw () {
    for (int x = 0; x < velocity.length; x++) {
      for (int y = 0; y < velocity[x].length; y++) {
        /* Sine probably isn't needed, but oh well. It's pretty and looks more organic. */
        fill(127 + 127 * sin(density[x][y]*0.0004), 255, 127 + 127 * sin(velocity[x][y]*0.01));
        rect(x*cellSize, y*cellSize, cellSize, cellSize);
      }
    }
  }
  
  /* "Fluid" Solving
   Based on http://www.cs.ubc.ca/~rbridson/fluidsimulation/GameFluids2007.pdf
   To help understand this better, imagine each pixel as a spring.
     Every spring pulls on springs adjacent to it as it moves up or down (The speed of the pull is the Velocity)
     This pull flows throughout the window, and eventually deteriates due to friction
  */
  void solve (float timeStep) {
    // Reset oldDensity and oldVelocity
    oldDensity = (float[][])density.clone();  
    oldVelocity = (float[][])velocity.clone();
    
    for (int x = 0; x < velocity.length; x++) {
      for (int y = 0; y < velocity[x].length; y++) {
        /* Equation for each cell:
           Velocity = oldVelocity + (sum_Of_Adjacent_Old_Densities - oldDensity_Of_Cell * 4) * timeStep * speed)
           Density = oldDensity + Velocity
           Scientists and engineers: Please don't use this to model tsunamis, I'm pretty sure it's not *that* accurate
        */
        velocity[x][y] = friction * oldVelocity[x][y] + ((getAdjacentDensitySum(x,y) - density[x][y] * 4) * timeStep * speed);
        density[x][y] = oldDensity[x][y] + velocity[x][y];
      }
    }
  }

  float getAdjacentDensitySum (int x, int y) {
    // If the x or y is at the boundary, use the closest available cell
    float sum = 0;
    if (x-1 > 0)
      sum += oldDensity[x-1][y];
    else
      sum += oldDensity[0][y];
      
    if (x+1 <= oldDensity.length-1)
      sum += (oldDensity[x+1][y]);
    else
      sum += (oldDensity[oldDensity.length-1][y]);
      
    if (y-1 > 0)
      sum += (oldDensity[x][y-1]);
    else
      sum += (oldDensity[x][0]);
      
    if (y+1 <= oldDensity[x].length-1)
      sum += (oldDensity[x][y+1]);
    else
      sum += (oldDensity[x][oldDensity[x].length-1]);
      
    return sum;
  }
}


