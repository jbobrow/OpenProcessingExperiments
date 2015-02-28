
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
 
// Sketch Variables
final int SKETCH_WIDTH = 750;
final int SKETCH_HEIGHT = 750;
final int FRAME_RATE_NO_LOOP = 300;
final int LATTICE_SIZE = 4;
final int LATTICE_UNIT = LATTICE_SIZE / 2;
final int LATTICE_WIDTH = (SKETCH_WIDTH / LATTICE_SIZE) + 1;
final int LATTICE_HEIGHT = (SKETCH_WIDTH / LATTICE_SIZE) + 1;
final int[] DENSITY_COLOR_ARRAY = {0xFFFFFF, 0x8000FFFF, 0x8000CCFF, 0x800099FF, 0x800066FF, 0x800033FF, 0x800000FF};
final int HEXAGON_COLOR = 0x40808080;
final int HEXAGON_STROKE_WEIGHT = 2;
final int SOLID_COLOR = 0x8000CC66;
final int SQUARE_SIZE = 50;
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
final int STREAM_LOCATION_MAX = LATTICE_HEIGHT - 1;
final int STREAM_WIDTH_MIN = 1;
final int STREAM_WIDTH_MAX = LATTICE_HEIGHT - 2;
int initialVelocityDirection = NO_VELOCITY;
boolean toggleSolidBorder = true;
boolean toggleSolidLeftBorder = false;
boolean toggleSolidRightBorder = false;
boolean toggleSolidTopBorder = true;
boolean toggleSolidBottomBorder = true;
boolean toggleSolidWall = false;
boolean toggleFlow = false;
boolean toggleStream = true;
boolean toggleLoop = true;
boolean toggleCylinder = true;
int streamWidth = 80;
int streamLocation = 54;
int frameRateLoop = 20;


// Simulation Variables
// Based on the model provided in the book:
// "Lattice Boltzmann Modeling" by Sukop and Thorne
/*  FHP Model 

           C3        C2
             \      / 
              \    /
     C4  ------    ------  C1
              /    \
             /      \
           C5        C6
*/
final int C1 = 1;
final int C2 = 2;
final int C3 = 4;
final int C4 = 8;
final int C5 = 16;
final int C6 = 32;
final int SOLID = 64;
final int RANDOM = 128;
final int COLLISION_TABLE_SIZE = 256;
final float PROBABILITY_OF_RANDOM_BIT = 0.2;

// The collision table global array used as a lookup table to find the proper collision results.
int[] collisionTable = new int[COLLISION_TABLE_SIZE];

// The lattice global two dimensional array used to store the sum of the velocity vectors.
int[][] lattice = new int[LATTICE_WIDTH][LATTICE_HEIGHT];


void setup()
{ 
	size(SKETCH_WIDTH, SKETCH_HEIGHT); 
	smooth();
	createCollisionTable();
	createLattice();
} 
 
 
void draw()
{
	// Clear the background, then draw the next state of the lattice.
	background(255);

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


void createCollisionTable()
{
	// Initialize the collision table
	for (int i = 0; i < COLLISION_TABLE_SIZE; i++)
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

		
		
	collisionTable[C1 + C4] =  C2 + C5;
	collisionTable[C1 + C4 + RANDOM] = C3 + C6 + RANDOM;
	
	collisionTable[C2 + C5] = C3 + C6;
	collisionTable[C2 + C5 + RANDOM] = C1 + C4 + RANDOM;
	
	collisionTable[C3 + C6] = C1 + C4;
	collisionTable[C3 + C6 + RANDOM] = C2 + C5 + RANDOM;
		
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
	collisionTable[C1 + C3 + C5] = C2 + C4 + C6;
	collisionTable[C1 + C3 + C5 + RANDOM] = C2 + C4 + C6 + RANDOM;
	
	collisionTable[C2 + C4 + C6] = C1 + C3 + C5;
	collisionTable[C2 + C4 + C6 + RANDOM] = C1 + C3 + C5 + RANDOM;
}


void collision()
{
	for (int i = 0; i < LATTICE_WIDTH; i++)
	{
		for (int j = 0; j < LATTICE_HEIGHT; j++)
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
				
				// Velocity vectors bounce back in the opposite direction after a collision.
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
	int numberPropagated = 0;
	int[][] latticeClone = new int[LATTICE_WIDTH][LATTICE_HEIGHT]; 
	for (int i = 0; i < LATTICE_WIDTH; i++)
	{
		for (int j = 0; j < LATTICE_HEIGHT; j++)
		{
			// Propagate the solid lattice structure
			if (solidInVelocity(lattice[i][j]))
			{
				latticeClone[i][j] += SOLID;
			}
			
			// Propagate the velocity in the C1 direction.
			if (i > 0 && velocityInC1(lattice[i - 1][j]) == 1)
			{
				latticeClone[i][j] += C1;
				numberPropagated++;
				
				// Propagate the random bit used for collisions
				if (randomInVelocity(lattice[i - 1][j]) && !randomInVelocity(latticeClone[i][j]))
				{
					latticeClone[i][j] += RANDOM;
				}
			}

			// Propagate the velocity in the C2 direction.
			// Handle the offset in the lattice by checking to see if the row is odd or even.
			if (j % 2 != 0 && j < LATTICE_HEIGHT - 1 && velocityInC2(lattice[i][j + 1]) == 1)
			{
				latticeClone[i][j] += C2;
				numberPropagated++;
				
				// Propagate the random bit used for collisions
				if (randomInVelocity(lattice[i][j + 1]) && !randomInVelocity(latticeClone[i][j]))
				{
					latticeClone[i][j] += RANDOM;
				}
			}
			else if (j % 2 == 0 && i > 0 && j < LATTICE_HEIGHT - 1 && velocityInC2(lattice[i - 1][j + 1]) == 1)
			{
				latticeClone[i][j] += C2;
				numberPropagated++;
				
				// Propagate the random bit used for collisions
				if (randomInVelocity(lattice[i - 1][j + 1]) && !randomInVelocity(latticeClone[i][j]))
				{
					latticeClone[i][j] += RANDOM;
				}
			}
			
			// Propagate the velocity in the C3 direction.
			// Handle the offset in the lattice by checking to see if the row is odd or even.
			if (j % 2 == 0 && j < LATTICE_HEIGHT - 1 && velocityInC3(lattice[i][j + 1]) == 1)
			{
				latticeClone[i][j] += C3;
				numberPropagated++;
				
				// Propagate the random bit used for collisions
				if (randomInVelocity(lattice[i][j + 1]) && !randomInVelocity(latticeClone[i][j]))
				{
					latticeClone[i][j] += RANDOM;
				}
			}
			else if (j % 2 != 0 && i < LATTICE_WIDTH - 1 && j < LATTICE_HEIGHT - 1 && velocityInC3(lattice[i + 1][j + 1]) == 1)
			{
				latticeClone[i][j] += C3;
				numberPropagated++;
				
				// Propagate the random bit used for collisions
				if (randomInVelocity(lattice[i + 1][j + 1]) && !randomInVelocity(latticeClone[i][j]))
				{
					latticeClone[i][j] += RANDOM;
				}
			}
			
			// Propagate the velocity in the C4 direction.
			if (i < LATTICE_WIDTH - 1 && velocityInC4(lattice[i + 1][j]) == 1)
			{
				latticeClone[i][j] += C4;
				numberPropagated++;
				
				// Propagate the random bit used for collisions
				if (randomInVelocity(lattice[i + 1][j]) && !randomInVelocity(latticeClone[i][j]))
				{
					latticeClone[i][j] += RANDOM;
				}
			}
			
			// Propagate the velocity in the C5 direction.
			// Handle the offset in the lattice by checking to see if the row is odd or even.
			if (j % 2 == 0 && j > 0 && velocityInC5(lattice[i][j - 1]) == 1)
			{
				latticeClone[i][j] += C5;
				numberPropagated++;
				
				// Propagate the random bit used for collisions
				if (randomInVelocity(lattice[i][j - 1]) && !randomInVelocity(latticeClone[i][j]))
				{
					latticeClone[i][j] += RANDOM;
				}
			}
			else if (j % 2 != 0 && i < LATTICE_WIDTH - 1 && j > 0 && velocityInC5(lattice[i + 1][j - 1]) == 1)
			{
				latticeClone[i][j] += C5;
				numberPropagated++;
				
				// Propagate the random bit used for collisions
				if (randomInVelocity(lattice[i + 1][j - 1]) && !randomInVelocity(latticeClone[i][j]))
				{
					latticeClone[i][j] += RANDOM;
				}
			}			

			// Propagate the velocity in the C6 direction.
			// Handle the offset in the lattice by checking to see if the row is odd or even.			
			if (j % 2 != 0 && j > 0 && velocityInC6(lattice[i][j - 1]) == 1)
			{
				latticeClone[i][j] += C6;
				numberPropagated++;
				
				// Propagate the random bit used for collisions
				if (randomInVelocity(lattice[i][j - 1]) && !randomInVelocity(latticeClone[i][j]))
				{
					latticeClone[i][j] += RANDOM;
				}
			}
			else if (j % 2 == 0 && i > 0 && j > 0 && velocityInC6(lattice[i - 1][j - 1]) == 1)
			{
				latticeClone[i][j] += C6;
				numberPropagated++;
				
				// Propagate the random bit used for collisions
				if (randomInVelocity(lattice[i - 1][j - 1]) && !randomInVelocity(latticeClone[i][j]))
				{
					latticeClone[i][j] += RANDOM;
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
			else if (toggleFlow && toggleSolidLeftBorder && i == 1 && j != 0 && j != LATTICE_HEIGHT - 1)
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
	
	// print("Number of Propageted Velocity Vectors = " + numberPropagated + "\n");
}


void createLattice()
{
	for (int i = 0; i < LATTICE_WIDTH; i++)
	{
		for (int j = 0; j < LATTICE_HEIGHT; j++)
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
						if (i == 1 && j != 0 && j != LATTICE_HEIGHT - 1)
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
						if (j == LATTICE_HEIGHT - 2 && i != 0 && i != LATTICE_WIDTH - 1)
						{
							lattice[i][j] = C2;
						}
					}
					else if (j == LATTICE_HEIGHT - 1)
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
						if (j == LATTICE_HEIGHT - 2 && i != 0 && i != LATTICE_WIDTH - 1)
						{
							lattice[i][j] = C3;
						}
					}
					else if (j == LATTICE_HEIGHT - 1)
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
						if (i == LATTICE_WIDTH - 2 && j != 0 && j != LATTICE_HEIGHT - 1)
						{
							lattice[i][j] = C4;
						}
					}
					else if (i == LATTICE_WIDTH - 1)
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
						if (j == 1 && i != 0 && i != LATTICE_WIDTH - 1)
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
						if (j == 1 && i != 0 && i != LATTICE_WIDTH - 1)
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
					if (j == (LATTICE_HEIGHT / 2) - 1 && i == (LATTICE_WIDTH / 2))
					{
						lattice[i][j] = C1 + C2 + C3 + C4 + C5 + C6 + randomBit();
					}
					break;	
				case SQUARE_VELOCITY:
					int startX = (LATTICE_WIDTH / 2) - (SQUARE_SIZE / 2);
					int startY = (LATTICE_HEIGHT / 2) - (SQUARE_SIZE/ 2);
					int endX = (LATTICE_WIDTH / 2) + (SQUARE_SIZE / 2);
					int endY = (LATTICE_HEIGHT / 2) + (SQUARE_SIZE / 2);
		
					if (i > startX && i < endX && j > startY && j < endY)
					{
						lattice[i][j] = C1 + C2 + C3 + C4 + C5 + C6 + randomBit();
					}
					break;							
				default:
					lattice[i][j] = randomVelocity();
					break;
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
				if (i == LATTICE_WIDTH - 1)
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
				if (j == LATTICE_HEIGHT - 1)
				{
					lattice[i][j] = SOLID;
				}	
			}
			if (toggleCylinder)
			{
				drawCircle(true);
			}
			// Setup the Solid Wall
			if (toggleSolidWall)
			{
				if (i == LATTICE_WIDTH / 2 && j > (LATTICE_HEIGHT / 4) && j < ((3 * LATTICE_HEIGHT) / 4))
				{
					lattice[i][j] = SOLID;
				}	
			}
		}
	}	
}


void drawLattice()
{
	final float lu = LATTICE_UNIT;

	for (int i = 0; i < LATTICE_WIDTH; i++)
	{
		for (int j = 0; j < LATTICE_HEIGHT; j++)
		{
			float x = i * LATTICE_SIZE;
			float y = j * LATTICE_SIZE;
			
			fill(DENSITY_COLOR_ARRAY[mass(lattice[i][j])]);
			
			// This is a solid, use the solid fill color.
			if (solidInVelocity(lattice[i][j]))
			{
				fill(SOLID_COLOR);
			}
			
			noStroke();
			rect(x, y, lu * 2, lu  * 2);
		}
	}
}


void drawCircle(boolean onOff)
{
	int centerX = LATTICE_WIDTH / 2;
	int centerY = LATTICE_HEIGHT / 2;
	int CYLINDER_RADIUS = 20;
	
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


int randomBit()
{
	int randomBit = 0;
	float rv = random(0, 1);
	if (rv < PROBABILITY_OF_RANDOM_BIT)
	{
		randomBit = RANDOM;
	}
	return randomBit;
}


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
        if(toggleSolidBorder)
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
        if(toggleSolidRightBorder)
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
        if(toggleSolidLeftBorder)
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
        if(toggleSolidTopBorder)
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
        if(toggleSolidBottomBorder)
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
        if(toggleSolidWall)
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
        if(toggleFlow)
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
        if(toggleStream)
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
        if(streamLocation > STREAM_LOCATION_MIN)
        {
            streamLocation--;
        }
    }
    // Move stream down
	else if (key == '>' || key == '.')
    {
        if(streamLocation + streamWidth < STREAM_LOCATION_MAX)
        {
            streamLocation++;
        }
    }
    // Resize stream down
	else if (key == '-' || key == '_')
    {
        if(streamWidth > STREAM_WIDTH_MIN)
        {
            streamWidth--;
        }
    }
    // Resize stream up
	else if (key == '+' || key == '=')
    {
        if(streamWidth < STREAM_WIDTH_MAX)
        {
            streamWidth++;
        }
    }   
    // Toggle looping
	else if (key == 'g')
    {
        if(toggleLoop)
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
        if(toggleLoop)
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
        if(frameRateLoop < 20)
        {
            frameRateLoop++;
            frameRate(frameRateLoop);
        }
    } 
    // Decrease the frame rate
	else if (key == 'y')
    {
        if(frameRateLoop > 1)
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
    // Create a cylinder solid in the middle of the lattice
	else if (key == 'a')
    {
    	if (toggleCylinder)
    	{
    		toggleCylinder = false;
			drawCircle(false);
    	}
    	else
    	{
    		toggleCylinder = true;
    		drawCircle(true);
    	}
    }                            
}

