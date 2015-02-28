
int i;
// This is the number of points to display
int nsamples = 100;
// Influence the wave on X/Y
float wave_factor_x = 2.5;
float wave_factor_y = 0.8;
// Speed factor
float wave_speed = 5.0;

int[] samples_x = new int[nsamples];
int radius = 3;
int diam = radius * 2;
int w = 250;
int h = 250;
// Half height
float hh = 250 / 2.0;
int y;

void setup()
{
// Brackets on separate lines, like John Carmack does!
  size(250, 250);
  background(0);  // Set background black
  frameRate(30); // Cap framerate to 30 per second
  // Samples are equally spaced on the X axis
  int space = (w - (radius + radius)) / nsamples;
  int py = h / 2;
  // Set up the positions of the samples
  for(i=0; i < nsamples; i = i+1)
      samples_x[i] = radius + (i * space) ;
}

void draw()
{
    background(0);
    noStroke();
    // Some random color?
    fill(random(255),100,255,50);
    for(i=0; i < nsamples; i = i+1)
    {
        // The Y coordinate is sampled from the output of the cosine. To sample everytime different values, we increment the X sampled by frameCount (increases) times wave_speed, to give the idea of speed
        // wave_factor_x and wave_factor_y chage the phase of the cosine, as usual
        y = cos(radians((samples_x[i] + (frameCount * wave_speed)) * wave_factor_x )) * wave_factor_y * hh;
        ellipse(samples_x[i], hh + y, diam, diam);
    }
}
