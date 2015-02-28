
// A Koch snowflake with random colors.  Click to start again.
// http://en.wikipedia.org/wiki/Koch_snowflake

// (c) David Balash 2011
// Free software licensed under the Creative Commons 3.0 License
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// Attribution - Noncommerical - Share Alike

final int STANDARD_WIDTH = 680;
final int STANDARD_HEIGHT = 680;
final int BACKGROUND_COLOR = 0xFFFFF9F9;
final int FRAME_RATE = 1;
final float STROKE_WEIGHT = 6;
final float LARGEST_EQUILATERAL_TRIANGLE_SIDE_LENGTH = 500;
final float NUMBER_OF_ITERATIONS = 6;

float rectangleWidth = LARGEST_EQUILATERAL_TRIANGLE_SIDE_LENGTH;
float rectangleHeight = (rectangleWidth / 2) * sqrt(3);
int offsetX = (STANDARD_WIDTH - int(rectangleWidth)) / 2;
int offsetY = int(((STANDARD_HEIGHT - int(rectangleHeight)) / 2) * 0.6);
List<KochSnowflakePoint> pointList;
int iteration = 0;


void setup()
{
    size(STANDARD_WIDTH, STANDARD_HEIGHT);
    background(BACKGROUND_COLOR);
    smooth();
    noFill();
	frameRate(FRAME_RATE);
	initializePointList();
}
	
	
void initializePointList()
{
	pointList = new ArrayList<KochSnowflakePoint>();
		
	float x1 = 0;
	float y1 = (LARGEST_EQUILATERAL_TRIANGLE_SIDE_LENGTH / 2) * sqrt(3);
	float x2 = LARGEST_EQUILATERAL_TRIANGLE_SIDE_LENGTH;
	float y2 = (LARGEST_EQUILATERAL_TRIANGLE_SIDE_LENGTH / 2) * sqrt(3);
	float x3 = LARGEST_EQUILATERAL_TRIANGLE_SIDE_LENGTH / 2; 
	float y3 = 0;

	pointList.add(new KochSnowflakePoint(x1, y1));
	pointList.add(new KochSnowflakePoint(x2, y2));
	pointList.add(new KochSnowflakePoint(x3, y3));
}


void draw()
{	
	background(BACKGROUND_COLOR);
	for (int index = 0; index < pointList.size(); index++)
	{
		int nextIndex = 0;
		if (index + 1 < pointList.size())
		{
			nextIndex = index + 1;		
		}

		KochSnowflakePoint kochSnowflakePoint1 = pointList.get(index);
		KochSnowflakePoint kochSnowflakePoint2 = pointList.get(nextIndex);
		
		strokeWeight(STROKE_WEIGHT / frameCount);
		stroke(random(255), random(255), random(255));
		line(kochSnowflakePoint1.getX() + offsetX, kochSnowflakePoint1.getY() + offsetY, 
			 kochSnowflakePoint2.getX() + offsetX, kochSnowflakePoint2.getY() + offsetY);
	}
		
	if (frameCount < NUMBER_OF_ITERATIONS) 
	{
		calculateKochSnowflake();
	}
	else 
	{
		noLoop();
	}
}


void mousePressed() 
{
	frameCount = 0;
	initializePointList();
	loop();
}


void calculateKochSnowflake() 
{	
	List<KochSnowflakePoint> newPointList = new ArrayList<KochSnowflakePoint>();
	
	for (int index = 0; index < pointList.size(); index++)
	{
		int nextIndex = 0;
		if (index + 1 < pointList.size())
		{
			nextIndex = index + 1;		
		}  
		
		KochSnowflakePoint kochSnowflakePoint1 = pointList.get(index);
		KochSnowflakePoint kochSnowflakePoint2 = pointList.get(nextIndex);
		
		float x1 = kochSnowflakePoint1.getX();
		float y1 = kochSnowflakePoint1.getY();
		float x2 = kochSnowflakePoint2.getX();
		float y2 = kochSnowflakePoint2.getY();

		float distance = dist(x1, y1, x2, y2) / 3.0;  
		float angle = atan2(y2 - y1, x2 - x1);
    	
		KochSnowflakePoint kochSnowFlakePointNew1 = 
			new KochSnowflakePoint(x1 + (distance * cos(angle)), 
								   y1 + (distance * sin(angle)));
								   
		KochSnowflakePoint kochSnowFlakePointNew3 = 
			new KochSnowflakePoint(x2 + (distance * cos(angle + PI)), 
								   y2 + (distance * sin(angle + PI)));
								   
		KochSnowflakePoint kochSnowFlakePointNew2 = 
			new KochSnowflakePoint(kochSnowFlakePointNew3.getX() + (distance * cos(angle + (TWO_PI / 3))), 
								   kochSnowFlakePointNew3.getY() + (distance * sin(angle + (TWO_PI / 3))));
		
		newPointList.add(kochSnowflakePoint1);
		newPointList.add(kochSnowFlakePointNew1);
		newPointList.add(kochSnowFlakePointNew2);
		newPointList.add(kochSnowFlakePointNew3);
	}

	pointList = newPointList;
}


class KochSnowflakePoint 
{
	float x;
	float y;


	KochSnowflakePoint(float x, float y)
	{
		this.x = x; 
		this.y = y;
	}


	float getX()
	{
		return x;	
	}
	
	
	float getY()
	{
		return y;
	}
}

