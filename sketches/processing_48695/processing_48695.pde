
// A Sierpinski carpet with random colors.  Click to start again.

// (c) David Balash 2011
// Free software licensed under the Creative Commons 3.0 License
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// Attribution - Noncommerical - Share Alike

final int STANDARD_WIDTH = 700;
final int STANDARD_HEIGHT = 700;
final int BACKGROUND_COLOR = 0xFFFFF9F9;
final int FRAME_RATE = 1;
final float STROKE_WEIGHT = 0.5;
final float PERCENT_OF_LARGEST_SIDE_LENGTH_TO_STOP = 0.01;
final float LARGEST_SIDE_LENGTH = 600;
final float MIN_SIDE_LENGTH = 
	LARGEST_SIDE_LENGTH 
	* PERCENT_OF_LARGEST_SIDE_LENGTH_TO_STOP;

float sizeToDisplay = LARGEST_SIDE_LENGTH;
List<SierpinskiCarpetObj> squareList = new ArrayList<SierpinskiCarpetObj>();


void setup()
{
    size(STANDARD_WIDTH, STANDARD_HEIGHT);
    background(BACKGROUND_COLOR);
    strokeWeight(STROKE_WEIGHT);
    smooth();
    frameRate(FRAME_RATE);
	
    float x = (width / 2) -  (LARGEST_SIDE_LENGTH / 2);
    float y = (height / 2) -  (LARGEST_SIDE_LENGTH / 2);
    float sz = LARGEST_SIDE_LENGTH;
    SierpinskiCarpetObj sierpinskiCarpetObj = new SierpinskiCarpetObj(x, y, sz);
    squareList.add(sierpinskiCarpetObj);
    calculateSierpinskiCarpet(x, y, sz);	
}


void draw()
{	
	for (int index = 0; index < squareList.size(); index++)
	{
		SierpinskiCarpetObj sierpinskiCarpetObj = squareList.get(index);
		if (sierpinskiCarpetObj.getSz() == sizeToDisplay)
		{
			sierpinskiCarpetObj.show();
		}
	}
	
	if(sizeToDisplay > MIN_SIDE_LENGTH)
	{
		sizeToDisplay = sizeToDisplay / 3;
	}
	else 
	{
		noLoop();
	}	
}


void mousePressed() 
{
	background(BACKGROUND_COLOR);
	sizeToDisplay = LARGEST_SIDE_LENGTH;
	loop();
}


void calculateSierpinskiCarpet(float x, float y, float sz) 
{	
	if(sz > MIN_SIDE_LENGTH)
	{
		SierpinskiCarpetObj sierpinskiCarpetObj = 
			new SierpinskiCarpetObj(x + (sz / 3), y + (sz / 3), sz / 3);
		squareList.add(sierpinskiCarpetObj);
		calculateSierpinskiCarpet(x, y, sz / 3);
		calculateSierpinskiCarpet(x + (sz / 3), y, sz / 3);
		calculateSierpinskiCarpet(x + ((2 * sz) / 3), y, sz / 3);
		calculateSierpinskiCarpet(x, y + (sz / 3), sz / 3);
		calculateSierpinskiCarpet(x + ((2 * sz) / 3), y + (sz / 3), sz / 3);
		calculateSierpinskiCarpet(x, y + ((2 * sz) / 3), sz / 3);
		calculateSierpinskiCarpet(x + (sz / 3), y + ((2 * sz) / 3), sz / 3);
		calculateSierpinskiCarpet(x + ((2 * sz) / 3), y + ((2 * sz) / 3), sz / 3);
	}
}


class SierpinskiCarpetObj 
{
	float x; 
	float y;
	float sz;	

	SierpinskiCarpetObj(float x, float y, float sz)
	{
		this.x = x; 
		this.y = y;
		this.sz = sz; 
	}


	void show()
	{
		fill(random(255), random(255), random(255));
		rect(x, y, sz, sz);
	}
	
	
	float getSz()
	{
		return sz;
	}
}

