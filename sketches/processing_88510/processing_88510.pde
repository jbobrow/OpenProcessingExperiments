
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/29833*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/* 
Circus Fluid
Made by Jared "BlueThen" C. on June 5th, 2011.
Updated June 7th, 2011 (Commenting, refactoring, coloring changes)

www.bluethen.com
www.twitter.com/BlueThen
www.openprocessing.org/portal/?userID=3044
www.hawkee.com/profile/37047/

Feel free to email me feedback, criticism, advice, job offers at:
bluethen (@) gmail.com
*/

// Variables for the timeStep
long previousTime;
long currentTime;
float timeScale = .1; // Play with this to slow down or speed up the fluid (the higher, the faster)
final int fixedDeltaTime = (int)(10 / timeScale);
float fixedDeltaTimeSeconds = (float)fixedDeltaTime / 1000;
float leftOverDeltaTime = 0;

// The grid for fluid solving
GridSolver grid;
Minim minim;
AudioPlayer player;

void setup () {

     minim = new Minim(this);
   player = minim.loadFile("The Aquatic Experience.mp3");
   player.play();

  size(1300, 700, P2D);
  colorMode(HSB, 255);
  noStroke();
  
  // grid = new GridSolver(integer cellWidth)
  grid = new GridSolver(5); 
}

void draw () {
 //soundstuff
 float soundleft = 0.0;
 float soundright = 0.0;
   for(int i = 0; i < player.bufferSize() - 1; i++)
  {
    soundleft = player.left.get(i);
    soundright = player.right.get(i);
    grid.sound = soundleft;
    float rrando = random(100);
    if(rrando >98){
     //  timeScale = abs(soundleft + soundright) * 0.2;
    }
  /*  float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    line( x1, 50 + player.left.get(i)*50, x2, 50 + player.left.get(i+1)*50 );
    line( x1, 150 + player.right.get(i)*50, x2, 150 + player.right.get(i+1)*50 );
    */
  }

 //endsoundstuff
 
 
  /******** Physics ********/
  // time related stuff
  
  // Calculate amount of time since last frame (Delta means "change in")
  currentTime = millis();
  long deltaTimeMS = (long)((currentTime - previousTime));
  previousTime = currentTime; // reset previousTime
  
  // timeStepAmt will be how many of our fixedDeltaTimes we need to make up for the passed time since last frame. 
  int timeStepAmt = (int)(((float)deltaTimeMS + leftOverDeltaTime) / (float)(fixedDeltaTime));
  
  // If we have any left over time left, add it to the leftOverDeltaTime.
  leftOverDeltaTime += deltaTimeMS - (timeStepAmt * (float)fixedDeltaTime); 
  
  if (timeStepAmt > 15) {
    timeStepAmt = 15; // too much accumulation can freeze the program!
    println("Time step amount too high");
  }
  
  // Update physics
  for (int iteration = 1; iteration <= timeStepAmt; iteration++) {
    grid.solve(fixedDeltaTimeSeconds * timeScale );
  }
  
  grid.draw();
  //println(frameRate);
}

/* Interation stuff below this line */

void mouseDragged () {
  // The ripple size will be determined by mouse speed
  float force = dist(mouseX, mouseY, pmouseX, pmouseY) * 255;
  
  /* This is bresenham's line algorithm
     http://en.wikipedia.org/wiki/Bresenham's_line_algorithm
     Instead of plotting points for a line, we create a ripple for each pixel between the
     last cursor pos and the current cursor pos 
  */
  float dx = abs(mouseX - pmouseX);
  float dy = abs(mouseY - pmouseY);
  float sx;
  float sy;
  if (pmouseX < mouseX)
    sx = 1;
  else
    sx = -1;
  if (pmouseY < mouseY)
    sy = 1;
  else
    sy = -1;
  float err = dx - dy;
  float x0 = pmouseX;
  float x1 = mouseX;
  float y0 = pmouseY;
  float y1 = mouseY;
  while ( (x0 != x1) || (y0 != y1)) {
    // Make sure the coordinate is within the window
    if (((int)(x0 / grid.cellSize) < grid.density.length) && ((int)(y0 / grid.cellSize) < grid.density[0].length) &&
      ((int)(x0 / grid.cellSize) > 0) && ((int)(y0 / grid.cellSize) > 0))
      grid.velocity[(int)(x0 / grid.cellSize)][(int)(y0 / grid.cellSize)] += force;
    float e2 = 2 * err;
    if (e2 > -dy) {
      err -= dy;
      x0 = x0 + sx;
    }
    if (e2 < dx) {
      err = err + dx;
      y0 = y0 + sy;
    }
  }
}

// If the user clicks instead of drags the mouse, we create a ripple at one spot.
void mouseClicked () {

  float force = 250000;
  if (((int)(mouseX / grid.cellSize) < grid.density.length) && ((int)(mouseY / grid.cellSize) < grid.density[0].length) &&
    ((int)(mouseX / grid.cellSize) > 0) && ((int)(mouseY / grid.cellSize) > 0)) {
    grid.velocity[(int)(mouseX / grid.cellSize)][(int)(mouseY / grid.cellSize)] += force;
  }
}

// Velocity: How fast each pixel is moving up or down
// Density: How much "fluid" is in each pixel.

// *note* 
// Density isn't conserved as far as I know. 
// Changing the velocity ends up changing the density too.

class GridSolver {
  int cellSize;
  float sound;
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
       /* fill( 350* cos(sound) * cos(density[x][y]*0.0004), 255, 350 * sin(velocity[x][y]/sound));  */
           fill(127 + 127 * cos(density[x][y]*0.0004), 255*cos(sound), 127 + 127 * sin(velocity[x][y]+0.1));
      /*  fill( 100 * sound, 255* cos(density[x][y]*0.0004), 200 * sin(velocity[x][y]/sound));*/
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



