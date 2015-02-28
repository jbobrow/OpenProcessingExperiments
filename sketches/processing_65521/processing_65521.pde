
PImage back;
PImage distort;
PImage shadow;
PImage window;
PImage wall;
PImage doll;

void setup() {
  size(510, 640);
  smooth();
  back = loadImage("background.jpg");
  distort = loadImage("static.png");
  shadow = loadImage("shadow.png");
  window = loadImage("window_shadow.png");
  wall = loadImage("shadow_wall.png");
  doll = loadImage("doll.png");
  frameRate(2);
  imageMode(CENTER);
}
 
void draw() {
  int i = frameCount;
  
  background(0);

  //background
  float b_x = width/2;
  float b_y = height/2;

  //static
  float d_x = width/2;
  float d_y = random(50, 600);

  //shadow on the wall
  float s_x = random(180, 280);
  float s_y = random(150, 220);

  //shadow on the window
  float w_x = random(383, 410);
  float w_y = random(80, 140);
  float w_w = random (30, 50);
  float w_h = random (60, 83);

  //hands on the wall
  float h_x = random(75, 120);
  float h_y = random(155, 410);

  //doll
  float m_x = random(330, 450);
  float m_y = 590;

  if(i%2 == 0)
  {
    image(back, b_x, b_y);
    image(shadow, s_x, s_y);
    image(window, w_x, w_y, w_w, w_h);
    image(wall, h_x, h_y);
    image(doll, m_x, m_y);
  }
  image(distort, d_x, d_y);
}

