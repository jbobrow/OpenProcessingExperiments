
// Through Eyelids: Rose
// rose, eyelids, through, dream machine, dream

int side;
int start_h;
float rand_h;

float t;
float diameter_global;

void setup()
{
  size(800, 600);
  frameRate(16);
  colorMode(HSB, 100);
  strokeWeight(2);

  side = max(width, height);
  start_h = (int)random(100);
  //rand_h = random(100);
  
  t = 0;
  diameter_global = side;
}

void draw()
{
  t += 1.0/frameRate;
  background(0, 0, 0);

  pushMatrix();
  translate(width/2, height/2);

  diameter_global *= pow(2, 1.0/12);
  if(diameter_global >= 2*side) diameter_global = side; 
  
  float diameter = diameter_global;
  while (diameter > 10)
  {
    if(diameter < 2*side)
    {
      rand_h = random(100);
      //rand_h = (rand_h+10)0;
      
      //noStroke();
      //noFill();
      stroke( (start_h+t+(rand_h/4-10))0, 100, 100, 33);
      fill( rand_h, 100, 100, 3);
  
      ellipse(diameter/4, 0, diameter+(diameter/4)*sin(2*t), diameter+(diameter/8)*cos(2*t));
      ellipse(-diameter/4, 0, diameter+(diameter/4)*sin(2*t), diameter+(diameter/8)*cos(2*t));
      ellipse(diameter/2, 0, diameter+(diameter/4)*sin(2*t), diameter+(diameter/8)*cos(2*t));
      ellipse(-diameter/2, 0, diameter+(diameter/4)*sin(2*t), diameter+(diameter/8)*cos(2*t));
  
  
      ellipse(0, diameter/4, diameter+0*(diameter/4)*sin(2*t), diameter+0*(diameter/8)*cos(2*t));
      ellipse(0, -diameter/4, diameter+0*(diameter/4)*sin(2*t), diameter+0*(diameter/8)*cos(2*t));
      ellipse(0, diameter/2, diameter+(diameter/4)*sin(2*t), diameter+(diameter/8)*cos(2*t));
      ellipse(0, -diameter/2, diameter+(diameter/4)*sin(2*t), diameter+(diameter/8)*cos(2*t));
  
      ellipse(0, 0, diameter+0*(diameter/4)*sin(t), diameter+0*(diameter/8)*cos(t));
    }
    diameter /= 2;
  }

  //println(frameRate);
  popMatrix();
}

boolean paused = false;
void keyPressed()
{
  if(key==' ')
  {
    if(paused)
      loop();
    else
      noLoop();
    
    paused = !paused;
  }
}

