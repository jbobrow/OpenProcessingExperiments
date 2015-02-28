
long f1, f2, f3;
int i;
int max_iters = 400;
void setup()
{
  size(400, 300);
  background(120, 120, 0);
  f1 = 0;
  f2 = 1;
  f3 = f1 + f2;
  i = 0;
  line(i, height, i, height - f1);
  i++;
  line(i, height, i, height - f2);
  i++;
  line(i, height, i, height - f3);
  i++;
}

void draw()
{
  if(i < max_iters)
  {
    f1 = f2;
    f2 = f3;
    f3 = f1 + f2;
    line(i, height, i, height - f3);
    stroke(0, 120, 120);
    line(i, height, i, height - f2);
    stroke(#000000);
    println(f3);
    i++;
  }
}

