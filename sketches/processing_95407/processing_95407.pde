
// twinkle twinkle little painter by wenzhong 2013-04-06
// use another picture as colormap

// Operation:
// You can press mouse to draw / erase
// using "e" to toggle draw or erase
// using "r" to reset

/* @pjs preload = "data2.png" */

int col = 50;
int row = col;
float grid_size;
float radius_change_speed = 0.3;

float finger_tip_radius = 50;

boolean erase = false;

PImage bg_image;

Particle particles[][] = new Particle[row][col];

class Particle {
  float x;
  float y;
  float radius;
  float vx;
  float vy;
  float radius_change_speed;
  float min_radius;
  float max_radius;
  int age = 0;  // will activate age when mouse hover
  color pix;

  public Particle(float x, float y, float radius, 
                  float min_radius, float max_radius, float radius_change_speed,
                  color pix) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.min_radius = min_radius;
    this.max_radius = max_radius;
    this.radius_change_speed = radius_change_speed;
    this.pix = pix;
  }
  
  public void activate() {
    age = 50;
  }
  
  public void deactivate() {
    age = 0;
  }

  public void draw_next() {
    if (radius < min_radius || radius > max_radius) {
      radius_change_speed = - radius_change_speed;
    }
    radius += radius_change_speed;
    //fill(pix, radius * 255 / max_radius);
    fill(pix);
    if (age > 0) {
      ellipse(x, y, radius, radius);
      //age--;
    }
  }
}

void setup() {  
  bg_image = loadImage("data2.png");
  smooth();
  //size(bg_image.width, bg_image.height, P2D);
  size(600,600,P2D);
  grid_size = width / row;

  float min_radius = 0;
  float max_radius;
  for (int i = 0 ; i < row ; i++) {
    for (int j = 0 ; j < col ; j++) {
      max_radius = random( grid_size / 1.5, grid_size / 1.1);
      color pix = bg_image.get(int(i*grid_size), (int)(j*grid_size)); 
      particles[i][j] = new Particle(i*grid_size, j*grid_size, 
      //max_radius * random(0, 1), min_radius, max_radius, radius_change_speed, pix);
      max_radius * 0.6, max_radius * 0.4, max_radius, radius_change_speed * (random(1) > 0.5 ? 1 : -1), pix);
    }
  }
}

void draw() {
  background(0);
  noStroke();
    
  //image(bg_image, 0, 0);
  for (int i = 0 ; i < row ; i++) {
    for (int j = 0 ; j < col ; j++) {
      particles[i][j].draw_next();
    }
  }
}

void toggle_erase() {
  erase = !erase;
  if (erase == false) {
    cursor(ARROW);
  }
  else {
    cursor(CROSS);
  }
}

void keyPressed() {
  if (key == 'e') { 
    toggle_erase();
  }
  else if (key == 'r') { //reset, deactivate all
    for (int i = 0 ; i < row ; i++) {
      for (int j = 0 ; j < col ; j++) {
        particles[i][j].deactivate();
      }
    }
  }   
}

void mouseDragged() {
  int x = int(mouseX / grid_size);
  int y = int(mouseY / grid_size);
  
  if ( x >= 0 && x < int(width /grid_size) && y >= 0 && y < int(height/grid_size)) {
    if (!erase)
      particles[x][y].activate();
    else {
      particles[x][y].deactivate();
    }
  }
}
  
  



