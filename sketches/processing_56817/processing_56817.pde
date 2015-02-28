
float ypos = 0.0;
float angle = 0.0;
float scaler;

void setup()
{
  size(500,500);
  smooth();
  scaler = 20;
  noStroke();
}

void draw()
{
  background(0);
  for (int i=100; i<width-100; i++)
  { 
    ypos = height/2 + (sin(angle+(i/50.0)) * scaler);
    angle+=0.0001;
    
    ellipse(i, ypos, 1,1);
  }
  stroke(255);
  strokeWeight(2);
  fill(0);
  line(80,150, 150,350);
  line(420,150, 350,350);
  line(150,350, 350,350);
}

