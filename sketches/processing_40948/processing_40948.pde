
float x[] = new float[10];
float y[] = new float[10];

float xdisplace[] = new float[10];
float mySize = 5;

int amountlines = 10;

void setup()
{
  background(255);
  size(700,400);
  fill(0);
  smooth();

  int i = 0;
  while(i < 10) {
    x[i] = width/2;
    y[i] = i*30+20;
    xdisplace[i] = 0;
    i=i+1;
  }
}

void draw()
{
  background(255);

  int i = 0;
  while(i < 10) {

    if(dist(mouseX,mouseY,x[i],y[i]) < 50) {
      float xdist = (x[i] - mouseX)/5;
      x[i] = x[i] + xdist;
      xdisplace[i] = xdisplace[i] + xdist;
    }

    x[i] = x[i] - (xdisplace[i]/20);  
    xdisplace[i] = xdisplace[i] - (xdisplace[i]/20);

    ellipse(x[i],y[i],mySize,mySize);

    if(i > 0) {
      line(x[i], y[i], x[i-1], y[i-1]);
    }

    i=i+1;
  }
}


