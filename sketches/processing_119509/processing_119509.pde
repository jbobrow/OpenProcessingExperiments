

float layer[][][];

color colors[] = {color(255, 80, 80), color(176, 255, 0), color(80, 255, 255), color(128, 128, 128)};

int distance = 50;
int x_steps, y_steps;
int offset_x = 5;
int offset_y = 5;

int stroke_weight = 3;
int stroke_offset = 0;

float max_vel = 60;
float min_vel = 10;
float brake = 0.1;
int size_offset = -10;

float fade_fact = 0.9;
int m_blur = 200;

color background_color = 0;

boolean active[];
boolean trigger_mode = true;
boolean fade_active = true;
boolean blur_active = true;
boolean background_active = true;


void setup() {
  size(600, 600);
  x_steps = width/distance - 1;
  y_steps = height/distance -1;
  layer = new float[colors.length][x_steps][y_steps];
  active = new boolean[colors.length];
  for (int i = 0; i < active.length; i++) {
    active[i] = true;
  }
  background(background_color);
}

void draw() {

  if (background_active) {
    noStroke();
    fill(background_color, 255-m_blur*int(blur_active));
    rect(0, 0, width, height);
  }


  noFill();
  for (int c = colors.length-1; c >= 0; c--) {
  resetMatrix();
    int start_x = distance+c*offset_x;
    int start_y = distance+c*offset_y;
    translate(start_x, start_y);
    int col;
    int row;
    if (mousePressed) {
      if (trigger_mode) {
        col = ( mouseX -start_x)/distance;
        row = ( mouseY -start_y)/distance;
      }
      else {
        col = ( mouseX -distance)/distance;
        row = ( mouseY -distance)/distance;
      }
    } 
    else {
      col = row = -1;
    }
    stroke(colors[c]);
    strokeWeight(stroke_weight+c*stroke_offset);
    for (int i = 0; i < x_steps; i++) {
      for (int j = 0; j < y_steps; j++) {
        if (i == col && j == row && active[c]) {
          layer[c][i][j] += min_vel + (max_vel-min_vel+c*size_offset)/(1+layer[c][i][j]*brake);
        } 
        else {
          if (fade_active) {
            layer[c][i][j] *= fade_fact;
            if (layer[c][i][j] > width && layer[c][i][j] > height && fade_fact >= 1) {
              layer[c][i][j] = 0;
            }
          }
        }
        int size = (int)layer[c][i][j];
        if (size > 0 ) {
          ellipse(i*distance, j*distance, size, size);
        }
      }
    }
  }
}

void keyPressed() {
  switch(key) {
  case 'c':
    trigger_mode = !trigger_mode;
    break;
  case 'q':
    for (int i = 0; i < active.length; i++) {
      active[i] = !active[i];
    }
    break;
  case 'w':
    for (int i = 0; i < active.length; i++) {
      active[i] = false;
    }
    break;
  case 'e':
    for (int i = 0; i < active.length; i++) {
      active[i] = true;
    }
    break;
  case 'a':
    blur_active = !blur_active;
    break;
  case 's':
    fade_active = !fade_active;
    break;
  case 'd':
    background_active = !background_active;
    break;
  case ' ':
    for (int n = 0; n < colors.length; n++) {
      for ( int x = 0; x < x_steps; x++) {
        for (int y = 0; y < y_steps; y++) {
          layer[n][x][y] = 0;
        }
      }
    }
    break;

  default:
    int num_key = int(key)-49;
    if (num_key >= 0 && num_key < colors.length) {
      active[num_key] = !active[num_key];
    }
  }
}
