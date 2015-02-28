
// Menger Sponge  
// Use the number keys between 0 and 4 to select the iteration.  
// Use the mouse to move, rotate, and zoom.
// http://en.wikipedia.org/wiki/Menger_sponge
// Mouse driven camera movements provided by the PeasyCam library.

// (c) David Balash 2012
// Free software licensed under the Creative Commons 3.0 License
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// Attribution - Noncommerical - Share Alike
   
import peasy.*;

final int SKETCH_WIDTH = 700;
final int SKETCH_HEIGHT = 700;
final int BACKGROUND_COLOR = 0xFFFFF9F9;
final int CAMERA_DISTANCE = 500;
final int LEVEL_ZERO_COLOR = 0XFF5959AB;
final int LEVEL_ONE_COLOR = 0xFFFF7F00;
final int LEVEL_TWO_COLOR = 0xFF871F78;
final int LEVEL_THREE_COLOR = 0xFF8C1717;
final int LEVEL_FOUR_COLOR = 0xFF238E23;
final float INITIAL_ROTATION_X = -0.5;
final float INITIAL_ROTATION_Y = -0.5;
final float LARGEST_SPONGE_SIZE = 250.0;

PeasyCam camera;
PMatrix3D baseMatrix;
List<MengerSpongeObj> boxList = new ArrayList<MengerSpongeObj>();
int maxLevel = 3;
	
	
void setup()
{
    size(SKETCH_WIDTH, SKETCH_HEIGHT, P3D);
    baseMatrix = g.getMatrix(baseMatrix);
    background(BACKGROUND_COLOR);
    noStroke();
    MengerSpongeObj mengerSpongeObj 
		= new MengerSpongeObj(0, 
							  0,
							  0, 
							  LARGEST_SPONGE_SIZE, 
							  0,
							  0);
	calculateMengerSponge(mengerSpongeObj);	
	camera = new PeasyCam(this, width / 5, height / 7, 0, CAMERA_DISTANCE);
}


void draw()
{	
	rotateX(INITIAL_ROTATION_X);
 	rotateY(INITIAL_ROTATION_Y);
	background(BACKGROUND_COLOR);
	pushMatrix();  
	g.setMatrix(baseMatrix);	
	directionalLight(130, 130, 130, -1, 0, 0);
	directionalLight(90, 90, 90, 0, 0, -1);
	popMatrix();
	ambientLight(155, 155, 155);
	for (int index = 0; index < boxList.size(); index++)
	{
		boxList.get(index).show();
	}	
}


void keyPressed() 
{
	if (key == '4') 
	{
		maxLevel = 4;
	} 
	else if (key == '3')
	{
		maxLevel = 3;
	}
	else if (key == '2')
	{
		maxLevel = 2;
	}
	else if (key == '1')
	{
		maxLevel = 1;
	}
	else if (key == '0')
	{
		maxLevel = 0;
	}
	boxList = new ArrayList<MengerSpongeObj>();
    MengerSpongeObj mengerSpongeObj 
		= new MengerSpongeObj(0, 
							  0,
							  0, 
							  LARGEST_SPONGE_SIZE, 
							  0,
							  0);
	calculateMengerSponge(mengerSpongeObj);	
}


void calculateMengerSponge(MengerSpongeObj mengerSpongeObj) 
{	
	float x = mengerSpongeObj.getX();
	float y = mengerSpongeObj.getY();
	float z = mengerSpongeObj.getZ();
	float sz = mengerSpongeObj.getSz();
	int level = mengerSpongeObj.getLevel();

	float oneThirdSz = sz * (1f / 3f);
	float twoThirdsSz = sz  * (2f / 3f);
	int nextLevel = level + 1;
	
	if(level < maxLevel)
	{
		for (int boxNumber = 1; boxNumber <= 20; boxNumber++)
		{
			float newX;
			float newY;
			float newZ;

			if (boxNumber < 9)
			{
				newZ = z;
				
				if (boxNumber == 1 || boxNumber == 4 || boxNumber == 6)
				{
					newX = x;
				}
				else if (boxNumber == 2 || boxNumber == 7)
				{
					newX = x + oneThirdSz;	
				}
				else 
				{
					newX = x + twoThirdsSz;
				}
				
				if (boxNumber == 1 || boxNumber == 2 || boxNumber == 3)
				{
					newY = y;
				}
				else if (boxNumber == 4 || boxNumber == 5)
				{
					newY = y + oneThirdSz;	
				}
				else 
				{
					newY = y + twoThirdsSz;
				}
			}
			else if (boxNumber < 13)
			{
				newZ = z - oneThirdSz;
				
				if (boxNumber == 9 || boxNumber == 11)
				{
					newX = x;
				}
				else 
				{
					newX = x + twoThirdsSz;
				}
				
				if (boxNumber == 9 || boxNumber == 10)
				{
					newY = y;
				}
				else 
				{
					newY = y + twoThirdsSz;
				}				
			}
			else 
			{
				newZ = z - twoThirdsSz;
				
				if (boxNumber == 13 || boxNumber == 16 || boxNumber == 18)
				{
					newX = x;
				}
				else if (boxNumber == 14 || boxNumber == 19)
				{
					newX = x + oneThirdSz;	
				}
				else 
				{
					newX = x + twoThirdsSz;
				}
				
				if (boxNumber == 13 || boxNumber == 14 || boxNumber == 15)
				{
					newY = y;
				}
				else if (boxNumber == 16 || boxNumber == 17)
				{
					newY = y + oneThirdSz;	
				}
				else 
				{
					newY = y + twoThirdsSz;
				}				
			}
			
			calculateMengerSponge(new MengerSpongeObj(newX, newY, newZ, 
				oneThirdSz, nextLevel, boxNumber));
		}
	}
	else 
	{
		boxList.add(mengerSpongeObj);	
	}
}


class MengerSpongeObj 
{
	float x; 
	float y;
	float z;
	float sz;
	int level;
	int boxNumber;
	int numberOfBoxes;
	float totalSpongeSize;
	

	MengerSpongeObj(float x, float y, float z, float sz, int level, int boxNumber)
	{
		this.x = x; 
		this.y = y;
		this.z = z;
		this.sz = sz; 
		this.level = level;
		this.boxNumber = boxNumber;
		this.numberOfBoxes = int(pow(3, level));
		this.totalSpongeSize = sz * numberOfBoxes;
	}


	void show()
	{
		// Front side
		if(boxNumber != 9 && boxNumber != 10 && boxNumber != 11 && boxNumber != 12 && 
		   boxNumber != 13 && boxNumber != 15 && boxNumber != 18 && boxNumber != 20)
		{
			setFillColor(z);
			pushMatrix();
			translate(x, y, z);
			rect(0, 0, sz, sz);
			popMatrix();
		}
		
		// Back side
		if(boxNumber != 1 && boxNumber != 3 && boxNumber != 6 && boxNumber != 8 &&
		   boxNumber != 9 && boxNumber != 10 && boxNumber != 11 && boxNumber != 12)
		{		
			setFillColor(z - sz);	
			pushMatrix();
			translate(x, y, z - sz);
			rect(0, 0, sz, sz);
			popMatrix();
		}
		
		// Left side
		if(boxNumber != 2 && boxNumber != 3 && boxNumber != 7 && boxNumber != 8 &&
		   boxNumber != 14 && boxNumber != 15 && boxNumber != 19 && boxNumber != 20)
		{
			setFillColor(x);	
			pushMatrix();
			translate(x, y, z);
			rotateY(radians(90));
			rect(0, 0, sz, sz);
			popMatrix();
		}
		
		// Right side
		if(boxNumber != 1 && boxNumber != 2 && boxNumber != 6 && boxNumber != 7 &&
		   boxNumber != 13 && boxNumber != 14 && boxNumber != 18 && boxNumber != 19)
		{
			setFillColor(x + sz);	
			pushMatrix();
			translate(x + sz, y, z);
			rotateY(radians(90));
			rect(0, 0, sz, sz);
			popMatrix();
		}
		
		// Top Side
		if(boxNumber != 4 && boxNumber != 5 && boxNumber != 6 && boxNumber != 8 &&
		   boxNumber != 16 && boxNumber != 17 && boxNumber != 18 && boxNumber != 20)
		{
			setFillColor(y);	
			pushMatrix();
			translate(x, y, z);
			rotateX(radians(-90));
			rect(0, 0, sz, sz);
			popMatrix();
		}
		
		// Bottom Side
		if(boxNumber != 1 && boxNumber != 3 && boxNumber != 4 && boxNumber != 5 &&
		   boxNumber != 13 && boxNumber != 15 && boxNumber != 16 && boxNumber != 17)
		{
			setFillColor(y + sz);				
			pushMatrix();
			translate(x, y + sz, z);
			rotateX(radians(-90));
			rect(0, 0, sz, sz);
			popMatrix();
		}
	}
	
	
	void setFillColor(float axis)
	{
		axis = abs(int(axis));
		
		if (axis == 0 || axis == int(totalSpongeSize))
		{
			fill(LEVEL_ZERO_COLOR);
		}
		else if (level >= 4 && (axis == int(totalSpongeSize * (1f / 81f)) ||
								axis == int(totalSpongeSize * (2f / 81f)) ||
								axis == int(totalSpongeSize * (4f / 81f)) ||
								axis == int(totalSpongeSize * (5f / 81f)) ||
								axis == int(totalSpongeSize * (7f / 81f)) ||
								axis == int(totalSpongeSize * (8f / 81f)) ||
								axis == int(totalSpongeSize * (10f / 81f)) ||
								axis == int(totalSpongeSize * (11f / 81f)) ||
								axis == int(totalSpongeSize * (13f / 81f)) ||
								axis == int(totalSpongeSize * (14f / 81f)) ||
								axis == int(totalSpongeSize * (16f / 81f)) ||
								axis == int(totalSpongeSize * (17f / 81f)) ||
								axis == int(totalSpongeSize * (19f / 81f)) ||
								axis == int(totalSpongeSize * (20f / 81f)) ||
								axis == int(totalSpongeSize * (22f / 81f)) ||
								axis == int(totalSpongeSize * (23f / 81f)) ||
								axis == int(totalSpongeSize * (25f / 81f)) ||
								axis == int(totalSpongeSize * (26f / 81f)) ||
								axis == int(totalSpongeSize * (28f / 81f)) ||
								axis == int(totalSpongeSize * (29f / 81f)) ||
								axis == int(totalSpongeSize * (31f / 81f)) ||
								axis == int(totalSpongeSize * (32f / 81f)) ||
								axis == int(totalSpongeSize * (34f / 81f)) ||
								axis == int(totalSpongeSize * (35f / 81f)) ||
								axis == int(totalSpongeSize * (37f / 81f)) ||
								axis == int(totalSpongeSize * (38f / 81f)) ||
								axis == int(totalSpongeSize * (40f / 81f)) ||
								axis == int(totalSpongeSize * (41f / 81f)) ||
								axis == int(totalSpongeSize * (43f / 81f)) ||
								axis == int(totalSpongeSize * (44f / 81f)) ||
								axis == int(totalSpongeSize * (46f / 81f)) ||
								axis == int(totalSpongeSize * (47f / 81f)) ||
								axis == int(totalSpongeSize * (49f / 81f)) ||
								axis == int(totalSpongeSize * (50f / 81f)) ||
								axis == int(totalSpongeSize * (52f / 81f)) ||
								axis == int(totalSpongeSize * (53f / 81f)) ||
								axis == int(totalSpongeSize * (55f / 81f)) ||
								axis == int(totalSpongeSize * (56f / 81f)) ||
								axis == int(totalSpongeSize * (58f / 81f)) ||
								axis == int(totalSpongeSize * (59f / 81f)) ||
								axis == int(totalSpongeSize * (61f / 81f)) ||
								axis == int(totalSpongeSize * (62f / 81f)) ||
								axis == int(totalSpongeSize * (64f / 81f)) ||
								axis == int(totalSpongeSize * (65f / 81f)) ||
								axis == int(totalSpongeSize * (67f / 81f)) ||
								axis == int(totalSpongeSize * (68f / 81f)) ||
								axis == int(totalSpongeSize * (70f / 81f)) ||
								axis == int(totalSpongeSize * (71f / 81f)) ||
								axis == int(totalSpongeSize * (73f / 81f)) ||
								axis == int(totalSpongeSize * (74f / 81f)) ||
								axis == int(totalSpongeSize * (76f / 81f)) ||
								axis == int(totalSpongeSize * (77f / 81f)) ||
								axis == int(totalSpongeSize * (79f / 81f)) ||
								axis == int(totalSpongeSize * (80f / 81f))))
		{
			fill(LEVEL_FOUR_COLOR);
		}		
		else if (level >= 3 && (axis == int(totalSpongeSize * (1f / 27f)) ||
								axis == int(totalSpongeSize * (2f / 27f)) ||
								axis == int(totalSpongeSize * (4f / 27f)) ||
								axis == int(totalSpongeSize * (5f / 27f)) ||
								axis == int(totalSpongeSize * (7f / 27f)) ||
								axis == int(totalSpongeSize * (8f / 27f)) ||
								axis == int(totalSpongeSize * (10f / 27f)) ||
								axis == int(totalSpongeSize * (11f / 27f)) ||
								axis == int(totalSpongeSize * (13f / 27f)) ||
								axis == int(totalSpongeSize * (14f / 27f)) ||
								axis == int(totalSpongeSize * (16f / 27f)) ||
								axis == int(totalSpongeSize * (17f / 27f)) ||
								axis == int(totalSpongeSize * (19f / 27f)) ||
								axis == int(totalSpongeSize * (20f / 27f)) ||
								axis == int(totalSpongeSize * (22f / 27f)) ||
								axis == int(totalSpongeSize * (23f / 27f)) ||
								axis == int(totalSpongeSize * (25f / 27f)) ||
								axis == int(totalSpongeSize * (26f / 27f))))
		{
			fill(LEVEL_THREE_COLOR);
		}
		else if (level >=2 && (axis == int(totalSpongeSize * (1f / 9f)) || 
							   axis == int(totalSpongeSize * (2f / 9f)) || 
							   axis == int(totalSpongeSize * (4f / 9f)) ||
							   axis == int(totalSpongeSize * (5f / 9f)) || 
							   axis == int(totalSpongeSize * (7f / 9f)) || 
							   axis == int(totalSpongeSize * (8f / 9f))))
		{
			fill(LEVEL_TWO_COLOR);
		}
		else if (level >=1 && (axis == int(totalSpongeSize * (1f / 3f)) ||
							   axis == int(totalSpongeSize * (2f / 3f))))
		{
			fill(LEVEL_ONE_COLOR);
		}		
	}
	
	float getX()
	{
		return x;
	}
	
	
	float getY()
	{
		return y;
	}
	
	
	float getZ()
	{
		return z;
	}

	
	float getSz()
	{
		return sz;
	}
	
	
	int getLevel()
	{
		return level;
	}
}

