
PImage img;

float[] x_pos, y_pos, theta;
float max_theta_inc = -PI/6.0;
float min_theta_inc =  PI/6.0;

float distance = 8.0;

int num_travelers = 1000;

boolean fade = false;

void setup()
{
  img = loadImage("DSC_0235.JPG");
  //size(img.width,img.height,P2D);
  size(800,532,P2D);
  background(0);
  strokeWeight(4.0);
  //smooth();
  x_pos = new float[num_travelers];
  y_pos = new float[num_travelers];
  theta = new float[num_travelers];
  for(int i = 0; i < num_travelers; ++i) {
    x_pos[i] = random(img.width);
    y_pos[i] = random(img.height);
    theta[i] = random(TWO_PI);
  }
}

void mousePressed()
{
  fade = !fade;
}

void draw()
{
  if( fade ) {
    noStroke();  
    fill(0,0,0,1);
    rect(0,0,width,height);
  }
  float theta_inc = map(mouseX, 0, width, min_theta_inc, max_theta_inc);
  int opacity = int(map(mouseY, 0, height, 0, 255));
  for(int i = 0; i < num_travelers; ++i) {
    float x_next = x_pos[i] + distance*cos(theta[i]);
    float y_next = y_pos[i] + distance*sin(theta[i]);
    color c = img.get((int)x_pos[i],(int)y_pos[i]);
    stroke(c, opacity);
    line(x_pos[i], y_pos[i], x_next, y_next);
    if( 0 < x_next && x_next < (float)(img.width) && 0 < y_next && y_next < (float)(img.height) ) {
      x_pos[i] = x_next;
      y_pos[i] = y_next;
      theta[i] += theta_inc;
    } else {
      x_pos[i] = random(img.width);
      y_pos[i] = random(img.height);
      theta[i] = random(TWO_PI);
    }
  }
}
  

