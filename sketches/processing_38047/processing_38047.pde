
int endX = 500;
int distance = 50;

size(500, 500);
background(0, 0, 0);
strokeWeight(1);
stroke(0, 255, 255);
smooth();

float xLength = 400;
float yLength = 10;

for(int i=1; i<=40; i++)
{
 line(i*distance, 0, endX, i*distance);
}


                                
