
import controlP5.*;

//erosion constants
public float uplift = .06;
public float erodability = .1;
public float area_exponent = .5;
public float slope_exponent = 1;

//map generation
int t_size = 50;
float boxBase = 10;
float speed = .003;

//METHODS
public int color_method = 1; //1 = height, 2 = area, 3 = slope, 4 = rgb
public int routing_method = 1; //1 = steepest descent, 2 = distributed
public int side_method = 1; //1 = zero height, 2 = zero slope, 3 = wrap around

//control variables
public float noise_detail = .04;
public float noise_scale = 10;
public float global_slope = .01;
public int land = t_size;
public boolean eroding = false;

int len = t_size * t_size;
float max_height = 1;
float min_height = 0;

//viewing
public boolean spin = false;
public float zoom = -700;
public float angle = PI /4;
public float tilt = -PI /4;

//time
float t_frame;
float t_old;

//data
boolean[] key_array = new boolean[256];
zone[][] landscape;
spot[] sorted_spots;

//GUI
ControlP5 controlP5;
PGraphics cp5;

void setup()
{
  size (800, 400, P3D);
  noStroke();
  background(53, 117, 250);

  landscape = new zone[500][500];
  sorted_spots = new spot[250000];

    //GUI
  create_gui();
  generate();
}

void draw()
{
  float h;
  float xd = boxBase * t_size / 2;
  float yd = boxBase * t_size / 2;

  //GUI fix
  background(0);
  beginRecord(cp5);
  controlP5.draw();
  endRecord();
  fill(100);
  background(129);
  image(cp5, 0, 0);

  //camera
  control_camera();

  pushMatrix();
  translate(width/2 -400 * zoom/1600, height/2, zoom);
  rotateX(tilt);
  rotateY(angle);

  //drawing landscape
  beginShape(QUADS);
  
  for (int x = 0; x < t_size - 1 ; x++) {
    for (int y = 0; y < t_size -1; y++) {

      landscape[x][y].set_color(); 
      vertex(boxBase * (x + 0) -xd, -boxBase * landscape[x+0][y+0].z, boxBase * (y + 0) - yd);
      //set_color(height_map[x][y+1]);
      vertex(boxBase * (x + 0) -xd, -boxBase *  landscape[x+0][y+1].z, boxBase * (y + 1) - yd);
      //set_color(height_map[x+1][y+1]);
      vertex(boxBase * (x + 1) -xd, -boxBase *  landscape[x+1][y+1].z, boxBase * (y + 1) - yd);
      //set_color(height_map[x+1][y]);
      vertex(boxBase * (x + 1) -xd, -boxBase *  landscape[x+1][y+0].z, boxBase * (y + 0) - yd);
    }
  }

  //drawing base
  fill(200, 200, 200);
  vertex(-xd, 0, - yd);
  vertex(-xd, 0, + yd);
  vertex(+xd, 0, + yd);
  vertex(+xd, 0, - yd);
  endShape();

  //timing
  t_frame = millis() - t_old;
  t_old = millis();
  popMatrix();
  println("bound: " + side_method);
  if (eroding) erode_all(true);

}


