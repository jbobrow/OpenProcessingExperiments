
      size (500, 500);


int x = width;
int y = height;
int distance =50;


background(0);
strokeWeight(1);
stroke(0, 255, 255);
smooth();

for (int i=1; i<=500; i++)
{
  line((i*distance),-y+width, x, (i*distance));

}
                
