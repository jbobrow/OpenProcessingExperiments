
int size = 200, N = 15;

size(400,400);

int step=width/N;
for (int n=0; n<height; n+=step)
{
  stroke (48,139,206);
  line(0,n,n,height);
  line(n,height,height,height-n);
  line(height,height-n,height-n,0);
  line(height-n,0,0,n);
}


