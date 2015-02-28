
/**
 * <h1>Conway's Game of Life</h1>
 * <h2 class="byline">by <a href="http://subpixels.com">subpixel</a></h2>
 *
 * <p>Version 1.3.2, 2009-08-26</p>
 *
 * <p><em>Based on (though now far removed from) Conway.pde by Mike Davis</em></p>
 *
 * <p>At each iteration, the following transitions occur:</p>
 * <ol>
 *  <li>Any live cell with fewer than two live neighbours dies, as if by needs caused by underpopulation.</li>
 *  <li>Any live cell with more than three live neighbours dies, as if by overcrowding.</li>
 *  <li>Any live cell with two or three live neighbours lives, unchanged, to the next generation.</li>
 *  <li>Any tile with exactly three live neighbours cells will be populated with a living cell.</li>
 * </ol>
 *
 * <h2>Controls</h2>
 * <ul>
 *  <li>Mouse click/drag - make the cell at the mouse position "alive"</li>
 *  <li>[space] or right mouse click - pause/unpause the simulation</li>
 *  <li>[f]ade effect on/off</li>
 *  <li>[n] - new world (empty)</li>
 *  <li>[g] - set up a grid (click in it or press [r] to kick it off!)</li>
 *  <li>[a] - add a random cell (birth)</li>
 *  <li>[d] - delete a random cell (death)</li>
 *  <li>[1234567890] - grow new cells (1 few, 5 some, 9 many, 0 most)</li>
 *  <li>[qwertyuiop] - kill off cells (q few, t some, o many, p most)</li>
 * </ul>
 *
 * <h2>Optimisation</h2>
 * <p>Optimisations made reduce the time taken to render each
 * frame to nearly 40% compared to the original (on my 2GHz
 * Pentium-M based laptop) for a 1300x1000 world. The original
 * code (with a few lines added for the time calculation,
 * and the size() and frameRate() call parameters increased)
 * renders each iteration in around 170ms; this optimised version
 * takes only around 70ms (when there are relatively fewer births
 * and deaths). When there are a lot of births and deaths the time
 * can get much higher, but this usually only lasts a small number of
 * iterations until the number of births and deaths lowers again.
 * This of course won't be the case if you happen upon a pattern
 * such as a puffer train. :o)</p>
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
 *   reappears to specify the colour.
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
 *
 * DATA STRUCTURE
 * - Replace 3-dimensional array (holding both cell state and update value)
 *   with separate 2-dimensional cell state and update arrays. This could
 *   reduce each element address computation by a multiplication and an addition.
 *   This saves another maybe 11-13 adds AND mults (so around 24 calculations)
 *   _per pixel_. This last optimisation brought the average iteration
 *   time for a 1300x1000 world dowm from ~110ms to ~80ms (nearly 30%!),
 *   where the original algorithm took ~170ms. Quite a good improvement!
 *
 * 2009-01-10: v1.2 DATA STRUCTURE
 * - Replace 2-dimensional arrays with 1-dimensional arrays (and flip
 *   orientation such that successive array elements run along the x-axis).
 *
 * 2009-08-25: v1.3 UPDATE CYCLE
 * - Rewrite neighbour (and current cell) counting: cell inspections reduced to
 *   only 3 per cell calculation, using only assignment, addition and subtraction
 *   (no multiplies, single-dimension array indexing) for most cells (not the
 *   first column, which still has 9 array accesses per cell, a multiply or
 *   two and a couple of ternary operators). New time: ~70ms (1300x1000).
 *
 * 2009-08-26: v1.3.1 PROGRAM TIDY, RIGHT-CLICK PAUSE
 * - Added functionality to toggle paused state by right mouse click.
 * - Tidy code, complete/update comments, including algorith description.
 *
 * 2009-08-26: v1.3.2 FADE EFFECT
 * - Groovy. :o)
 */

// Using constants may allow optimisations by the compiler (well, maybe if
// it was a C/C++ compiler and not the lousy Java compiler!)

public final int SX = 600;
public final int SY = 400;

public final int SXSY = SX * SY;  // Total number of cells

public final int SX1 = SX - 1;
public final int SY1 = SY - 1;

// Note that the colour mode is set to HSB in setup() with a range for
// the hue values of HUEPERIOD (0 to HUEPERIOD - 1).
// As a guide, 1800 would give us a minute (60sec) for a full cycle at 30fps
// (though you shouldn't assume this to be the actual frame rate).
public final int HUEPERIOD  = 1800;
public final int HUEPERIOD1 = HUEPERIOD - 1;

// Note: code depends on these special values being what
// they are. Constants are used ere to make some of the
// code clearer, since "1", "-1", and "0" values have
// various meanings in different places.
public final int DEAD  = 0;
public final int ALIVE = 1;

// Further note: using BIRTH and DEATH is for semantic reasons;
// these are values for the updt[] array, not the current cell states.
public final int BIRTH = ALIVE;
public final int DEATH = DEAD;
public final int NO_CHANGE = -1;  // Anything other than BIRTH or DEATH

// World array dimensions: [SX, SY] -> single dimension [SX*SY], where
// the first array entry represents the northwest corner of the world and
// increasing the array index moves east (until the end of each row,
// at which point the next row south is started).
int[] cell;  // Current cell states (DEAD, ALIVE)
int[] updt;  // Updates for cells (BIRTH, DEATH, NO_CHANGE)

// Is the simulation paused?
boolean paused = false;

// Fade effect on?
boolean fade   = false;

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

  // Allow HUEPERIOD steps (0 to HUPERIOD - 1) for colour cycle
  colorMode(HSB, HUEPERIOD1, 100, 100);
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

  int c;  // current cell index
  int n;  // "north" of current cell ("y - 1", with wraparound)
  int s;  // "south" of current cell ("y + 1", with wraparound)
  int e;  // "east"  of current cell ("x + 1", with wraparound)
  int w;  // "west"  of current cell ("x - 1", with wraparound)
  int ne, se; // northeast, southeast cell indices

  int C;  // state of current cell
  int E;  // state of eastern cell

  int C1, C2, C3;  // Counts of live cells in western, centre, and eastern columns
  int neighbours;  // Number of "alive" neighbouring cells
  
  // Fade effect
  if (fade)
  {
    fill(0, 0, 0, 1);  // Black, minimal opacity
    noStroke();
    rect(0, 0, SX, SY);
  }
  
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

  int a = 0;
  for (y = 0; y < SY; y++)
  {
    for (x = 0; x < SX; x++, a++)
    {
      if ((update = updt[a]) != NO_CHANGE)
      {
        cell[a] = update;
        set(x, y, (update == BIRTH) ? cLive : cDead);
      }
    }
  }

  // Birth and death cycle
  
  // New neighbour-counting method:
  //
  // Reocgnise that as we move along a row, we are counting 6 of the same
  // cells when we move one cell to the east. Also observe that, using a
  // single dimensional array, moving to the east is simply increasing
  // the array index by 1. Addtionally, since there are certain cells of
  // interest, we can store the value of those particular cells instead of
  // doing an array access each time the cell value is needed.
  // The basic method is to make counts of the three "columns" of the
  // currenc cell under consideration and its 8 neighbours.
  //
  // In the diagram, the labels are the variables holding the array index
  // for that cell. Variables with capical letters hold the value (cell state)
  // of that cell. eg C == cell[c], E == cell[e]
  //   :    :    :    :
  // --+----+----+----+--    C1 = NW + W + SW  Sum of column 1
  //   | nw | n  | ne |      C2 = N  + C + S   Sum of column 2
  // --+----+----+----+--    C3 = NE + E + SE  Sum of column 3
  //   |  w | c  |  e |      neighbours = (C1 + C2 + C3) - C
  // --+----+----+----+--    
  //   | sw | s  | se |      We can see that, when moving one cell to the
  // --+----+----+----+--    east, the sums for two of the columns are the
  //   :    :    :    :      same as last time, so we only need to find the
  //                         sum of the new eastern column (the new C3).
  //
  // As well as the column totals, we might as well keep track of the current
  // cell state (C) and the eastern cell state (E), since the current cell state
  // is used both in the new calculation for the number of neighbours (the sum
  // of all three columns less the current cell itself) and in the rules for
  // determining the new cell state, and the eastern cell becomes the current
  // cell when we move one cell to the east.
  //
  // Of course there are special cases for the start of each row (where all three
  // column sums need to be calculated) and the end of the row (where we need to
  // determine the array indices ne, e, se allowing for the wraparound), and there
  // is also a small amount of magic to handle setting the starting array indices
  // for the top row and the bottom row.

  

  for (y = 0; y < SY; y++)
  {
    // First cell of row

    c = y * SX; // current cell
    e = c + 1;  // cell to the east

    // Handle neighbours wrapping at top and bottom edges
    n = (y == 0)   ? SY1 * SX : c - SX;  // cell to the north
    s = (y == SY1) ? 0        : c + SX;  // cell to the south
    
    ne = n + 1;  // cell to the north east
    se = s + 1;  // cell to the south east

    C = cell[c];
    E = cell[e];

    // Since ALIVE is 1 and DEAD is 0, adding the cell states
    // convenietly gives us a count.

    C1 = cell[n + SX1] + cell[c + SX1] + cell[s + SX1];  // west column
    C2 = cell[n]       + C             + cell[s];        // centre column
    C3 = cell[ne]      + E             + cell[se];       // east column

    neighbours = C1 + C2 + C3 - C;  // sum of colums less current cell

    if (neighbours == 3 && C == DEAD) 
      updt[c] = BIRTH;
    else if ((neighbours < 2 || neighbours > 3) && C == ALIVE) 
      updt[c] = DEATH;
    else
      updt[c] = NO_CHANGE;

    // Bulk of cells in row (all except first and last cells)
    
    for (x = 1; x < SX1; x++)
    {
      // Shift everything east...
      c = e;
      ne++;
      e++;
      se++;
      // Get new cell values
      C = E;
      E = cell[e];
      // Get new column totals
      C1 = C2;
      C2 = C3;
      C3 = cell[ne] + E + cell[se];
      // Count total neighbours
      neighbours = C1 + C2 + C3 - C;

      if (neighbours == 3 && C == DEAD) 
        updt[c] = BIRTH;
      else if ((neighbours < 2 || neighbours > 3) && C == ALIVE) 
        updt[c] = DEATH;
      else
        updt[c] = NO_CHANGE;
    } 
    
    // Last cell of row
    
    // Shift everything east...
    c = e;
    // East meets west! Jump back to start of row
    ne -= SX1;
    e  -= SX1;
    se -= SX1;
    // Get new cell values
    C = E;
    E = cell[e];
    // Get new column totals
    C1 = C2;
    C2 = C3;
    C3 = cell[ne] + E + cell[se];
    // Count total neighbours
    neighbours = C1 + C2 + C3 - C;

    if (neighbours == 3 && C == DEAD) 
      updt[c] = BIRTH;
    else if ((neighbours < 2 || neighbours > 3) && C == ALIVE) 
      updt[c] = DEATH;
    else
      updt[c] = NO_CHANGE;
  }

//  /*  *** TIMING CODE *** Uncomment to activate */
//  numFrames++;
//  int timeNow = millis();
//  int frameMillis = timeNow - prevMillis;
//  int totalMillis = timeNow - startMillis;
//  int averageMillis = int(float(totalMillis) / numFrames);
//  if (numFrames % 100 == 1) println("[" + numFrames + "] " + frameMillis + " / " + averageMillis + "ms");
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
  if (mouseButton == LEFT)
    updt[constrain(mouseX, 0, SX1) + SX * constrain(mouseY, 0, SY1)] = ALIVE;
  else if (mouseButton == RIGHT)
    togglePause();
}
void mouseDragged()
{
  if (mouseButton == LEFT)
    updt[constrain(mouseX, 0, SX1) + SX * constrain(mouseY, 0, SY1)] = ALIVE;
}
//void mouseReleased()
//{
//  // Nothin doin!
//}

// ------------------------------------------------------------
// Handle keyboard input
// ------------------------------------------------------------
void keyPressed()
{
  switch (key)
  {
    case ' ': togglePause();  break;
    case 'f': toggleFade();   break;
    case 'g': gridWorld();    break;
    case 'n': newWorld();     break;

    case 'a': randomBirth();  break;
    case 'd': randomDeath();  break;
    
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
  cell = new int[SX*SY];
  updt = new int[SX*SY];
  resetCounters();
}

// ------------------------------------------------------------
// Create a grid world
// ------------------------------------------------------------
void gridWorld()
{
  int i, j, x, y, update;

  for (x = 0; x < SX; x++)
  {
    for (y = 0; y < SY; y++)
    {
      // i,j is simply x,y offset from the origin
      i = x + 4;
      j = y + 4;

      // Kill off the first 2 of 4, and the first 8 of 40 rows and columns
      update = ( i % 4  < 2 || j % 4  < 2 ||
                 i % 40 < 8 || j % 40 < 8 ) ? DEATH : BIRTH;

      updt[x + SX * y] = update;
    }
  }

  resetCounters();
}

// ------------------------------------------------------------
// Seed a number of new "live" cells proportional to the size of
// the world and the passed density
// ------------------------------------------------------------
void heatWorld(float density)
{
  int numberToSeed = ceil(density * SXSY);

  for (int i = 0; i < numberToSeed; i++)
    randomBirth();
  
  resetCounters();
}

// ------------------------------------------------------------
// Kill off a number of "live" cells proportional to the size of
// the world and the passed density
// ------------------------------------------------------------
void coolWorld(float density)
{
  int numberToKill = ceil(density * SXSY);
  
  for (int i = 0; i < numberToKill; i++)
    randomDeath();
  
  resetCounters();
}

// ------------------------------------------------------------
// Birth a random cell
// Make up to 10 attempts in case of selecting live cells
// ------------------------------------------------------------
void randomBirth()
{
  int a;

  for (int i = 0; i < 10; i++)
  {
    a = int(random(SXSY));
    
    if (cell[a] == DEAD)
    {
      updt[a] = BIRTH;
      break;
    }
  }
}

// ------------------------------------------------------------
// Kill a random cell
// Make up to 10 attempts in case of selecting dead cells
// ------------------------------------------------------------
void randomDeath()
{
  int a;

  for (int i = 0; i < 10; i++)
  {
    a = int(random(SXSY));

    if (cell[a] == ALIVE)
    {
      updt[a] = DEATH;
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

// ------------------------------------------------------------
// Toggle paused sttaus
// ------------------------------------------------------------
void togglePause()
{
  paused = !paused;
  if (paused)
    noLoop();
  else
    loop();
}

// ------------------------------------------------------------
// Toggle fade effect
// ------------------------------------------------------------
void toggleFade()
{
  fade = !fade;
}


