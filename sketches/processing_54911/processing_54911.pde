
float orbitDuration = 1.5*1000; // 1.5 second orbit
float orbitRad = 75; // Radius 50px

void setup()
{
  size(250,250);
  smooth();
  noStroke();
}

void draw()
{
  fill(255, 20); // background colour, alpha for motion blur
  rect(0,0,250,250); // background shape
  translate((width/2),height/2); // centers in window
  float ang = TWO_PI * millis() /orbitDuration; //equation for orbit
  float x = cos(ang)*orbitRad;
  float y = sin(ang)*orbitRad;
  fill(#0020a8); //colour of orbiting circle
  ellipse(x,y,10,10); //size of orbiting circle
}

