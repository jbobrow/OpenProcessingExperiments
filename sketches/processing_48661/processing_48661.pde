
// A Fibonacci spiral with random colors created by drawing circular arcs 
// connecting the opposite corners of squares in the Fibonacci tiling.

// (c) David Balash 2011
// Free software licensed under the Creative Commons 3.0 License
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// Attribution - Noncommerical - Share Alike

final int WIDTH = 640;
final int HEIGHT = 360;
final int OFFSET_WIDTH = 122;
final int OFFSET_HEIGHT = 75;
final int BACKGROUND_COLOR = 0xFFFFF9F9;
final int FRAME_RATE = 1;
final int MAX_NUMBER_OF_ELEMENTS = 10;
final int ELEMENT_SIZE = 6;
final float STROKE_WEIGHT = 0.7;
final int DIRECTION_NONE = 0;
final int DIRECTION_RIGHT = 1;
final int DIRECTION_UP = 2;
final int DIRECTION_LEFT = 3;
final int DIRECTION_DOWN = 4;

int direction = DIRECTION_RIGHT;
FibonacciElement previousPreviousFibonacciElement;
FibonacciElement previousFibonacciElement;
	
	
void setup()
{
    size(WIDTH, HEIGHT);
    background(BACKGROUND_COLOR);
    strokeWeight(STROKE_WEIGHT);
    smooth();
	frameRate(FRAME_RATE);
}

	
void drawFibonacci()
{
	if (frameCount == 1)
	{
		previousPreviousFibonacciElement = new FibonacciElement(0, 0, 0);
		previousFibonacciElement = new FibonacciElement((width / 2) - OFFSET_WIDTH, (height / 2) - OFFSET_HEIGHT, 1);
		previousFibonacciElement.show(DIRECTION_NONE);
	}
	else 
	{
		FibonacciElement nextFibonacciElement;
		switch (direction)
		{
			case DIRECTION_RIGHT:
				nextFibonacciElement = new FibonacciElement(
					previousFibonacciElement.getX() + (previousFibonacciElement.getNumber() * ELEMENT_SIZE), 
					previousFibonacciElement.getY() - (previousPreviousFibonacciElement.getNumber() * ELEMENT_SIZE), 
					previousPreviousFibonacciElement.getNumber() + previousFibonacciElement.getNumber());
				nextFibonacciElement.show(DIRECTION_RIGHT);
				previousPreviousFibonacciElement = previousFibonacciElement;
				previousFibonacciElement = nextFibonacciElement;
				direction = DIRECTION_UP;
			break;
			case DIRECTION_UP:
				nextFibonacciElement = new FibonacciElement(
					previousFibonacciElement.getX() - (previousPreviousFibonacciElement.getNumber() * ELEMENT_SIZE), 
					previousFibonacciElement.getY() - ((previousPreviousFibonacciElement.getNumber() + previousFibonacciElement.getNumber()) * ELEMENT_SIZE), 
					previousPreviousFibonacciElement.getNumber() + previousFibonacciElement.getNumber());
				nextFibonacciElement.show(DIRECTION_UP);
				previousPreviousFibonacciElement = previousFibonacciElement;
				previousFibonacciElement = nextFibonacciElement;
				direction = DIRECTION_LEFT;
			break;
			case DIRECTION_LEFT:
				nextFibonacciElement = new FibonacciElement(
					previousFibonacciElement.getX() - ((previousPreviousFibonacciElement.getNumber() + previousFibonacciElement.getNumber()) * ELEMENT_SIZE), 
					previousFibonacciElement.getY(), 
					previousPreviousFibonacciElement.getNumber() + previousFibonacciElement.getNumber());
				nextFibonacciElement.show(DIRECTION_LEFT);
				previousPreviousFibonacciElement = previousFibonacciElement;
				previousFibonacciElement = nextFibonacciElement;
				direction = DIRECTION_DOWN;
			break;
			case DIRECTION_DOWN:
				nextFibonacciElement = new FibonacciElement(
					previousFibonacciElement.getX(), 
					previousFibonacciElement.getY() + (previousFibonacciElement.getNumber() * ELEMENT_SIZE), 
					previousPreviousFibonacciElement.getNumber() + previousFibonacciElement.getNumber());
				nextFibonacciElement.show(DIRECTION_DOWN);
				previousPreviousFibonacciElement = previousFibonacciElement;
				previousFibonacciElement = nextFibonacciElement;
				direction = DIRECTION_RIGHT;
			break;
		}
	}
}


void draw()
{	
	if (frameCount > MAX_NUMBER_OF_ELEMENTS) 
	{
		noLoop();
	}
	else 
	{
		drawFibonacci();
	}
}


void mousePressed() 
{
	background(BACKGROUND_COLOR);
	frameCount = 0;
	direction = DIRECTION_RIGHT;
	loop();
}


class FibonacciElement 
{
	int x;
	int y;
	int number;


	FibonacciElement(int x, int y, int number)
	{
		this.x = x; 
		this.y = y;
		this.number = number;
	}


	int getX()
	{
		return x;	
	}
	
	
	int getY()
	{
		return y;
	}
	
	
	int getNumber()
	{
		return number;
	}


	void show(int direction)
	{
		fill(random(255), random(255), random(255), 130);
		strokeWeight(STROKE_WEIGHT);
		rect(x, y, number * ELEMENT_SIZE, number * ELEMENT_SIZE);
		
		strokeWeight(2);
		switch (direction)
		{
			case DIRECTION_RIGHT:
				arc(x, y, 
					2 * number * ELEMENT_SIZE, 2 * number * ELEMENT_SIZE, 
					0, HALF_PI);
			break;
			case DIRECTION_UP:
				arc(x, y + (number * ELEMENT_SIZE), 
					2 * number * ELEMENT_SIZE, 2 * number * ELEMENT_SIZE, 
					PI + HALF_PI, TWO_PI);
			break;
			case DIRECTION_LEFT:
				arc(x + (number * ELEMENT_SIZE), y + (number * ELEMENT_SIZE), 
					2 * number * ELEMENT_SIZE, 2 * number * ELEMENT_SIZE, 
					PI, PI + HALF_PI);
			break;
			case DIRECTION_DOWN:
				arc(x + (number * ELEMENT_SIZE), y, 
					2 * number * ELEMENT_SIZE, 2 * number * ELEMENT_SIZE, 
					HALF_PI, PI);
			break;
			default:
				// NO_DIRECTION
			break;
		}
		
	}
}

