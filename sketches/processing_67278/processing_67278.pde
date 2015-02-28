
// Lattice Gas Cellular Automata
// Press "u" to increase and "y" to decrease the frame rate.
// Press "g" to toggle loop and noLoop.
// Press "n" for the next iteration when not looping.  
// Press "<Space Bar>" to reset.  
// Press "c" to toggle the complete border.  
// Press "l, r, t, b" to toggle left, right, top, bottom borders.  
// Press "w" to toggle a wall.  
// Press "d" to toggle density coloring.  
// Press "p" to toggle collision propagation order.  
// Press "f" to toggle a flow of velocity from the left.
// Press "s" to toggle a stream of velocity from the left. 
// Press "<" and ">" to move stream of velocity. 
// Press "+" and "-" to change stream of velocity width.
// Press "e" empty the lattice.
// Press "1 - 9, z, x, v" to test individual velocity vectors and collisions.

// (c) David Balash 2012
// Free software licensed under the Creative Commons 3.0 License
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// Attribution - Noncommerical - Share Alike

// Sketch Variables
final int SKETCH_WIDTH = 750;
final int SKETCH_HEIGHT = 625;
final int FRAME_RATE_NO_LOOP = 300;
final int LATTICE_SIZE = 50;
final int LATTICE_UNIT = LATTICE_SIZE / 2;
final int LATTICE_WIDTH = (SKETCH_WIDTH / LATTICE_SIZE) - 1;
final int LATTICE_HEIGHT = round(SKETCH_HEIGHT / (LATTICE_SIZE * sin(PI / 3)));
final float OFFSET_X = (LATTICE_SIZE / 2)  + (LATTICE_UNIT / 2);
final float OFFSET_Y = ((LATTICE_SIZE * sin(PI / 3)) / 2) + (LATTICE_UNIT / 4);
final int[] DENSITY_COLOR_ARRAY = {0xFFFFFF, 0x8000FFFF, 0x8000CCFF, 0x800099FF, 0x800066FF, 0x800033FF, 0x800000FF};
final int HEXAGON_COLOR = 0x40808080;
final int HEXAGON_STROKE_WEIGHT = 2;
final int SOLID_COLOR = 0x8000CC66;
final int LATTICE_POINT_COLOR = 0x80FF0000;
final int LATTICE_POINT_SIZE = 3;
final int RANDOM_INITIAL_VELOCITY = 0;
final int C1_INITIAL_VELOCITY = 1;
final int C2_INITIAL_VELOCITY = 2;
final int C3_INITIAL_VELOCITY = 3;
final int C4_INITIAL_VELOCITY = 4;
final int C5_INITIAL_VELOCITY = 5;
final int C6_INITIAL_VELOCITY = 6;
final int C1_C4_INITIAL_VELOCITY = 7;
final int C2_C5_INITIAL_VELOCITY = 8;
final int C3_C6_INITIAL_VELOCITY = 9;
final int C1_C3_C5_INITIAL_VELOCITY = 10;
final int C2_C4_C6_INITIAL_VELOCITY = 11;
final int C1_C2_C3_C4_C5_C6_INITIAL_VELOCITY = 12;
final int NO_VELOCITY = -1;
final int STREAM_LOCATION_MIN = 1;
final int STREAM_LOCATION_MAX = LATTICE_HEIGHT - 1;
final int STREAM_WIDTH_MIN = 1;
final int STREAM_WIDTH_MAX = LATTICE_HEIGHT - 2;
int initialVelocityDirection = RANDOM_INITIAL_VELOCITY;
boolean initialLatticeDisplay = true;
boolean toggleDensityColoring = false;
boolean toggleSolidBorder = true;
boolean toggleSolidLeftBorder = true;
boolean toggleSolidRightBorder = true;
boolean toggleSolidTopBorder = true;
boolean toggleSolidBottomBorder = true;
boolean toggleSolidWall = false;
boolean toggleFlow = false;
boolean toggleStream = false;
boolean toggleLoop = true;
boolean toggleCollisionProgagation = true;
int streamWidth = 2;
int streamLocation = 1;
int frameRateLoop = 1;


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
	
	// Initially do not propagate, first draw the lattice in the initial state.
	if (!initialLatticeDisplay)
	{
		if (toggleCollisionProgagation)
		{
			collision();
			propagation();
		}
		else
		{
			propagation();
			collision();
		}
	}
	
	// Draw the lattice.	
	drawLattice();
	frameRate(frameRateLoop);
	initialLatticeDisplay = false;
}


void reset()
{
	createLattice();
	initialLatticeDisplay = true;
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
				// Start all lattice points with a random velocity.
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
				// To show the C1 C4 collision, start one C1 velocity and one C4 velocity.
				case C1_C4_INITIAL_VELOCITY:
					lattice[i][j] = 0;	
					if (i == 2 && j == 6)
					{
						lattice[i][j] = C1 + randomBit();
					}
					else if (i == LATTICE_WIDTH - 2 && j == 6)
					{
						lattice[i][j] = C4 + randomBit();
					}
					break;
				// To show the C2 C5 collision, start one C2 velocity and one C5 velocity.
				case C2_C5_INITIAL_VELOCITY:
					lattice[i][j] = 0;
					if (j == LATTICE_HEIGHT - 2 && i == 3)
					{
						lattice[i][j] = C2 + randomBit();
					}
					else if (j == 2 && i == 8)
					{
						lattice[i][j] = C5 + randomBit();
					}
					break;
				// To show the C3 C6 collision, start one C3 velocity and one C6 velocity.
				case C3_C6_INITIAL_VELOCITY:
					lattice[i][j] = 0;
					if (j == LATTICE_HEIGHT - 2 && i == 9)
					{
						lattice[i][j] = C3 + randomBit();
					}
					else if (j == 2 && i == 4)
					{
						lattice[i][j] = C6 + randomBit();
					}
					break;
				// To show the C1 C3 C5 collision, start one C1, C3, and C5 velocity.
				case C1_C3_C5_INITIAL_VELOCITY:
					lattice[i][j] = 0;
					if (i == 2 && j == 6)
					{
						lattice[i][j] = C1 + randomBit();
					}
					if (j == LATTICE_HEIGHT - 4 && i == 8)
					{
						lattice[i][j] = C3 + randomBit();
					}
					else if (j == 2 && i == 8)
					{
						lattice[i][j] = C5 + randomBit();
					}
					break;	
				// To show the C2 C4 C6 collision, start one C2, C4, and C6 velocity.
				case C2_C4_C6_INITIAL_VELOCITY:
					lattice[i][j] = 0;
					if (j == LATTICE_HEIGHT - 3 && i == 3)
					{
						lattice[i][j] = C2 + randomBit();
					}
					else if (i == LATTICE_WIDTH - 3 && j == 6)
					{
						lattice[i][j] = C4 + randomBit();
					}
					else if (j == 1 && i == 3)
					{
						lattice[i][j] = C6 + randomBit();
					}
					break;
				case C1_C2_C3_C4_C5_C6_INITIAL_VELOCITY:
					lattice[i][j] = 0;
					if (j == (LATTICE_HEIGHT / 2) - 1 && i == (LATTICE_WIDTH / 2))
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
			
			// Setup the Solid Wall
			if (toggleSolidWall)
			{
				if (i == 7 && j > 3 && j < LATTICE_HEIGHT - 4)
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
			float y = j * LATTICE_SIZE * sin(PI / 3);
			
			// Offset the odd rows to align the hexagon lattice.
			if (j % 2 != 0)
			{
				x += (LATTICE_SIZE / 2);
			}
			
			// Offset to make it look nice inside the screen area.
			x += OFFSET_X;
			y += OFFSET_Y;
			
			if (toggleDensityColoring)
			{
				fill(DENSITY_COLOR_ARRAY[mass(lattice[i][j])]);
			}
			else 
			{
				drawVelocityVectors(x, y, lattice[i][j]);
				noFill();				
			}
			
			// This is a solid, use the solid fill color.
			if (solidInVelocity(lattice[i][j]))
			{
				fill(SOLID_COLOR);
			}
		
			stroke(HEXAGON_COLOR);
			strokeWeight(HEXAGON_STROKE_WEIGHT);
		
			beginShape();
				vertex(x + (lu / 2), y + (lu * sin((PI * 1) / 3)));
				vertex(x - (lu / 2), y + (lu * sin((PI * 2) / 3))); 
				vertex(x - lu, y + (lu * sin((PI * 3) / 3))); 
				vertex(x - (lu / 2), y + (lu * sin((PI * 4) / 3))); 
				vertex(x + (lu / 2), y + (lu * sin((PI * 5) / 3)));
				vertex(x + lu, y + (lu * sin((PI * 6) / 3)));
			endShape(CLOSE);
			
			drawLatticePoint(x, y);
		}
	}
}


void drawLatticePoint(float x, float y)
{
	fill(LATTICE_POINT_COLOR);
	noStroke();
	rect(x, y, LATTICE_POINT_SIZE, LATTICE_POINT_SIZE);		
}


void drawVelocityVectors(float x, float y, int totalVelocity)
{
	if (velocityInC1(totalVelocity) == 1)
	{
		drawVelocityVector(x, y, C1);
	}
	
	if (velocityInC2(totalVelocity) == 1)
	{
		drawVelocityVector(x, y, C2);
	}
	
	if (velocityInC3(totalVelocity) == 1)
	{
		drawVelocityVector(x, y, C3);
	}
	
	if (velocityInC4(totalVelocity) == 1)
	{
		drawVelocityVector(x, y, C4);
	}
	
	if (velocityInC5(totalVelocity) == 1)
	{
		drawVelocityVector(x, y, C5);
	}
	
	if (velocityInC6(totalVelocity) == 1)
	{
		drawVelocityVector(x, y, C6);
	}
}


void drawVelocityVector(float startX, float startY, int velocity)
{	
	final float lu = LATTICE_UNIT;
	
	switch(velocity)
	{
		case C1:
			velocityLine(startX, startY, 
				startX + lu, startY + (lu * sin((PI * 6) / 3)));
			break;
		case C2:
			velocityLine(startX, startY, 
				startX + (lu / 2), startY + (lu * sin((PI * 5) / 3)));
			break;
		case C3:
			velocityLine(startX, startY, 
				startX - (lu / 2), startY + (lu * sin((PI * 4) / 3)));
			break;
		case C4:
			velocityLine(startX, startY, 
				startX - lu, startY + (lu * sin((PI * 3) / 3)));
			break;						
		case C5:
			velocityLine(startX, startY, 
				startX - (lu / 2), startY + (lu * sin((PI * 2) / 3)));
			break;
		case C6:
			velocityLine(startX, startY, 
				startX + (lu / 2), startY + (lu * sin((PI * 1) / 3)));
			break;
		default:
			break;	
	}
}


void velocityLine(float x1, float y1, float x2, float y2)
{
	final int VELOCITY_COLOR = #0000FF;
	final float VELOCITY_STROKE_WEIGHT = 1.5;
	final float VELOCITY_ARROW_ANGLE = PI / 12;
	final float VELOCITY_ARROW_SIZE = 9;
	
	stroke(VELOCITY_COLOR);
	strokeWeight(VELOCITY_STROKE_WEIGHT);
	line(x1, y1, x2, y2);
	float lineAngle =  atan2(y1 - y2, x1 - x2);
	float arrowAngle = VELOCITY_ARROW_ANGLE;
    float arrowSize = VELOCITY_ARROW_SIZE;
    fill(VELOCITY_COLOR);
    triangle(x2, y2, 
    	x2 + (arrowSize * cos(lineAngle + arrowAngle)), y2 + (arrowSize * sin(lineAngle + arrowAngle)),
    	x2 + (arrowSize * cos(lineAngle - arrowAngle)), y2 + (arrowSize * sin(lineAngle - arrowAngle)));
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
	float rv = random(0, 1);
	
	// C1
	if (rv <= 0.1666)
	{
		randomVelocity += C1;	
	}
	// C2
	else if (rv <= 0.3333)
	{
		randomVelocity += C2;	
	}	
	// C3
	else if (rv <= 0.4999)
	{
		randomVelocity += C3;	
	}
	// C4
	else if (rv <= 0.6666)
	{
		randomVelocity += C4;	
	}
	// C5
	else if (rv <= 0.8333)
	{
		randomVelocity += C5;	
	}
	// C6
	else if (rv <= 1)
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
    else if (key == 'z')
    {
    	initialVelocityDirection = C1_C3_C5_INITIAL_VELOCITY;
    	reset();	
    }
    else if (key == 'x')
    {
    	initialVelocityDirection = C2_C4_C6_INITIAL_VELOCITY;
    	reset();	
    }  
    else if (key == 'v')
    {
    	initialVelocityDirection = C1_C2_C3_C4_C5_C6_INITIAL_VELOCITY;
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
    // Toggle density coloring
	else if (key == 'd')
    {
        if(toggleDensityColoring)
        {
            toggleDensityColoring = false;
        }
        else
        {
            toggleDensityColoring = true;
        }
        reset();
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
    // Toggle Collision Progation
	else if (key == 'p')
    {
        if(toggleCollisionProgagation)
        {
            toggleCollisionProgagation = false;
        }
        else
        {
            toggleCollisionProgagation = true;
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
}

