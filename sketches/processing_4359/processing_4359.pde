
// Odd Coincidence 
// Playing with negative space and coincidental form.
//
// Uses some code from example Painting Stripes in Ira Greeberg's book "Processing"
//

int shapes = 32;
float[]speedX = new float[shapes];
float[]x = new float[shapes];
float[]y = new float[shapes];
float[]w = new float[shapes];
float[]h = new float[shapes];
float  maxSpeedX = 2;
color[]colors = new color[shapes];

// ====================
void setup(){
  size(600, 400);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);

  for (int i=0; i<shapes; i++)
  {
    x[i] = i*4;
    y[i]=0;
    w[i]=random(1)+0;
    h[i]=height;

    speedX[i] = .1 + maxSpeedX*(i)/shapes;   
    colors[i] = color(360.0*i/shapes, random(50,100), random(50,100), random(50,100));
  }
}

// ====================
void draw()
{
  background(0);
  for (int i=0; i< shapes; i++)
  {
    stroke(colors[i]);
    float dy = sin(2*PI*.0005*frameCount)*(height/8)*sin(2*PI*4*x[i]/width + 0 * .02*frameCount*PI);
    line(x[i],height/3+dy,x[i],height-height/3+dy);
    line(x[i],height/8+dy,x[i],2*height/8+dy);    
    line(x[i],height - height/8+dy,x[i],height - 2*height/8+dy);        

    x[i] += speedX[i];
    if(x[i] >= width-w[i])
    {
      speedX[i]*=-1;    
      x[i] = width-w[i];
      w[i]=max(1,w[i]-3);
      h[i]=max(1,h[i]-3);
    }

    else if(x[i] < 0)
    {
      speedX[i]*=-1;
      x[i] = 0;
      w[i]=max(1,w[i]-3);
      h[i]=max(1,h[i]-3);
    }
  }
}





