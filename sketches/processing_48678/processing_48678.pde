
// Organic circles.  An attempt at generative art.  Click to start again.

// (c) David Balash 2011
// Free software licensed under the Creative Commons 3.0 License
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// Attribution - Noncommerical - Share Alike

final int STANDARD_WIDTH = 800;
final int STANDARD_HEIGHT = 800;
final int FRAME_RATE = 1;
final int DELAY_BETWEEN = 1200;
final int BACKGROUND_COLOR = 0xFFFFF9F9;
final int GROW_LIMIT = 3;

int level = -1;
List<PointOnAPlane> pointList = new ArrayList<PointOnAPlane>();



void setup()
{ 
	background(BACKGROUND_COLOR);
	size(STANDARD_WIDTH, STANDARD_HEIGHT);
	smooth();
	frameRate(FRAME_RATE);
} 
 
 
void draw()
{ 
	if (level == -1)
	{
		background(BACKGROUND_COLOR);
		pointList = new ArrayList<PointOnAPlane>();
		level++;
	}
	else if (level == 0) 
	{ 
		level++;
		grow((STANDARD_WIDTH / 2) + random(-100, 100), (STANDARD_HEIGHT / 2) + random(-100, 100));
	}
	else if (level < GROW_LIMIT) 
	{
		level++;
		for (int index = 0; index < pointList.size(); index++)
		{
			if(pointList.get(index).getLevel() == (level - 1)) 
			{
				grow(pointList.get(index).getX(), pointList.get(index).getY());
			}
		}
		delay(1000);
	}
	else 
	{
		for (int index = 0; index < pointList.size(); index++)
		{
			if(pointList.get(index).getLevel() == level) 
			{
				float circleRadius = random(5 / level, 25 / level) + (10 / (4 * level));
				drawCircle(pointList.get(index).getX(), pointList.get(index).getY(), circleRadius);
			}
		}
		newGrowth();
		delay(1000);
	}
} 


void newGrowth()
{
	level = 0;
	pointList = new ArrayList<PointOnAPlane>();
}


void mousePressed() 
{
	regrow();
}


void regrow() 
{
	level = -1;
	loop();	
}


void grow(float centerX, float centerY) 
{
	float circleRadius1 = random(5, 25) + (75 / (2 * level));
	drawCircle(centerX, centerY, circleRadius1);	
	
	int numberOfPoints = int(random(4 + (2 * level), 7 + (2 * level))) + level;
	
	if (numberOfPoints % 2 == 0)
	{
		numberOfPoints++;
	}
		
	List<PointOnAPlane> circlePointList1 = new ArrayList<PointOnAPlane>();
	for (int count = 0; count < numberOfPoints; count++) 
	{	
		float angle = (TWO_PI) / numberOfPoints;
		float x = centerX + (circleRadius1 * cos(count * angle));
		float y = centerY + (circleRadius1 * sin(count * angle));
		PointOnAPlane pointOnAPlane = new PointOnAPlane(x, y, level);
		circlePointList1.add(pointOnAPlane);
	}	
	
	List<PointOnAPlane> circlePointList2 = new ArrayList<PointOnAPlane>();	
	for (int count = 0; count < numberOfPoints; count++) 
	{	
		float angle = (TWO_PI) / numberOfPoints;
		float circleRadius2 = random(50 / level, 250 / level) + (circleRadius1 / level) + (75 / level);
		if(level == GROW_LIMIT)
		{
			circleRadius2 =  circleRadius2 - 25;
		}
		float x = centerX + (circleRadius2 * cos(count * angle));
		float y = centerY + (circleRadius2 * sin(count * angle));
		PointOnAPlane pointOnAPlane = new PointOnAPlane(x, y, level);
		circlePointList2.add(pointOnAPlane);
	}

	boolean firstLine = true;
	for (int count = 0; count < numberOfPoints; count++) 
	{	
		if (!firstLine)
		{
			strokeWeight(random(0.5, 2));
			randomStroke();
			line(
				circlePointList1.get(count).getX(), circlePointList1.get(count).getY(),
				circlePointList2.get(count).getX(), circlePointList2.get(count).getY());
			
			pointList.add(circlePointList2.get(count));
		}
		firstLine = false;
	}
}


void drawCircle(float centerX, float centerY, float circleRadius)
{
	noStroke();
	randomFillColorToggle();
    ellipse(centerX, centerY , 2 * circleRadius, 2 * circleRadius);
}


void randomFillColorToggle() 
{
	float rValue = random(0, 255);
	float gValue = random(0, 255);
	float bValue = random(0, 255);
	fill(rValue, gValue, bValue);
}


void randomStroke() 
{
	float rValue = random(0, 240);
	float gValue = random(0, 240);
	float bValue = random(0, 240);
	stroke(rValue, gValue, bValue);	
}


class PointOnAPlane
{
	float x;
	float y;
	int level;

	
	PointOnAPlane(float x, float y, int level)
	{
		this.x = x;
		this.y = y;
		this.level = level;
	}	
	
	
	public float getX()
	{
		return x;
	}

	
	public float getY()
	{
		return y;
	}
	
	
	public int getLevel()
	{
		return level;	
	}
}

