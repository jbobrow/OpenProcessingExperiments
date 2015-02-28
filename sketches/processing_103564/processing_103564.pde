
// Lattice Gas Cellular Automata
// Press "e" empty the lattice.
// Press "u" to increase and "y" to decrease the frame rate.
// Press "g" to toggle loop and noLoop.
// Press "n" for the next iteration when not looping. 
// Press "<Space Bar>" to reset. 
// Press "l, r, t, b" to toggle left, right, top, bottom borders.
// Press "q" to add a square in the middle of the lattice.
// Press "a" to toggle a cylinder.
// Press "c" to toggle the complete border. 
// Press "w" to toggle a wall.    
// Press "f" to toggle a flow of velocity from the left.
// Press "s" to toggle a stream of velocity from the left.
// Press "<" and ">" to move stream of velocity.
// Press "+" and "-" to change stream of velocity width.
// Press "1 - 7" to test individual velocity vectors.
 
// (c) David Balash 2012
// Free software licensed under the Creative Commons 3.0 License
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// Attribution - Noncommerical - Share Alike

// Updated version by Amir Masoud Abdol (October 2012)
//   - Improve collision, propagation. It's more random now


// Sketch Variables
final int sWidth = 300;
final int sHeight = 300;
final int FRAME_RATE_NO_LOOP = 300;
final int lSize = 2;
final int lUnit = lSize / 1;
final int lWidth = (sWidth / lSize);// + 1;
final int lHeight = (sWidth / lSize);// + 1;
final int[] colorArray = {0xFFFFFF, 0x8000FFFF, 0x8000CCFF, 0x800099FF, 0x800066FF, 0x800033FF, 0x800000FF};


final int solidColor = #FF0000;
final int squareSize = 50;
final int RANDOM_INITIAL_VELOCITY = 0;
final int C1_INITIAL_VELOCITY = 1;
final int C2_INITIAL_VELOCITY = 2;
final int C3_INITIAL_VELOCITY = 3;
final int C4_INITIAL_VELOCITY = 4;
final int C5_INITIAL_VELOCITY = 5;
final int C6_INITIAL_VELOCITY = 6;
final int C1_C2_C3_C4_C5_C6_INITIAL_VELOCITY = 7;
final int SQUARE_VELOCITY = 13;
final int NO_VELOCITY = -1;
final int STREAM_LOCATION_MIN = 1;
final int STREAM_LOCATION_MAX = lHeight - 1;
final int STREAM_WIDTH_MIN = 1;
final int STREAM_WIDTH_MAX = lHeight - 2;
int initialVelocityDirection = NO_VELOCITY;
boolean toggleSolidBorder = true;
boolean toggleSolidLeftBorder = true;
boolean toggleSolidRightBorder = true;
boolean toggleSolidTopBorder = true;
boolean toggleSolidBottomBorder = true;
boolean toggleSolidWall = true;
boolean toggleFlow = false;
boolean toggleStream = true;
boolean toggleLoop = true;
boolean toggleCylinder = false;
boolean toggleHole = false;
int streamWidth = lHeight/2;
int streamLocation = (lHeight-streamWidth)/2;
int frameRateLoop = 60;

// Simulation Variables
// Based on the model provided in the book:
// "Lattice Boltzmann Modeling" by Sukop and Thorne
/*  FHP-I Model
 
         C3      C2
          \      /
           \    /
 C4  ------      ------  C1
           /    \
          /      \
         C5       C6
 */
// 
final int C1 = 1;        // 00000001
final int C2 = 2;        // 00000010
final int C3 = 4;        // 00000100
final int C4 = 8;        // 00001000
final int C5 = 16;       // 00010000
final int C6 = 32;       // 00100000
final int SOLID = 64;    // 01000000
final int RANDOM = 128;  // 10000000
final int collisionTableSize = 256;
final float randomBitProbability = .5;  //Model Behaviors are deeply defined by this variable

// Collision decision table as mentioned in book. 
int[] collisionTable = new int[collisionTableSize];

// Lattice initialization
int[][] lattice = new int[lWidth][lHeight];  // createLattice is responsible for initialization


void setup()
{
  size(300, 300);
  smooth();
  createCollisionTable();  // Generating CollisionTable
  createLattice();         // Initializing Lattice
}


void draw()
{
  // Clear the background, then draw the next state of the lattice.
  background(50);

  if (toggleHole)
    drawHole(true);
  collision();
  propagation();


  // Draw the lattice.
  drawLattice();
  frameRate(frameRateLoop);
}


void reset()
{
  createLattice();
  redraw();
}

/*
  Creating Collision table
 */
void createCollisionTable()
{
  // Initialize the collision table
  // It briefly described in the report about the initialization process
  // and why we initialize the collisionTable with i from 0 to 255
  for (int i = 0; i < collisionTableSize; i++)
  {
    collisionTable[i] = i;
  }

  // Add collision values to the collision table
  // Two particle head-on collisions
  /* Pre-collision
        C4  ------    ------  C1
   */
  /* Possible post-collision
                  C2
                  /
                 /
               
               / 
              / 
            C5      
   */
  /* Possible post-collision
             C3
              \
               \
               
                 \
                  \
                  C6
   */
  // In presence of random bit, the new rule should be added to collision table.

  collisionTable[C1 + C4] =  C2 + C5 + RANDOM;
  collisionTable[C1 + C4 + RANDOM] = C3 + C6;

  collisionTable[C2 + C5] = C3 + C6+ RANDOM;
  collisionTable[C2 + C5 + RANDOM] = C1 + C4 ;

  collisionTable[C3 + C6] = C1 + C4 + RANDOM;
  collisionTable[C3 + C6 + RANDOM] = C2 + C5;

  // Three particle head-on collisions
  /* Pre-collision
             C3
              \
               \
                 ------  C1
               /
              /
             C5
   */
  /* Post-collision
                 C2
                /
               /
    C4  ------
               \
                \
                 C6
   */
  // Again we have to consider random bit 

  collisionTable[C1 + C3 + C5] = C2 + C4 + C6 + RANDOM;
  collisionTable[C1 + C3 + C5 + RANDOM] = C2 + C4 + C6;

  collisionTable[C2 + C4 + C6] = C1 + C3 + C5 + RANDOM;
  collisionTable[C2 + C4 + C6 + RANDOM] = C1 + C3 + C5;
}

/**********************************************************
 Determine Collision Result
 In the case of collision with solid, we have to consider 
 Bounce Back (Reflection Rules) which described below:
         C1 <-> C4
         C2 <-> C5
         C3 <-> C6
 In this function we decide about the collision of two particles
 in a site. If particle (lattice[x][y]) has the SOLID bit, means that 
 we have to consider BOUNCE BACK for it.
 Result of collision between two particles is decided by looking at collisionTable.
 */
void collision()
{
  for (int i = 0; i < lWidth; i++)
  {
    for (int j = 0; j < lHeight; j++)
    {
      // Collision with a solid will bounce back in the opposite direction.
      if (solidInVelocity(lattice[i][j]))
      {
        // Solid state continues after a collision.
        int postCollision = SOLID;

        // Random bit continues after a collision.
        if (randomInVelocity(lattice[i][j]))
        {
          postCollision += RANDOM;
        }

        // Velocity vectors BOUNCE BACK in the opposite direction after a collision.
        if (velocityInC1(lattice[i][j]) == 1)
        {
          postCollision += C4;
        }
        if (velocityInC2(lattice[i][j]) == 1)
        {
          postCollision += C5;
        }
        if (velocityInC3(lattice[i][j]) == 1)
        {
          postCollision += C6;
        }
        if (velocityInC4(lattice[i][j]) == 1)
        {
          postCollision += C1;
        }
        if (velocityInC5(lattice[i][j]) == 1)
        {
          postCollision += C2;
        }
        if (velocityInC6(lattice[i][j]) == 1)
        {
          postCollision += C3;
        }

        lattice[i][j] = postCollision;
      }
      // Collision with another particle, then use the collision lookup table.
      else
      {
        int preCollision = lattice[i][j];
        int postCollision = collisionTable[preCollision];

        if (postCollision != preCollision)
        {
          // print("Collision:  Before = "  + preCollision + "  After = " + postCollision + "\n");
          lattice[i][j] = postCollision;
        }
      }
    }
  }
}


void propagation()
{
  // Using XOR to swap the value of RANDOM bit in each iteration to have
  // better RANDOM bit distribution.
  int numberPropagated = 0;
  int[][] latticeClone = new int[lWidth][lHeight];
  for (int i = 0; i < lWidth; i++)
  {
    for (int j = 0; j < lHeight; j++)
    {
      // Propagate the solid lattice structure
      if (solidInVelocity(lattice[i][j]))
      {
        latticeClone[i][j] += SOLID;
      }

      // C1
      if (i > 0 && velocityInC1(lattice[i - 1][j]) == 1)
      {
        latticeClone[i][j] += C1;
        numberPropagated++;

        // Propagate the random bit used for collisions
        if (randomInVelocity(lattice[i - 1][j]))
        {
          latticeClone[i][j] ^= RANDOM;
        }
      }

      // C2
      // Handle the offset in the lattice by checking to see if the row is odd or even.
      if (j % 2 != 0 && j < lHeight - 1 && velocityInC2(lattice[i][j + 1]) == 1)
      {
        latticeClone[i][j] += C2;
        numberPropagated++;

        // Propagate the random bit used for collisions
        if (randomInVelocity(lattice[i][j + 1]))
        {
          latticeClone[i][j] ^= RANDOM;
        }
      }
      else if (j % 2 == 0 && i > 0 && j < lHeight - 1 && velocityInC2(lattice[i - 1][j + 1]) == 1)
      {
        latticeClone[i][j] += C2;
        numberPropagated++;

        // Propagate the random bit used for collisions
        if (randomInVelocity(lattice[i - 1][j + 1]))
        {
          latticeClone[i][j] ^= RANDOM;
        }
      }

      // C3
      // Handle the offset in the lattice by checking to see if the row is odd or even.
      if (j % 2 == 0 && j < lHeight - 1 && velocityInC3(lattice[i][j + 1]) == 1)
      {
        latticeClone[i][j] += C3;
        numberPropagated++;

        // Propagate the random bit used for collisions
        if (randomInVelocity(lattice[i][j + 1]))
        {
          latticeClone[i][j] ^= RANDOM;
        }
      }
      else if (j % 2 != 0 && i < lWidth - 1 && j < lHeight - 1 && velocityInC3(lattice[i + 1][j + 1]) == 1)
      {
        latticeClone[i][j] += C3;
        numberPropagated++;

        // Propagate the random bit used for collisions
        if (randomInVelocity(lattice[i + 1][j + 1]))
        {
          latticeClone[i][j] ^= RANDOM;
        }
      }

      // C4
      if (i < lWidth - 1 && velocityInC4(lattice[i + 1][j]) == 1)
      {
        latticeClone[i][j] += C4;
        numberPropagated++;

        // Propagate the random bit used for collisions
        if (randomInVelocity(lattice[i + 1][j]))
        {
          latticeClone[i][j] ^= RANDOM;
        }
      }

      // C5
      // Handle the offset in the lattice by checking to see if the row is odd or even.
      if (j % 2 == 0 && j > 0 && velocityInC5(lattice[i][j - 1]) == 1)
      {
        latticeClone[i][j] += C5;
        numberPropagated++;

        // Propagate the random bit used for collisions
        if (randomInVelocity(lattice[i][j - 1]))
        {
          latticeClone[i][j] ^= RANDOM;
        }
      }
      else if (j % 2 != 0 && i < lWidth - 1 && j > 0 && velocityInC5(lattice[i + 1][j - 1]) == 1)
      {
        latticeClone[i][j] += C5;
        numberPropagated++;

        // Propagate the random bit used for collisions
        if (randomInVelocity(lattice[i + 1][j - 1]))
        {
          latticeClone[i][j] ^= RANDOM;
        }
      }          

      // C6
      // Handle the offset in the lattice by checking to see if the row is odd or even.          
      if (j % 2 != 0 && j > 0 && velocityInC6(lattice[i][j - 1]) == 1)
      {
        latticeClone[i][j] += C6;
        numberPropagated++;

        // Propagate the random bit used for collisions
        if (randomInVelocity(lattice[i][j - 1]))
        {
          latticeClone[i][j] ^= RANDOM;
        }
      }
      else if (j % 2 == 0 && i > 0 && j > 0 && velocityInC6(lattice[i - 1][j - 1]) == 1)
      {
        latticeClone[i][j] += C6;
        numberPropagated++;

        // Propagate the random bit used for collisions
        if (randomInVelocity(lattice[i - 1][j - 1]))
        {
          latticeClone[i][j] ^= RANDOM;
        }
      }

      // If we are flowing particles in add new vectors.
      if (toggleFlow && !toggleSolidLeftBorder && i == 0)
      {
        if (velocityInC1(latticeClone[i][j]) != 1)
        {
          latticeClone[i][j] += C1;

          // If the lattice at this location does not currently have a random bit, randomly add one.
          if (!randomInVelocity(latticeClone[i][j]))
          {
            latticeClone[i][j] += randomBit();
          }

          numberPropagated++;
        }
      }
      else if (toggleFlow && toggleSolidLeftBorder && i == 1 && j != 0 && j != lHeight - 1)
      {
        if (velocityInC1(latticeClone[i][j]) != 1)
        {
          latticeClone[i][j] += C1;

          // If the lattice at this location does not currently have a random bit, randomly add one.
          if (!randomInVelocity(latticeClone[i][j]))
          {
            latticeClone[i][j] += randomBit();
          }

          numberPropagated++;
        }
      }

      // If we are streaming particles in add new vectors.
      if (toggleStream && !toggleSolidLeftBorder && i == 0 && j >= streamLocation && j < streamLocation + streamWidth)
      {
        if (velocityInC1(latticeClone[i][j]) != 1)
        {
          latticeClone[i][j] += C1;

          // If the lattice at this location does not currently have a random bit, randomly add one.
          if (!randomInVelocity(latticeClone[i][j]))
          {
            latticeClone[i][j] += randomBit();
          }

          numberPropagated++;
        }
      }
      else if (toggleStream && toggleSolidLeftBorder && i == 1 && j >= streamLocation && j < streamLocation + streamWidth)
      {
        if (velocityInC1(latticeClone[i][j]) != 1)
        {
          latticeClone[i][j] += C1;

          // If the lattice at this location does not currently have a random bit, randomly add one.
          if (!randomInVelocity(latticeClone[i][j]))
          {
            latticeClone[i][j] += randomBit();
          }

          numberPropagated++;
        }
      }
    }
  }

  // Apply the propagations to the lattice
  lattice = latticeClone;

}

// There are some options available for initialization of the lattice.
void createLattice()
{
  for (int i = 0; i < lWidth; i++)
  {
    for (int j = 0; j < lHeight; j++)
    {
      int boarder = 0;
      switch(initialVelocityDirection)
      {
        // Start all lattice points with no velocity.
      case NO_VELOCITY:
        lattice[i][j] = 0;
        break;
        // Start all lattice points with a random velocity.
      case RANDOM_INITIAL_VELOCITY:
        lattice[i][j] = randomVelocity();
        break;
        // Start the first row of the lattice with C1 velocity.
      case C1_INITIAL_VELOCITY:
        lattice[i][j] = 0;
        // If the solid lattice border is on, then adjust for it.
        if (toggleSolidLeftBorder)
        {
          if (i == 1 && j != 0 && j != lHeight - 1)
          {
            lattice[i][j] = C1;
          }
        }
        else if (i == 0)
        {
          lattice[i][j] = C1;
        }
        break;
        // Start the last column of the lattice with the C2 velocity.
      case C2_INITIAL_VELOCITY:
        lattice[i][j] = 0;
        // If the solid lattice border is on, then adjust for it.
        if (toggleSolidBottomBorder)
        {
          if (j == lHeight - 2 && i != 0 && i != lWidth - 1)
          {
            lattice[i][j] = C2;
          }
        }
        else if (j == lHeight - 1)
        {
          lattice[i][j] = C2;
        }              
        break;
        // Start the last column of the lattice with the C3 velocity.
      case C3_INITIAL_VELOCITY:
        lattice[i][j] = 0;
        // If the solid lattice border is on, then adjust for it.
        if (toggleSolidBottomBorder)
        {
          if (j == lHeight - 2 && i != 0 && i != lWidth - 1)
          {
            lattice[i][j] = C3;
          }
        }
        else if (j == lHeight - 1)
        {
          lattice[i][j] = C3;
        }                  
        break;
        // Start the last row of the lattice with C4 velocity.
      case C4_INITIAL_VELOCITY:
        lattice[i][j] = 0;
        // If the solid lattice border is on, then adjust for it.
        if (toggleSolidRightBorder)
        {
          if (i == lWidth - 2 && j != 0 && j != lHeight - 1)
          {
            lattice[i][j] = C4;
          }
        }
        else if (i == lWidth - 1)
        {
          lattice[i][j] = C4;
        }          
        break;
        // Start the first column of the lattice with the C5 velocity.
      case C5_INITIAL_VELOCITY:
        lattice[i][j] = 0;
        // If the solid lattice border is on, then adjust for it.
        if (toggleSolidTopBorder)
        {
          if (j == 1 && i != 0 && i != lWidth - 1)
          {
            lattice[i][j] = C5;
          }
        }
        else if (j == 0)
        {
          lattice[i][j] = C5;
        }              
        break;
        // Start the first column of the lattice with the C6 velocity. 
      case C6_INITIAL_VELOCITY:
        lattice[i][j] = 0;
        // If the solid lattice border is on, then adjust for it.
        if (toggleSolidTopBorder)
        {
          if (j == 1 && i != 0 && i != lWidth - 1)
          {
            lattice[i][j] = C6;
          }
        }
        else if (j == 0)
        {
          lattice[i][j] = C6;
        }                  
        break;
      case C1_C2_C3_C4_C5_C6_INITIAL_VELOCITY:
        lattice[i][j] = 0;
        if (j == (lHeight / 2) - 1 && i == (lWidth / 2))
        {
          lattice[i][j] = C1 + C2 + C3 + C4 + C5 + C6 + randomBit();
        }
        break; 
      case SQUARE_VELOCITY:
        int startX = (lWidth / 2) - (squareSize / 2);
        int startY = (lHeight / 2) - (squareSize/ 2);
        int endX = (lWidth / 2) + (squareSize / 2);
        int endY = (lHeight / 2) + (squareSize / 2);

        if (i > startX && i < endX && j > startY && j < endY)
        {
          lattice[i][j] = C1 + C2 + C3 + C4 + C5 + C6 + randomBit();
        }
        break; 
        
        // default:
        //   lattice[i][j] = randomVelocity();
        // break;
      }


      // Setup the Solid Border
      if (toggleSolidLeftBorder)
      {
        if (i == 0)
        {
          lattice[i][j] = SOLID;
        }
      }
      if (toggleSolidRightBorder)
      {
        if (i == lWidth - 1)
        {
          lattice[i][j] = SOLID;
        }
      }
      if (toggleSolidTopBorder)
      {
        if (j == 0)
        {
          lattice[i][j] = SOLID;
        }
      }
      if (toggleSolidBottomBorder)
      {
        if (j == lHeight - 1)
        {
          lattice[i][j] = SOLID;
        }
      }
      if (toggleCylinder)
      {
        drawCircle(true, 0, 0);
      }
      // Setup the Solid Wall
      if (toggleSolidWall)
      {
        if (i == lWidth / 2 && j > (lHeight / 3) && j < ((2.6 * lHeight) / 4))
        {
          lattice[i][j] = SOLID;
        }
      }
    }
  }
}


void drawLattice()
{
  float lu = 1;

  for (int i = 0; i < lWidth; i++)
  {
    for (int j = 0; j < lHeight; j++)
    {
      float x = i * lSize;
      float y = j * lSize;

      fill(colorArray[mass(lattice[i][j])]);

      // This is a solid, use the solid fill color.
      if (solidInVelocity(lattice[i][j]))
      {
        fill(solidColor);
      }

      noStroke();
      rect(x, y, lu, lu);

//    saveFrame("/home/amir/fhp/" + str(i*lWidth + j) + ".tif");
    }
  }
}


void drawCircle(boolean onOff, int xCen, int yCen)
{
  int centerX=0;
  int centerY=0;
  int CYLINDER_RADIUS=0;
  if (xCen == 0 && yCen == 0) {
    centerX = lWidth / 2;
    centerY = lHeight / 2;
    CYLINDER_RADIUS = 20;

    for (int y = 0; y < CYLINDER_RADIUS; y++)
    {
      // Find width of circle at this y
      int width = (int) Math.sqrt(Math.pow(CYLINDER_RADIUS, 2) - Math.pow(y, 2));

      // Draw a horizontal line of that width
      for (int x = 0; x < width; x++)
      {
        if (onOff)
        {
          lattice[centerX + x][centerY + y] = SOLID;
          lattice[centerX + x][centerY - y] = SOLID;
          lattice[centerX - x][centerY + y] = SOLID;
          lattice[centerX - x][centerY - y] = SOLID;
        }
        else
        {
          lattice[centerX + x][centerY + y] = 0;
          lattice[centerX + x][centerY - y] = 0;
          lattice[centerX - x][centerY + y] = 0;
          lattice[centerX - x][centerY - y] = 0;
        }
      }
    }
  }
  else if (mousePressed) {
    centerX = xCen;
    centerY = yCen;
    CYLINDER_RADIUS = 5;
  }
}


void drawHole(boolean onOffHole){
  final float lu = 1; //lUnit ;
  int centerX=0;
  int centerY=0;
  int CYLINDER_RADIUS=20;
  centerX = lWidth / 2;
  centerY = lHeight / 2;
    for (int y = 0; y < CYLINDER_RADIUS; y++)
    {
      // Find width of circle at this y
      int width = (int) Math.sqrt(Math.pow(CYLINDER_RADIUS, 2) - Math.pow(y, 2));

      // Draw a horizontal line of that width
      for (int x = 0; x < width; x++)
      {
        fill(0);
        if (onOffHole)
        {
          lattice[centerX + x][centerY + y] = 0;
          rect(centerX + x, centerY + y, lu, lu);
          lattice[centerX + x][centerY - y] = 0;
          rect(centerX + x, centerY - y, lu, lu);          
          lattice[centerX - x][centerY + y] = 0;
          rect(centerX - x, centerY + y, lu, lu);          
          lattice[centerX - x][centerY - y] = 0;
          rect(centerX - x, centerY - y, lu, lu);          
        }
      }
    }
  
}


/*
  ____InVelocity funciton identify a specific bit in the data by bitwise operation.
 For instance solidInVelocity function find existence of SOLID bit in data.
 */
boolean solidInVelocity(int totalVelocity)
{
  boolean solidInVelocity = false;
  if (((totalVelocity >> 6) & 1) == 1)
  {
    solidInVelocity = true;
  }

  return solidInVelocity;
}


boolean randomInVelocity(int totalVelocity)
{
  boolean randomInVelocity = false;
  if (((totalVelocity >> 7) & 1) == 1)
  {
    randomInVelocity = true;
  }

  return randomInVelocity;
}


int velocityInC1(int totalVelocity)
{
  return totalVelocity & 1;
}          


int velocityInC2(int totalVelocity)
{
  return (totalVelocity >> 1) & 1;
}  


int velocityInC3(int totalVelocity)
{
  return (totalVelocity >> 2) & 1;
}


int velocityInC4(int totalVelocity)
{
  return (totalVelocity >> 3) & 1;
}


int velocityInC5(int totalVelocity)
{
  return (totalVelocity >> 4) & 1;
}


int velocityInC6(int totalVelocity)
{
  return (totalVelocity >> 5) & 1;
}

// This function count the number of particels in a lattice[x][y] which is mass in a site,
// Calculated mass, then will use to color the lattice[x][y]
int mass(int particles)
{
  int mass =
    velocityInC1(particles)
    + velocityInC2(particles)
      + velocityInC3(particles)
        + velocityInC4(particles)
          + velocityInC5(particles)
            + velocityInC6(particles); 

  return mass;
}

// Generating random bit
int randomBit()
{
  int randomBit = 0;
  float rv = random(0, 1);
  if (rv > randomBitProbability)
  {
    randomBit = RANDOM;
  }
  return randomBit;
}

// Adding random bit to the lattice[x][y] for lattice Initialization
int randomVelocity()
{
  int randomVelocity = 0;

  // C1
  if (random(0, 1) >= 0.5)
  {
    randomVelocity += C1;
  }
  // C2
  if (random(0, 1) >= 0.5)
  {
    randomVelocity += C2;
  }  
  // C3
  if (random(0, 1) >= 0.5)
  {
    randomVelocity += C3;
  }
  // C4
  if (random(0, 1) >= 0.5)
  {
    randomVelocity += C4;
  }
  // C5
  if (random(0, 1) >= 0.5)
  {
    randomVelocity += C5;
  }
  // C6
  if (random(0, 1) >= 0.5)
  {
    randomVelocity += C6;
  }  

  // RANDOM BIT
  randomVelocity += randomBit(); 

  return randomVelocity;
}

/***************************************************
*                    Event Handlers                *
****************************************************/
void mouseDragged() {
  lattice[mouseX][mouseY] = SOLID;
}

void keyPressed()
{
  // Velocity direction
  if (Character.getType(key) == Character.DECIMAL_DIGIT_NUMBER)
  {
    initialVelocityDirection = Integer.parseInt(Character.toString(key));
    reset();
  }
  // Next
  else if (key == 'n')
  {
    redraw();
  }
  // Reset <Space Bar>
  else if (key == ' ')
  {
    initialVelocityDirection = RANDOM_INITIAL_VELOCITY;
    reset();
  }
  // Toggle complete boarder
  else if (key == 'c')
  {
    if (toggleSolidBorder)
    {
      toggleSolidBorder = false;
      toggleSolidLeftBorder = false;
      toggleSolidRightBorder = false;
      toggleSolidTopBorder = false;
      toggleSolidBottomBorder = false;
    }
    else
    {
      toggleSolidBorder = true;
      toggleSolidLeftBorder = true;
      toggleSolidRightBorder = true;
      toggleSolidTopBorder = true;
      toggleSolidBottomBorder = true;
    }
    reset();
  }  
  // Toggle right boarder
  else if (key == 'r')
  {
    if (toggleSolidRightBorder)
    {
      toggleSolidRightBorder = false;
    }
    else
    {
      toggleSolidRightBorder = true;
    }
    reset();
  }
  // Toggle left boarder
  else if (key == 'l')
  {
    if (toggleSolidLeftBorder)
    {
      toggleSolidLeftBorder = false;
    }
    else
    {
      toggleSolidLeftBorder = true;
    }
    reset();
  }
  // Toggle top boarder
  else if (key == 't')
  {
    if (toggleSolidTopBorder)
    {
      toggleSolidTopBorder = false;
    }
    else
    {
      toggleSolidTopBorder = true;
    }
    reset();
  }
  // Toggle bottom boarder
  else if (key == 'b')
  {
    if (toggleSolidBottomBorder)
    {
      toggleSolidBottomBorder = false;
    }
    else
    {
      toggleSolidBottomBorder = true;
    }
    reset();
  }              
  // Toggle a wall
  else if (key == 'w')
  {
    if (toggleSolidWall)
    {
      toggleSolidWall = false;
    }
    else
    {
      toggleSolidWall = true;
    }
    reset();
  }
  // Toggle flow
  else if (key == 'f')
  {
    if (toggleFlow)
    {
      toggleFlow = false;
    }
    else
    {
      toggleFlow = true;
    }
  }
  // Toggle stream
  else if (key == 's')
  {
    if (toggleStream)
    {
      toggleStream = false;
    }
    else
    {
      toggleStream = true;
      toggleFlow = false;
    }
  }
  // Empty lattice
  else if (key == 'e')
  {
    initialVelocityDirection = NO_VELOCITY;
    reset();
  }
  // Move stream up
  else if (key == '<' || key == ',')
  {
    if (streamLocation > STREAM_LOCATION_MIN)
    {
      streamLocation--;
    }
  }
  // Move stream down
  else if (key == '>' || key == '.')
  {
    if (streamLocation + streamWidth < STREAM_LOCATION_MAX)
    {
      streamLocation++;
    }
  }
  // Resize stream down
  else if (key == '-' || key == '_')
  {
    if (streamWidth > STREAM_WIDTH_MIN)
    {
      streamWidth--;
    }
  }
  // Resize stream up
  else if (key == '+' || key == '=')
  {
    if (streamWidth < STREAM_WIDTH_MAX)
    {
      streamWidth++;
    }
  }  
  // Toggle looping
  else if (key == 'g')
  {
    if (toggleLoop)
    {
      toggleLoop = false;
      frameRate(FRAME_RATE_NO_LOOP);
      noLoop();
    }
    else
    {
      toggleLoop = true;
      frameRate(frameRateLoop);
      loop();
    }
  }
  // Toggle looping
  else if (key == 'g')
  {
    if (toggleLoop)
    {
      toggleLoop = false;
      frameRate(FRAME_RATE_NO_LOOP);
      noLoop();
    }
    else
    {
      toggleLoop = true;
      frameRate(frameRateLoop);
      loop();
    }
  }
  // Increase the frame rate
  else if (key == 'u')
  {
    if (frameRateLoop < 20)
    {
      frameRateLoop++;
      frameRate(frameRateLoop);
    }
  }
  // Decrease the frame rate
  else if (key == 'y')
  {
    if (frameRateLoop > 1)
    {
      frameRateLoop--;
      frameRate(frameRateLoop);
    }
  }
  // Create a square in the middle of the lattice
  else if (key == 'q')
  {
    initialVelocityDirection = SQUARE_VELOCITY;
    reset();
  }
  // Create a hole in the middle of the lattice
  else if (key == 'h')
  {
    if (toggleHole)
    {
      toggleHole = false;
      drawHole(false);
    }
    else
    {
      toggleHole = true;
      drawHole(true);
    }
  }
  // Create a cylinder solid in the middle of the lattice
  else if (key == 'a')
  {
    if (toggleCylinder)
    {
      toggleCylinder = false;
      drawCircle(false, 0, 0);
    }
    else
    {
      toggleCylinder = true;
      drawCircle(true, 0, 0);
    }
  }
}



