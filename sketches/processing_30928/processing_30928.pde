
/* A processing program for Eamon. Any code that follows two slashes
   like these // or falls between one of these /* and one of these */
/* is a comment. It is ignored by the computer and is only there to
   help a human to understand what the program is doing */

void setup() 
{
    /* the numbers in brackets after the word 'size' set the size
       of the window you will see when you run the program. You can
       try changing them. Nothing will break. The punctuation needs 
       to stay exactly the way it is for the program to run. */
    size(900, 500); 
    background(#5CE4DA); // this sets the colour of the background
    stroke(255); /* you could try changing this number to any number
		    between 0 and 255. See what happens. If you want 
		    to put it back to 255 go ahead */
   
    strokeWeight(2);
    smooth();
}

void draw() 
{
    noLoop();
    /* the next block of code draws the spirals that are in the
       background. The way it is now it is running the block of
       code 87 times. 'int' stands for integer, which is a whole
       number like 1, 2, 3. So what the next line means is that
       while an integer named 'i' is between 0 and 87 run the 
       block of code that follows it and then add 1 to i  - that's
       what i++ means...add 1 to i. You could change the number 87
       to something else and see what happens. If you make it
       much bigger the computer will take a long time to finish. */
    
    for (int i = 0; i<87; i++)
	{
	    float x = random(width);
	    float y = random(height);
	    float rev = random(6) + 5.0;
	    float curve = random(0.02) + 0.01;
	    drawSpiral(x, y, rev, PI/512.0, curve);
	}
    int times = (int)random(10) + 1;
    for (int j=0; j<times; j++) // this is another 'for' loop
	{
	    for (int i=2; i<11; i++)
		{
		    int r = (int)random(255);
		    int g = (int)random(255);
		    int b = (int)random(255);
		    int a = (int)random(100)+155;
		    float x = random(width);
		    float y = random(height);
		    float  newRadius = (float )fib(0, 1, i)*0.75;
		    stroke(r,g,b);
		    strokeWeight(newRadius);
		    drawCircle(x, y, newRadius*9, PI/(1.5*i));
		   		}
	    // the next line takes a picture 
	    saveFrame("/home/simon/EamonsPicture.jpg");
	}
}

void drawCircle(float xPos, float yPos, float radius, 
		float resolution)
{
    for (float i = 0; i < 2*PI; i+=resolution)
	{
	    float x = (cos(i) * radius) + xPos;
	    float y = (sin(i) * radius) + yPos;
	    point(x, y);
	}
}
//generate fib numbers
private static int fib(int a, int b, int count) 
{
    if (count == 0)
	{
	    return b;
	}
    else 
	{
	    return fib(a+b, a, count-1);
	}
}

// Draw a spiral
void drawSpiral(float xPos, float yPos, float revolutions, 
		float resolution, float curve)
{
    float radius = 1.0;
    for (float i=0; i<(2*PI*revolutions); i+=resolution)
	{
	    float x = (cos(i) * radius) + xPos;
	    float y = (sin(i) * radius) + yPos;
	    point(x, y);
	    radius += curve;
	}
}


