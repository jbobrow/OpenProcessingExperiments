
size(500, 500);
background(0);
smooth();

int dis = 25;
int numlines = 100;

for(int i=1; i <= numlines; i+= 2)
{
    strokeWeight(1);
    stroke(40, 190, 187);
    line(i*dis, -i, height, dis*i);
    //line(500, 500*i, i, i*50);
  }

                
                                
