
int center_x;
int center_y;
int bar_width_out = 8;
int bar_height_out = 40;
int bar_width_in = 4;
int bar_height_in = 10;
int num_bars_out = 68;
int num_bars_in = 75;
int outside_radius = 164;
int inside_radius = 102;
int[] rand_bars_out = new int[num_bars_out];
int[] rand_bars_in = new int[num_bars_in];
color outside_color = color(121, 184, 21);
color inside_color = color(233, 63, 51);

void setup() {
  size(560, 560);
  center_x = width/2;
  center_y = height/2;
  
  make_random_bars();
}

void make_random_bars() {
  for (int i = 0; i < num_bars_out; ++i) {
    rand_bars_out[i] = (int) random(40, 100);
  }

  for (int i = 0; i < num_bars_in; ++i) {
    rand_bars_in[i] = (int) random(10, 35);
  } 
}

void draw() {
  int r = 40;
  float delta_ang;
  noStroke();
  background(255);
 
  // Outside bars
  
  delta_ang = 2*PI/num_bars_out;
  for (int i = 0; i < num_bars_out; ++i) {
     pushMatrix();
     translate(center_x, center_y); 
     rotate(i*delta_ang);
     fill(outside_color);
     rect(0, outside_radius, bar_width_out, rand_bars_out[i]);
     popMatrix();
  }
  
  // Inside bar

  delta_ang = 2*PI/num_bars_in;
  for (int i = 0; i < num_bars_in; ++i) {
     pushMatrix();
     translate(center_x, center_y); 
     rotate(i*delta_ang);
     fill(inside_color);
     rect(0, inside_radius - rand_bars_in[i], bar_width_in, rand_bars_in[i]);
     popMatrix();
  }
}

void keyPressed() {
  if (key  == ' ') {
    make_random_bars();
  } 
}
