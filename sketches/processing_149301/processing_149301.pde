
float[] x= new float[100];           // array for horizontal placement of stars
float[] y= new float[100];           // array for vertical placement of stars
float[] speed= new float[100];       // array for star speed (and size, for depth purposes)
float hue;
float sat;
float brightness;


void setup()
{
  size(600, 400);

  noStroke();
  colorMode(HSB);

  int i=0;
  while (i<100) {
    x[i]=random(0, width);
    y[i]=random(0, height);
    speed[i]=random(1, 5);
    i=i+1;
  }
}

void draw()
{ 
  println(hue);
  int i=0;
  fill(255);
  background(hue, sat, brightness);
  hue = map(mouseX, 0, width, 0, 255);
  sat = 255;
  //brightness = 126;
  brightness = map(mouseY, 0, height, 255, 0);
  


  while (i<100) {
    ellipse(x[i], y[i], speed[i], speed[i]);

    x[i]=x[i] - speed[i];
    if (x[i] < 0) {
      x[i]=width;
    }
    i = i + 1;
  }
}



