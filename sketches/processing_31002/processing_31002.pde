
import controlP5.*;

float boxBase = 10;
float speed = .003;

//map generation
int x_size = 50;
int y_size = 50;
public float sea_level = 100;
public float tree_line = 200;

public float detail_small = .04;
public float detail_big = .02;
public float scale_small = 100;
public float scale_big = 500;
public boolean tropical = true;

//temp vars
public int X_size = 200;
public int Y_size = 200;
public float Sea_level = .4;
public float Tree_line = .65;

float max_height = scale_big + scale_small;

//viewing
public boolean spin = true;
public float zoom = -1600;
public float angle = PI /4;
public float tilt = -PI /4;

//time
float t_frame;
float t_old;

//data
boolean[] key_array = new boolean[256];
float[][] height_map = new float[500][500];

//GUI
ControlP5 controlP5;
PGraphics cp5;

void setup() 
{
  size (800,400, P3D);
  noStroke();
  background(0);
  
  //GUI
  controlP5 = new ControlP5(this);
  controlP5.addSlider("X_size", 1, 500).linebreak();
  controlP5.addSlider("Y_size", 1, 500).linebreak();
  
  controlP5.addSlider("detail_small", 0, .1).linebreak();
  controlP5.addSlider("detail_big", 0, .1).linebreak();
  controlP5.addSlider("scale_small", 0, 1000).linebreak();
  controlP5.addSlider("scale_big", 0, 1000).linebreak();
  
  controlP5.addSlider("Sea_level", 0, 1).linebreak();
  controlP5.addSlider("Tree_line", 0, 1).linebreak();

  controlP5.addToggle("spin");
  controlP5.addToggle("tropical");
  controlP5.addButton("generate");
  
  cp5 = createGraphics(width*6, height*6, JAVA2D);
  
  generate();      
}

void draw()
{
  float h;
  float xd = boxBase * x_size / 2;
  float yd = boxBase * y_size / 2;
  sea_level = Sea_level * max_height;
  tree_line = Tree_line * max_height;
  
  //GUI fix
  background(0);
  beginRecord(cp5);
  controlP5.draw();
  endRecord();
  fill(100);
  //rect(0,0,230,height);
  background(0);
  
  image(cp5,0,0); 
  
  //camera
  control_camera();

  pushMatrix();
  translate(width/2 -400 * zoom/1600, height/2, zoom);
  //+ width * (-zoom/1600)
  //translate more when further away
  rotateX(tilt);
  rotateY(angle);
  
  //drawing landscape
  beginShape(QUADS);
  for (int x = 0; x < x_size -1; x++) {
    for (int y = 0; y < y_size -1; y++) {
      
      set_color(height_map[x][y]);
      vertex(boxBase * (x + 0) -xd, -flatten( height_map[x+0][y+0]), boxBase * (y + 0) - yd); 
      //set_color(height_map[x][y+1]);
      vertex(boxBase * (x + 0) -xd, -flatten( height_map[x+0][y+1]), boxBase * (y + 1) - yd); 
      //set_color(height_map[x+1][y+1]);
      vertex(boxBase * (x + 1) -xd, -flatten( height_map[x+1][y+1]), boxBase * (y + 1) - yd); 
      //set_color(height_map[x+1][y]);
      vertex(boxBase * (x + 1) -xd, -flatten( height_map[x+1][y+0]), boxBase * (y + 0) - yd);    
    }
  }
  endShape();
  
  //timing
  t_frame = millis() - t_old;
  t_old = millis();
  popMatrix(); 
}

void control_camera()
{
  if (spin) angle += .0002 * t_frame;
  if (key_array[LEFT]) {
    angle += speed*t_frame;
  }
  if (key_array[RIGHT]) {
    angle -= speed*t_frame;
  }
  if (key_array[UP] && (tilt > -PI/2)) {
    tilt -= speed*t_frame;
  }
  if (key_array[DOWN] && (tilt < 0)) {
    tilt += speed*t_frame;
  }
  if (key_array[34]) {
    zoom -= 100*speed*t_frame;
  }
  if (key_array[33] && (zoom < 300)) {
    zoom += 100*speed*t_frame;
  }
}

public void generate()
{
  noiseSeed(millis());
  x_size = X_size;
  y_size = Y_size;
  max_height = scale_big + scale_small;
  
  for (int x = 0; x < x_size; x++) {
    for (int y = 0; y < y_size; y++) {
      height_map[x][y] = scale_small * noise(detail_small * x, detail_small * y) +
                         scale_big   * noise(detail_big   * x, detail_big   * y);
    }
  }
}

void keyPressed()
{
  if (keyCode == ' ') generate();
  key_array[keyCode] = true;
}

void keyReleased()
{
  key_array[keyCode] = false;
}

float flatten(float h)
{
  if (h < sea_level) h = sea_level;
  return h;
}

void set_color(float h)
{
  float g = 255 * h/max_height;
  float r = g - (tree_line - h);
  
  if ((h < sea_level) && tropical) fill(0, 255 * h / sea_level,255);
  else if (h < sea_level) fill (0,0,255);
  else if (h > tree_line) fill(g);
  else if ((h < sea_level + 20) && tropical) fill (255,255,155);
  
  else fill(r,g,r);
}

