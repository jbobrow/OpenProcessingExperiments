
float max_acc = .05;
float max_vel = .4;
float z_limit = 6;
int max_size = 10;
int min_size = 5;
int max_blobs = 50;

Blob my_blobs[] = new Blob[max_blobs];

class Blob
{
  int diameter;
  float x, y, z;
  float dx, dy, dz;
  
  Blob(int init_diameter, float init_x, float init_y, float init_z)
  {
    diameter = init_diameter;
    x = init_x;
    y = init_y;
    z = init_z;
    dx = random(-max_vel,max_vel);
    dy = random(-max_vel,max_vel);
    dz = random(-max_vel,max_vel);
  }
  
  void move()
  {
    x += dx;
    y += dy;
    z += dz;
    
    if(x > width) {x = width; dx = 0;}
    if(x < 0) {x = 0; dx = 0;}
    if(y > height) {y = height; dy = 0;}
    if(y < 0) {y = 0; dy = 0;}
    if(z > max_size) {z = max_size; dz = 0;}
    if(z < min_size) {z = min_size; dz = 0;}
  }
  
  void change_momentum()
  {
    dx += random(-max_acc, max_acc);
    dy += random(-max_acc, max_acc);
    dz += random(-max_acc, max_acc);
  
    if(dx >  max_vel) dx =  max_vel;
    if(dx < -max_vel) dx = -max_vel;
    if(dy >  max_vel) dy =  max_vel;
    if(dy < -max_vel) dy = -max_vel;
    if(dz >  max_vel) dz =  max_vel;
    if(dz < -max_vel) dz = -max_vel;
  }
  
  void display()
  {
    noStroke();
    ellipse(x, y, diameter + z, diameter+z);
  }
}

void setup()
{
  size(400, 400);
  smooth();
  
  for(int i = 0; i < my_blobs.length; i++)
  {
    my_blobs[i] = new Blob((int)random(min_size, max_size),
        random(width),
        random(height),
        random(0, 15));
  }
}

void draw()
{
  background(0);
  noStroke();
  
  for(int i = 0; i < my_blobs.length; i++)
  {
    my_blobs[i].change_momentum();
    my_blobs[i].move();
    my_blobs[i].display();
  }
}


