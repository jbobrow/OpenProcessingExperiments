
/* A processing application for Anna. Processing is a computer
language that was developed for artists. The people who created
it thought that artists would make good computer programmers if
they could just get started with it. Any words you see in this
program that fall between one of these /* and one of these */
// or after two slashes like these // are comments that are 
/* ignored by the computer. They are there for you to read.
This program uses trigonometry to draw spirals on the screen.
The size and the colour and the position of the spirals are
determined by random numbers. That means that every time you
run the program it will be different. The computer has to do a
lot of calculations before it can draw the picture. You might
have to wait a couple of minutes. */

void setup() 
{
    /* the 'size' function sets the size of the screen. You can
       change these numbers. Try size(300,300); or size(200,600);
       you have to enter it exactly like that...leave out the
       quotes and type "size(900,200);" */
    size(900,400);
    smooth();
    background(255);
}
void draw() 
{
    noLoop();
    /* the next bit of code makes a loop. First it generates a
       random number that I am calling 'numberOfTimes.' This means
       that the computer will pick a number out of a hat. I have
       set the number to be between 1 and 101. The computer will
       draw as many spirals as are chosen by the 'numberOfTimes'
       variable. If you look in the little window at the bottom 
       of the processing screen you will see that it prints out
       the number chosen for the 'numberOfTimes' variable. */
    int numberOfTimes = (int)random(100)+1;
    println("the number of times chosen this time was " +
	    numberOfTimes);
    for (int i=0; i<numberOfTimes; i++)
	{
	    float radius = random(5.0)+ 5;
	    float centerX = random(width);
	    float centerY = random(height);
	    int fibStart = (int)(random(12.0)+4);
	    float revolutions = random(17.0);
	    int r = (int)random(255);
	    int g = (int)random(255);
	    int b = (int)random(255);
	    int a = (int)random(255);
	    int thick = (int)(random(8) + 3);
	    if (thick == 7)
                  {  
		    thick = 19;
		    /*these next numbers set the colour of the
		      dominant spiral...the thickest one. All the
		      others are chosen randomly. r, g, and b stand
		      for red, green, and blue...those are the 
		      colours the computer uses. */

                    r=255; //try 240
                    g=255; //try 0
                    b=255; //try 240   
  
                  }
	    strokeWeight(thick);
	    stroke(r,g,b,a);
	    drawSpiral(radius, PI/2048, centerX, centerY, fibStart,
		       revolutions);
	}
    //this next line takes a picture of the image
   // saveFrame("/home/simon/AnnasPhoto1.jpg");
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

void drawSpiral(float radius,
		float resolution,
		float centerX,
		float centerY,
		int fibStart,
		float numRevs)
{
    float angle = 0;
    int numPoints = (int)((2*PI)/resolution);
    int totalPoints = (int)(numRevs*numPoints);
    int k = 0;
    for (int j=fibStart; j<numRevs+fibStart; j++)
	{
	    for (int i=0; i<numPoints; i++)
		{
		    float x = cos(angle)*radius + centerX;
		    float y = sin(angle)*radius + centerY;
		    point(x,y);
		    angle += resolution;
		    float increment = fib(1,0,j)/(float )numPoints;
		    radius += increment;
		    k++;
		    if (k >= totalPoints)
			break;
		}
	}
}

