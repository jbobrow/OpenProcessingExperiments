
PImage img;

float[] x_pos, y_pos;

float max_distance;

int num_travelers = 100;

boolean fade = false;

void setup()
{
  img = loadImage("DSC_0235.JPG");
  //size(img.width,img.height,P2D);
  size(800,532,P2D);
  max_distance = ( (float)(img.width+img.height) )/(2.0*40.0);
  background(0);
  smooth();
  x_pos = new float[num_travelers];
  y_pos = new float[num_travelers];
  for(int i = 0; i < num_travelers; ++i) {
    x_pos[i] = random(img.width);
    y_pos[i] = random(img.height);
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
  float distance = map(mouseX, 0, width, 2.0, max_distance);
  int opacity = int(map(mouseY, 0, height, 0, 255));
  for(int i = 0; i < num_travelers; ++i) {
    float theta = random(TWO_PI);
    float x_next = x_pos[i] + distance*cos(theta);
    float y_next = y_pos[i] + distance*sin(theta);
    color c = img.get((int)x_pos[i],(int)y_pos[i]);
    stroke(c, opacity);
    strokeWeight(distance/2.0);
    line(x_pos[i], y_pos[i], x_next, y_next);
    if( 0 < x_next && x_next < (float)(img.width) && 0 < y_next && y_next < (float)(img.height) ) {
      x_pos[i] = x_next;
      y_pos[i] = y_next;
    } else {
      x_pos[i] = random(img.width);
      y_pos[i] = random(img.height);
    }
  }
}
  

