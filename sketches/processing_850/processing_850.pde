
/**
 * <h1>Conway's Game of Life</h1>
 * <h2 class="byline">by <a href="http://subpixels.com">subpixel</a></h2>
 *
 * <p>Version 1.1, 2008-12-31</p>
 *
 * <p><em>Based on Conway by Mike Davis</em></p>
 *
 * <p>At each iteration, the following transitions occur:</p>
 * <ol>
 *  <li>Any live cell with fewer than two live neighbours dies, as if by
 *      problems caused by underpopulation.</li>
 *  <li>Any live cell with more than three live neighbours dies, as if by
 *      overcrowding.</li>
 *  <li>Any live cell with two or three live neighbours lives, unchanged,
 *      to the next generation.</li>
 *  <li>Any tile with exactly three live neighbours cells will be populated
 *      with a living cell.</li>
 * </ol>
 *
 * <p>In this version there is a gradually changing colour; new cells are
 * coloured brightly, and cells that die are coloured with a less saturated
 * and less bright colour, so you can see a sort of history (or trails).</p>
 *
 * <h2>Controls</h2>
 * <ul>
 *  <li>Mouse click/drag - make the cell at the mouse position "alive"</li>
 *  <li>[space] - pause/unpause the simulation</li>
 *  <li>[n] - new world (empty)</li>
 *  <li>[g] - set up a grid (click in it or press [r] to kick it off!)</li>
 *  <li>[a] - add a random cell (birth)</li>
 *  <li>[d] - kill a random cell (death)</li>
 *  <li>[1234567890] - grow new cells (1 few, 5 some, 9 many, 0 most)</li>
 *  <li>[qwertyuiop] - kill off cells (q few, t some, o many, p most)</li>
 * </ul>
 *
 * <h2>Optimisation</h2>
 * <p>Optimisations made reduce the time taken to render each
 * frame by around 50% or more compared to the original on my machine
 * (2GHz Pentium-M based laptop). eg, for a 1300x1000 world, the
 * original code (with a few lines added for the time calculation,
 * and the size() and frameRate() call parameters increased)
 * renders each iteration in around 170ms; the optimised program
 * takes only around 80ms (when there are relatively fewer births
 * and deaths; when there are a lot of births and deaths the time
 * can get much higher, but this usually only lasts a few iterations
 * until the number of births and deaths lowers again.</p>
 *
 * <p>See the program source for details.</p>
 */

/* Optimisations:
 *
 * DRAWING AND UPDATE CYCLE
 * - Only cells that have changed (birth or death) are drawn/updated.
 *   (this means not clearing the screen at the start of the frame;
 *   instead cell deaths are individually plotted)
 * - Incompatible "-1" for death and "0" for dead (or not lit) cells
 *   have been rationalised to both be "0". No change (previously "0")
 *   is now "-1", and birth("1") still equates with alive or on ("1").
 *   This allowed removal of separate handling for the death case (with
 *   a bit of cheating to set the colour of the pixel using a multiply
 *   operation instead of conditional logic by virtue of colour value
 *   times zero = "black"), resulting in a single, simple comparison of
 *   the update entry for each cell instead of up to four comparisons
 *   (involving both the current cell state and the update entry)
 *   and additional boolean operators. In further tinkering with this
 *   code I decided to put some colour into the picture so could no
 *   longer cheat with the multiply trick, so a ternary operator
 *   appears to select the colour. At least the code is tidier.
 * - The "world[x][y][1] = 0" instruction (reset the update entry for
 *   the cell to the no_change state) has been removed. Actually, it
 *   is moved to the logic below that sets the update entry based on
 *   the number of neighbours. The nett effect is that each cell's
 *   update entry will be modified only once per iteration instead
 *   twice for any cell that is born or dies. This is a trade-off,
 *   increasing logic but reducing memory writes, which I'm _guessing_
 *   to be potentially expensive.
 *
 * BIRTH AND DEATH CYCLE
 * - Replace expressions for x and y indices with simply determined values
 *   eg [(x + sx - 1) % sx] is replaced by [w], where w is calculated
 *   (actually only an assignment but could also be a simple increment)
 *   only once _per column_. In the central loop, this saves us around 18
 *   additions and subtractions and 12 mod (%) operations _per pixel_,
 *   without even hacking about with the way that the data is arranged
 *   and accessed. :o)
 * - Calculate neighbour count in-line (that is, don't call a function) to
 *   reduce call-and-return overhead.
 * - Access cell[][] elements in order of apearance in the array (to
 *   maximise locality).
 * - Replace 3-dimensional array (holding both cell state and update value)
 *   with separate 2-dimensional cell state and update arrays. This could
 *   reduce each element address computation by a multiplication and an addition.
 *   This saves another maybe 11-13 adds AND mults (so around 24 calculations)
 *   _per pixel_. This last optimisation brought the average iteration
 *   time for a 1300x1000 world dowm from ~110ms to ~80ms (nearly 30%!),
 *   where the original algorithm took ~170ms. Quite a good improvement!
 */

// Using constants might allow optimisations by the compiler

public final int SX = 600;
public final int SY = 400;

public final int SX1 = SX - 1;
public final int SY1 = SY - 1;

// Note: code depends on these special values being what
// they are. Constants are used ere to make some of the
// code clearer, since "1", "-1", and "0" values have
// various meanings in different places.
public final int ALIVE = 1;
public final int DEAD = 0;

public final int BIRTH = ALIVE;
public final int DEATH = DEAD;
public final int NO_CHANGE = -1;

// World array dimensions: [SX, SY]
// (current cell state and update entry for every pixel in the window)
int[][] cell;
int[][] updt;

// Is the simulation paused?
boolean paused = false;

// *** TIMING CODE VARIABLES ***
int startMillis;
int prevMillis;
int numFrames;

// ------------------------------------------------------------
// Initialise the output window and start with a random world.
// ------------------------------------------------------------
void setup() 
{
  // Make sure SX, SY match width and height. Ideally, SY and SY
  // should be passed to size() here, but without literals here
  // the "Export" function of the PDE doesn't know what the size is. :o(
  size(600, 400, P2D);  // Make sure this is matches SX and SY!
  
  if (SX != width || SY != height) throw new
    AssertionError( "size() does not match SX, SY" );

  frameRate(500);  // Set higher than simulation is likely to run at

  colorMode(HSB, 1799, 100, 100); // Allow 1800 steps for colour cycle
  background(0);
  
  newWorld();
  heatWorld(0.2);
}
 
// ------------------------------------------------------------
// Main draw routine (called for each frame)
// ------------------------------------------------------------
void draw() 
{
  // Maybe redeclaring local variables in inner scopes takes
  // up time, so declare them all at the start (and reuse them).
  int update;  // The value of the "update" entry for the current cell
  int x;  // Current cell's x index
  int y;  // Current cell's y index
  int n;  // "north" of current cell ("y - 1", with wraparound)
  int s;  // "south" of current cell ("y + 1", with wraparound)
  int e;  // "east"  of current cell ("x + 1", with wraparound)
  int w;  // "west"  of current cell ("x - 1", with wraparound)
  int count;  // Number of "alive" neighbouring cells
  
  // Drawing and update cycle.

  // Set the "alive" colour as a fully bright, fully saturated colour of
  // a rotating hue, and the "dead" colour as a less saturated, less bright
  // shade of the same hue. This gives us a kind of timeline for when cells
  // were birthed or died.
  // Note that the colour mode is set to HSB in setup() with a range for
  // the hue values of 1800 (0-1799), which would give us a minute (60sec)
  // for a full cycle at 30fps (though we don't generally assume this frame
  // rate).
  color cLive = color(frameCount % 1800, 100, 100);
  color cDead = color(frameCount % 1800, 75, 50);
  
  for (x = 0; x < SX; x++)
  {
    for (y = 0; y < SY; y++)
    {
      if ((update = updt[x][y]) != NO_CHANGE)
      {
        cell[x][y] = update;
        set(x, y, (update == BIRTH) ? cLive : cDead);
      }
    }
  }

  // Birth and death cycle
  
  for (x = 0; x < SX; x++)
  {
    // Handle neighbours wrapping at left and right edges
    w = (x == 0) ? SX1 : x - 1;
    e = (x == SX1) ? 0 : x + 1;
    
    // Top cell of column

    n = SY1;  // neighbours wrap around to bottom
    y = 0;    // top of column
    s = 1;    // neighbour beneath top cell

    // Since ALIVE is 1 and DEAD is 0, adding the cell states of the
    // neighbouring cells convenietly gives us a count.
    
    count = cell[w][n] +  // NW \
            cell[x][n] +  // N   > top row
            cell[e][n] +  // NE /
            cell[w][y] +  // W  \  middle
            cell[e][y] +  // E  /  row
            cell[w][s] +  // SW \
            cell[x][s] +  // S   > botttom row
            cell[e][s];   // SE /
        
    if (count == 3 && cell[x][y] == DEAD) 
      updt[x][y] = BIRTH;
    else if ((count < 2 || count > 3) && cell[x][y] == ALIVE) 
      updt[x][y] = DEATH;
    else
      updt[x][y] = NO_CHANGE;

    // Bulk of cells in column (all except top cell and bottom cell)
    
    for (n = 0, y = 1, s = 2; s < SY; n++, y++, s++)
    { 
      count = cell[w][n] +  // NW \
              cell[x][n] +  // N   > top row
              cell[e][n] +  // NE /
              cell[w][y] +  // W  \  middle
              cell[e][y] +  // E  /  row
              cell[w][s] +  // SW \
              cell[x][s] +  // S   > botttom row
              cell[e][s];   // SE /
          
      if (count == 3 && cell[x][y] == DEAD) 
        updt[x][y] = BIRTH;
      else if ((count < 2 || count > 3) && cell[x][y] == ALIVE) 
        updt[x][y] = DEATH;
      else
        updt[x][y] = NO_CHANGE;
    } 
    
    // Bottom cell of column
    
    s = 0;  // neighbours wrap around to top

    count = cell[w][n] +  // NW \
            cell[x][n] +  // N   > top row
            cell[e][n] +  // NE /
            cell[w][y] +  // W  \  middle
            cell[e][y] +  // E  /  row
            cell[w][s] +  // SW \
            cell[x][s] +  // S   > botttom row
            cell[e][s];   // SE /
        
    if (count == 3 && cell[x][y] == DEAD) 
      updt[x][y] = BIRTH;
    else if ((count < 2 || count > 3) && cell[x][y] == ALIVE) 
      updt[x][y] = DEATH;
    else
      updt[x][y] = NO_CHANGE;
  }

//  /*  *** TIMING CODE *** Uncomment to activate */
//  numFrames++;
//  int timeNow = millis();
//  int frameMillis = timeNow - prevMillis;
//  int totalMillis = timeNow - startMillis;
//  int averageMillis = int(float(totalMillis) / numFrames);
//  if (numFrames % 100 == 1)
//    println("["+numFrames+"] "+frameMillis+" / "+averageMillis+"ms");
//  prevMillis = timeNow;  
//  /* *** END OF TIMING CODE *** */
} 

// ------------------------------------------------------------
// Draw onto the world (set lit pixels) with the mouse.
// The simulation is paused while drawing so that multiple
// new cells can be added in a single iteration.
//
// Note: mouseX and mouseY _can_ be outside the window
// dimensions (including negative) by the user clickig
// and dragging out of the window. constrain() is used
// to keep access within the updt[][]array bounds.
// ------------------------------------------------------------
void mousePressed()
{
  noLoop();
  updt[constrain(mouseX, 0, SX1)][constrain(mouseY, 0, SY1)] = ALIVE;
}
void mouseDragged()
{
  updt[constrain(mouseX, 0, SX1)][constrain(mouseY, 0, SY1)] = ALIVE;
}
void mouseReleased()
{
  loop();
}

// ------------------------------------------------------------
// Handle keyboard input
// ------------------------------------------------------------
void keyPressed()
{
  switch (key)
  {
    case ' ':  // Toggle paused
      paused = !paused;
      if (paused)
        noLoop();
      else
        loop();
      
      break;
  
    case 'g':  // Set up a grid
      int i, j, x, y, update;
      for (x = 0; x < SX; x++)
      {
        for (y = 0; y < SY; y++)
        {
          i = (x + 4) % SY;
          j = (y + 4) % SY;
          update = ( i % 4  < 2 || j % 4  < 2 ||
                     i % 40 < 8 || j % 40 < 8 ) ? DEATH : BIRTH;
          updt[x][y] = update;
        }
      }
      
      resetCounters();
      break;

    case 'n': newWorld(); break;
    
    case 'a': randomBirth(); break;
    case 'd': randomDeath(); break;
    
    case '1': heatWorld(0.01); break;
    case '2': heatWorld(0.02); break;
    case '3': heatWorld(0.03); break;
    case '4': heatWorld(0.04); break;
    case '5': heatWorld(0.05); break;
    case '6': heatWorld(0.10); break;
    case '7': heatWorld(0.15); break;
    case '8': heatWorld(0.20); break;
    case '9': heatWorld(0.25); break;
    case '0': heatWorld(0.30); break;

    case 'q': coolWorld(0.01); break;
    case 'w': coolWorld(0.02); break;
    case 'e': coolWorld(0.03); break;
    case 'r': coolWorld(0.04); break;
    case 't': coolWorld(0.05); break;
    case 'y': coolWorld(0.10); break;
    case 'u': coolWorld(0.15); break;
    case 'i': coolWorld(0.20); break;
    case 'o': coolWorld(0.25); break;
    case 'p': coolWorld(0.30); break;
  }
}

// ------------------------------------------------------------
// Create a new empty world
// ------------------------------------------------------------
void newWorld()
{
  cell = new int[SX][SY];
  updt = new int[SX][SY];
  resetCounters();
}

// ------------------------------------------------------------
// Seed a number of "live" cells proportional to the size of
// the world and the passed density
// ------------------------------------------------------------
void heatWorld(float density)
{
  for (int i = 0; i < SX * SY * density; i++)
    randomBirth();
  
  resetCounters();
}

// ------------------------------------------------------------
// Kill off a number of "live" cells proportional to the size of
// the world and the passed density
// ------------------------------------------------------------
void coolWorld(float density)
{
  for (int i = 0; i < SX * SY * density; i++)
    randomDeath();
  
  resetCounters();
}

// ------------------------------------------------------------
// Birth a random cell (or leave alive if already alive)
// ------------------------------------------------------------
void randomBirth()
{
  int x, y;
  for (int i = 0; i < 10; i++)
  {
    x = int(random(SX));
    y = int(random(SY));
    
    if (cell[x][y] == DEAD)
    {
      updt[x][y] = BIRTH;
      break;
    }
  }
}

// ------------------------------------------------------------
// Kill a random cell (or leave dead if already dead)
// ------------------------------------------------------------
void randomDeath()
{
  int x, y;
  for (int i = 0; i < 10; i++)
  {
    x = int(random(SX));
    y = int(random(SY));
    if (cell[x][y] == ALIVE)
    {
      updt[x][y] = DEATH;
      break;
    }
  }
}

// ------------------------------------------------------------
// Reset values used by the timing code
// ------------------------------------------------------------
void resetCounters()
{
  startMillis = prevMillis = millis();
  numFrames = 0;
} 


