
// An Ulam Spiral or prime spiral, used to visualize prime numbers.  Click to start again.
// http://en.wikipedia.org/wiki/Ulam_spiral

// (c) David Balash 2011
// Free software licensed under the Creative Commons 3.0 License
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// Attribution - Noncommerical - Share Alike

final int WIDTH = 800;
final int HEIGHT = 800;
final int BACKGROUND_COLOR = 0xFFFFFFFF;
final int FRAME_RATE = 500;
final int ELEMENT_SIZE = 24;
final int MAX_NUMBER_OF_ELEMENTS = 961;
final float STROKE_WEIGHT = 1;
final int DIRECTION_RIGHT = 1;
final int DIRECTION_UP = 2;
final int DIRECTION_LEFT = 3;
final int DIRECTION_DOWN = 4;

int direction = DIRECTION_RIGHT;
int moveRight = 1;
int moveUp = 1;
int moveLeft = 2;
int moveDown = 2;
int moveCountRight = 0;
int moveCountUp = 0;
int moveCountLeft = 0;
int moveCountDown = 0;
SpiralElement previousSpiralElement;
	
	
void setup()
{
    size(WIDTH, HEIGHT);
    background(BACKGROUND_COLOR);
    strokeWeight(STROKE_WEIGHT);
    smooth();
	frameRate(FRAME_RATE);
}


void reInitialize()
{
	direction = DIRECTION_RIGHT;
	moveRight = 1;
	moveUp = 1;
	moveLeft = 2;
	moveDown = 2;
	moveCountRight = 0;
	moveCountUp = 0;
	moveCountLeft = 0;
	moveCountDown = 0;	
}

	
void drawUlamSpiral()
{
	if (frameCount == 1)
	{
		previousSpiralElement = new SpiralElement(width / 2, height / 2, ELEMENT_SIZE, 1);
		previousSpiralElement.show();
	}
	else 
	{
		SpiralElement nextSpiralElement;
		switch (direction)
		{
			case DIRECTION_RIGHT:
				nextSpiralElement = new SpiralElement(
					previousSpiralElement.getX() + ELEMENT_SIZE, 
					previousSpiralElement.getY(), 
					ELEMENT_SIZE, 
					previousSpiralElement.getNumber() + 1);
				nextSpiralElement.show();
				previousSpiralElement = nextSpiralElement;
				moveCountRight++;
				if (moveCountRight == moveRight)
				{
					moveCountRight = 0;
					moveRight = moveRight + 2;
					direction = DIRECTION_UP;
				}
			break;
			case DIRECTION_UP:
				nextSpiralElement = new SpiralElement(
					previousSpiralElement.getX(), 
					previousSpiralElement.getY() - ELEMENT_SIZE, 
					ELEMENT_SIZE, 
					previousSpiralElement.getNumber() + 1);
				nextSpiralElement.show();
				previousSpiralElement = nextSpiralElement;
				moveCountUp++;
				if (moveCountUp == moveUp)
				{
					moveCountUp = 0;
					moveUp = moveUp + 2;
					direction = DIRECTION_LEFT;
				}
			break;
			case DIRECTION_LEFT:
				nextSpiralElement = new SpiralElement(
					previousSpiralElement.getX() - ELEMENT_SIZE, 
					previousSpiralElement.getY(), 
					ELEMENT_SIZE, 
					previousSpiralElement.getNumber() + 1);
				nextSpiralElement.show();
				previousSpiralElement = nextSpiralElement;
				moveCountLeft++;
				if (moveCountLeft == moveLeft)
				{
					moveCountLeft = 0;
					moveLeft = moveLeft + 2;
					direction = DIRECTION_DOWN;
				}
			break;
			case DIRECTION_DOWN:
				nextSpiralElement = new SpiralElement(
					previousSpiralElement.getX(), 
					previousSpiralElement.getY() + ELEMENT_SIZE, 
					ELEMENT_SIZE, 
					previousSpiralElement.getNumber() + 1);
				nextSpiralElement.show();
				previousSpiralElement = nextSpiralElement;
				moveCountDown++;
				if (moveCountDown == moveDown)
				{
					moveCountDown = 0;
					moveDown = moveDown + 2;
					direction = DIRECTION_RIGHT;
				}		
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
		drawUlamSpiral();
	}
}


void mousePressed() 
{
	background(BACKGROUND_COLOR);
	frameCount = 0;
	reInitialize();
	loop();
}


class SpiralElement 
{
	float x;
	float y;
	int sz;
	int number;


	SpiralElement(float x, float y, int sz, int number)
	{
		this.x = x; 
		this.y = y;
		this.sz = sz;
		this.number = number;
	}


	float getX()
	{
		return x;	
	}
	
	
	float getY()
	{
		return y;
	}
	
	
	int getSz()
	{
		return sz;
	}
	
	
	int getNumber()
	{
		return number;
	}


	boolean isPrime()
	{
		int factor = 2;
		
		if ((number != 2) && (number % 2 == 0)) 
		{
			return false;
		}
		
		if ((number != 5) && (number % 5 == 0)) 
		{
			return false;
		}
		
		while ((factor + 1) <= sqrt(number))
		{
			if (number % factor == 0)
			{
				return false;
			}
			factor++;
		}

		return true;
	}

	
	void show()
	{
		if (isPrime())
		{
			fill(255, 0, 0, 130);
		}
		else 
		{
			noFill();			
		}
		rectMode(CENTER);
		rect(x, y, sz, sz);
		fill(0);
		textAlign(CENTER);
		text(number, x, y);
	}
}

