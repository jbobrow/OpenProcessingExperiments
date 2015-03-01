
float theta = 0.0f;       // Start angle at 0
float amplitude = 175.0f;  // Height of wave
float period = 500.0f;    // How many pixels before the wave repeats
float dx;                 // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;          // Using an array to store height values for the wave (not entirely necessary)
void setup()
{
  size(600,600);
  colorMode(HSB);
  smooth();
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  println(yvalues.length);
  size(500, 500);
  background(random(255), random(255), random(255));
  ellipse(250, 250, 400, 400);
}

void draw()
{
  //background(255);
  fill(255,10);
  rect(0,0,width,height);
  calcWave();
  renderWave();
  strokeWeight(5);
  if (mousePressed)
  {
    stroke(random(255), random(255), random(255));
  } else
  {
    stroke(random(255));
  }
  line(mouseX-66, mouseY, mouseX+66, mouseY);
  line(mouseX, mouseY-66, mouseX, mouseY+66);
  arc(250, 300, 200, 100, radians(0), radians(180));
  fill(random(255), random(255), random(255));
  ellipse(175, 175, 75, 75);
  ellipse(325, 175, 75, 75);
}
 
void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;
 
  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  for ( int x = 0; x < yvalues.length; x++ ) {
    stroke( x, 255, 255, 50 );
    fill( yvalues[x], 155, 255, 1 );
    ellipseMode( CENTER );
    ellipse( x*xspacing,width/2+yvalues[x],yvalues[(x+x)%77],yvalues[(x+x+x)%77] );
  }
}

