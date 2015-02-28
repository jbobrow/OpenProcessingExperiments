
// A Sierpinksi triangle sketch with random colors.  Click to start again.

// (c) David Balash 2011
// Free software licensed under the Creative Commons 3.0 License
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// Attribution - Noncommerical - Share Alike

final int SKETCH_WIDTH = 640;
final int SKETCH_HEIGHT = 480;
final int BACKGROUND_COLOR = 0xFFFFF9F9;
final int FRAME_RATE = 1;
final int MAX_LEVEL = 8;
final float STROKE_WEIGHT = 0.7;
final float LARGEST_EQUILATERAL_TRIANGLE_SIDE_LENGTH = 540;

float rectangleWidth = LARGEST_EQUILATERAL_TRIANGLE_SIDE_LENGTH;
float rectangleHeight = (rectangleWidth / 2) * sqrt(3);
int offsetX = (SKETCH_WIDTH - int(rectangleWidth)) / 2;
int offsetY = (SKETCH_HEIGHT - int(rectangleHeight)) / 2;
float sizeToDisplay = LARGEST_EQUILATERAL_TRIANGLE_SIDE_LENGTH;
List<SierpinskiTriangle> triangleList = new ArrayList<SierpinskiTriangle>();


void setup()
{
    size(SKETCH_WIDTH, SKETCH_HEIGHT);
    background(BACKGROUND_COLOR);
    strokeWeight(STROKE_WEIGHT);
    smooth();
	frameRate(FRAME_RATE);
	
	float triangleTopVertexX = LARGEST_EQUILATERAL_TRIANGLE_SIDE_LENGTH / 2; 
	float triangleTopVertexY = 0;
	float triangleBottomLeftVertexX = 0;
	float triangleBottomLeftVertexY =  (LARGEST_EQUILATERAL_TRIANGLE_SIDE_LENGTH / 2) * sqrt(3);
	float triangleBottomRightVertexX = LARGEST_EQUILATERAL_TRIANGLE_SIDE_LENGTH;
	float triangleBottomRightVertexY = triangleBottomLeftVertexY;

	SierpinskiTriangle sierpinskiTriangle = new SierpinskiTriangle(
		triangleTopVertexX, triangleTopVertexY,
		triangleBottomLeftVertexX, triangleBottomLeftVertexY,
		triangleBottomRightVertexX, triangleBottomRightVertexY,
		1);
	triangleList.add(sierpinskiTriangle);
	calculateSierpinskiTriangle(sierpinskiTriangle);	
}


void draw()
{	
	if (frameCount <= MAX_LEVEL)
	{
		for (int index = 0; index < triangleList.size(); index++)
		{
			SierpinskiTriangle sierpinskiTriangle = triangleList.get(index);
			if (sierpinskiTriangle.getLevel() == frameCount)
			{
				sierpinskiTriangle.show();
			}
		}
	}
	else 
	{
		noLoop();
	}
}


void mousePressed() 
{
	background(BACKGROUND_COLOR);
	frameCount = 0;
	loop();
}


void calculateSierpinskiTriangle(SierpinskiTriangle sierpinskiTriangle) 
{	
	float triangleTopVertexX = sierpinskiTriangle.getTriangleTopVertexX(); 
	float triangleTopVertexY = sierpinskiTriangle.getTriangleTopVertexY();
	float triangleBottomLeftVertexX = sierpinskiTriangle.getTriangleBottomLeftVertexX();
	float triangleBottomLeftVertexY =  sierpinskiTriangle.getTriangleBottomLeftVertexY();
	float triangleBottomRightVertexX = sierpinskiTriangle.getTriangleBottomRightVertexX();
	float triangleBottomRightVertexY = sierpinskiTriangle.getTriangleBottomRightVertexY();	
	int level = sierpinskiTriangle.getLevel();
	
	if(level < MAX_LEVEL)
	{
		float topTriangleBottomLeftVertexX = triangleBottomLeftVertexX 
			+ (((triangleBottomLeftVertexY -  triangleTopVertexY) / 2) / sqrt(3));
		float topTriangleBottomLeftVertexY = (triangleTopVertexY / 2)
			+ (triangleBottomLeftVertexY / 2);
		float topTriangleBottomRightVertexX = triangleBottomLeftVertexX
			 + triangleBottomRightVertexX 
			 	- topTriangleBottomLeftVertexX;

		SierpinskiTriangle sierpinskiTriangleTop = new SierpinskiTriangle(
		    triangleTopVertexX, triangleTopVertexY,
			topTriangleBottomLeftVertexX, topTriangleBottomLeftVertexY,
			topTriangleBottomRightVertexX, topTriangleBottomLeftVertexY,
			level + 1);
		triangleList.add(sierpinskiTriangleTop);
		calculateSierpinskiTriangle(sierpinskiTriangleTop);
		
		SierpinskiTriangle sierpinskiTriangleBottomLeft = new SierpinskiTriangle(
	    	topTriangleBottomLeftVertexX, topTriangleBottomLeftVertexY,
			triangleBottomLeftVertexX, triangleBottomLeftVertexY,
			triangleTopVertexX, triangleBottomLeftVertexY,
			level + 1);
		triangleList.add(sierpinskiTriangleBottomLeft);
		calculateSierpinskiTriangle(sierpinskiTriangleBottomLeft);
		
		SierpinskiTriangle sierpinskiTriangleBottomRight = new SierpinskiTriangle(
	    	topTriangleBottomRightVertexX, topTriangleBottomLeftVertexY,
			triangleTopVertexX, triangleBottomLeftVertexY,
			triangleBottomRightVertexX, triangleBottomRightVertexY,
			level + 1);
			triangleList.add(sierpinskiTriangleBottomRight);
		calculateSierpinskiTriangle(sierpinskiTriangleBottomRight);
	}
}


class SierpinskiTriangle 
{
	float triangleTopVertexX;
	float triangleTopVertexY;
	float triangleBottomLeftVertexX;
	float triangleBottomLeftVertexY;
	float triangleBottomRightVertexX;
	float triangleBottomRightVertexY;	
	int level;


	SierpinskiTriangle(float triangleTopVertexX, float triangleTopVertexY,
		float triangleBottomLeftVertexX, float triangleBottomLeftVertexY,
		float triangleBottomRightVertexX, float triangleBottomRightVertexY, 
		int level)
	{
		this.triangleTopVertexX = triangleTopVertexX; 
		this.triangleTopVertexY = triangleTopVertexY;
		this.triangleBottomLeftVertexX = triangleBottomLeftVertexX;
		this.triangleBottomLeftVertexY = triangleBottomLeftVertexY;
		this.triangleBottomRightVertexX = triangleBottomRightVertexX;
		this.triangleBottomRightVertexY = triangleBottomRightVertexY;
		this.level =  level;
	}


	void show()
	{
		fill(random(255), random(255), random(255));
	
		beginShape(TRIANGLES);
			vertex(triangleTopVertexX + offsetX, triangleTopVertexY + offsetY);
			vertex(triangleBottomLeftVertexX + offsetX, triangleBottomLeftVertexY + offsetY);
			vertex(triangleBottomRightVertexX + offsetX, triangleBottomRightVertexY + offsetY);
		endShape();
	}
	
	
	int getLevel()
	{
		return level;
	}
	
	
	float getTriangleTopVertexX()
	{
		return triangleTopVertexX;
	}
	
	
	float getTriangleTopVertexY()
	{
		return triangleTopVertexY;
	}
	
	
	float getTriangleBottomLeftVertexX()
	{
		return triangleBottomLeftVertexX;
	}
	
	
	float getTriangleBottomLeftVertexY()
	{
		return triangleBottomLeftVertexY;
	}
	
	
	float getTriangleBottomRightVertexX()
	{
		return triangleBottomRightVertexX;
	}
	
	
	float getTriangleBottomRightVertexY()
	{
		return triangleBottomRightVertexY;
	}
}

