
int num = 120;
int[] x = new int[num];
int[] y = new int[num];

void setup() 
{
size(500, 500);
smooth();
noStroke();
}

void draw() 
{
background(255);

for (int i = x.length-1; i > 0; i--) 
  {
  x[i] = x[i-1];
  y[i] = y[i-1];
  }

x[0] = mouseX;
y[0] = mouseY;

for (int i = 0; i < x.length; i++) 
  {
  fill(i * 2, i);
  ellipse(x[i], y[i], 55, 55);
  stroke(i * 2);
  line(x[i], y[i],x [i]+20, y[i]+20);
  line(x[i], y[i],x [i]+20, y[i]-20);
  line(x[i], y[i],x [i]-20, y[i]+20);
  line(x[i], y[i],x [i]-20, y[i]-20);
  noStroke();
  }
}
