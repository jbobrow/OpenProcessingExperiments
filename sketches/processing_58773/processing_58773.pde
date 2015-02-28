
/** Helicopter 10/04/2012 by Peter Bosshard Schneider<br />
 *  arrow keys: <br />
 *  UP - accelerate and win height | DOWN - decelerate and land<br />
 *  LEFT - turn left | RIGHT - turn right<br />
 *  'i' - toggle info panel<br />
 *   use -Xmx256M in the Java Options to increase heap space.
 */

String basename = "Helikopter_";
String nums;
String ext = ".png";
int num_imgs = 16;
PImage[] images;
PImage bgimg;
PImage mapimg;
int curr_index = 0;
float max_speed = 100;
float min_speed = 10;
float curr_speed = 0;
int start_time;
int image_time;
int speed_time;
float direction = HALF_PI;
float min_scale = 0.25;
float curr_scale = 0.25;
float max_scale = 1.0;
float px, py;
float scroll_x = -3027;
float scroll_y = -2985;
InfoPanel info;
boolean show_infopanel = false;

void setup() {
  size(500, 500, P2D);
  px = width/2;
  py = height/2;
  background(0);
  images = new PImage[num_imgs];
  for (int i=0;i<num_imgs;i++) {
    nums = nf(i+1, 2, 0);
    images[i] = loadImage(basename + nums + ext);
  }
  bgimg = loadImage("largebg.jpg");
  mapimg = loadImage("smallbg.jpg");
  //frameRate(25);
  start_time = millis();
  info = new InfoPanel(new PVector(width-130, 10), mapimg);
}

void draw() {
  image(bgimg, scroll_x, scroll_y);
  if (curr_speed > 0) {
    image_time = millis() - start_time;
    speed_time = round(1000.0/curr_speed);
    if (image_time > speed_time) {
      start_time = millis();
      image_time = 0;
      curr_index++;
      if (curr_index > num_imgs-1) curr_index = 0;
    }
    float scroll_amt_x = sin(direction+HALF_PI)*0.01*curr_speed;
    float scroll_amt_y = -cos(direction+HALF_PI)*0.01*curr_speed;
    scroll_x += scroll_amt_x;
    scroll_y += scroll_amt_y;
    if (scroll_x >= 0) scroll_x = 0;
    if (scroll_x <= -(bgimg.width-width)) scroll_x = -(bgimg.width-width);
    if (scroll_y >= 0) scroll_y = 0;
    if (scroll_y <= -(bgimg.height-height)) scroll_y = -(bgimg.height-height);
  }

  // calculate scale factor
  curr_scale = map(curr_speed, 0, max_speed, min_scale, max_scale);
  pushMatrix();
  translate(px, py);
  rotate(direction);
  scale(curr_scale);
  image(images[curr_index], 0 -images[curr_index].width/2, 0 -images[curr_index].height/2);
  popMatrix();

  // show info panel 10 seconds after launch
  if(frameCount == 600)show_infopanel = true;
  // show info panel
  if (show_infopanel) {
    info.update(curr_speed, max_speed, direction-HALF_PI, scroll_x, scroll_y);
    info.display();
  }
}



void keyPressed() {
  if (keyCode == UP) {
    if (curr_speed < 1) {
      curr_speed = min_speed;
    }
    else if (curr_speed < max_speed) {
      curr_speed++;
    }
  }
  if (keyCode == DOWN) {
    if (curr_speed > 0) curr_speed--;
  }
  if (keyCode == RIGHT) {
    direction+= TWO_PI/180;
  }
  if (keyCode == LEFT) {
    direction-= TWO_PI/180;
  }
}

void keyReleased(){
  if(key == 'i')show_infopanel = !show_infopanel;
  if(key == 's')saveFrame("Helicopter_##.jpg");
}

void mouseReleased() {
  println("Scroll X: " + scroll_x + " Scroll Y: " + scroll_y + " Scalefactor: " + curr_scale);
}


