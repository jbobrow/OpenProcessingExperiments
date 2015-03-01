
color lightPink = color(255, 150, 201);
color lightBlue = color(150, 237, 237);
color orange = color(255, 166, 0);
color darkBlue = color(2, 9, 67);

int xspacing = 16;
int w;  
 
float theta = 0.0; 
float amplitude = 80.0;
float period = 500.0; 
float dx;
float[] yvalues;
float frequency = 50.0/32;

void setup()
{
  size(640, 360);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  frameRate (60);
}

void draw()
{
  background(0);
  calcWave();
  renderWave();
  
  if (hour() <= 5 && minute() <=59 && second() <= 59)//morning
  {
   fill (lightPink);
  }
  else if (hour() <= 11 && minute() <= 59 && second() <= 59)//early afternoon
  {
   fill(lightBlue);
  }
  else if (hour() <= 16 && minute() <= 59 && second() <= 59)//late afternoon
  {
   fill(orange);
  }
  else //night
  {
   fill (darkBlue);
  }
}


void calcWave() {
  theta += 0.02;
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x*frequency+theta)*amplitude;
    x+=dx;
    
  }
}

void renderWave() {
  noStroke();
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 19, 19);
  }
}
