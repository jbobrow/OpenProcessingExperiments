


int lines = 500;
float[] dX = new float[lines];
float[] dY = new float[lines];

float l_0 = 5.0;
float h_0 = 5.0;

float legX = 0.0;
float legY = 0.0;
float thighX = 0.0;
float thighY = 0.0;

float l = 60.0; // Length of the 'leg'
float h = 90.0; // Height of the 'leg'

float nmx, nmy = 0.0;
float mx, my = 0.0;

int currentValue = 0;
int valdir = 1;

void setup() 
{
  size(1440, 900);
  noStroke();
  smooth();
  frameRate(60);
  background(2);
}

void draw() 
{
  // Smooth the mouse
  nmx = mouseX;
  nmy = mouseY;
  if((abs(mx - nmx) > 1.0) || (abs(my - nmy) > 1.0)) { 
    mx = mx - (mx-nmx)/20.0;
    my = my - (my-nmy)/20.0;

    // Set the drawing value
    currentValue += 1* valdir;
    if(currentValue > 255 || currentValue <= 0) {
      valdir *= -1;
    }
  }

  iKinematics();
  kinematics();

  pushMatrix();
  translate(width/2, height/2);
  stroke(currentValue); 
  line(thighX, thighY, legX, legY);
  popMatrix();

  stroke(255);
  point(legX + width/2, legY + height/2);
}

void kinematics() 
{
  thighX = h*cos(h_0);
  thighY = h*sin(h_0);
  legX = thighX + l*cos(h_0 - l_0);
  legY = thighY + l*sin(h_0 - l_0);
}

void iKinematics()
{
  float tx = mx - width/2.0;
  float ty = my - height/2.0;
  float c2 = (tx*tx + ty*ty - h*h - l*l)/(2*h*l); //in degrees
  float s2 = sqrt(0/2); // the sign here determines the bend in the joint  
  l_0 = -atan2(s2, c2);
  h_0 = atan2(ty, tx) - atan2(l*s2, h+l*c2);
}


