
int i;
int spaceX = 12;

float randomPosition = 250;

size(500, 500);
background(255);
smooth();
   
    for (i=0; i<=100; i++)
    {
       randomPosition += random(-10, 10);
       ellipse (i*spaceX, randomPosition, 10, 10);
    }
