
// Eulani Labay. Bootcamp 2011.

// set up elements
PImage popcorn;
int pop_x = 150;
int pop_y = 0;
int pop_speed = 3; // frames per second
int pop_w = 50;
int pop_h = 50;

PImage M_M;
int MnM_x = 100;
int MnM_y = 0;
int MnM_speed = 7; 
int MnM_w = 50;
int MnM_h = 50;

PImage red_gummi;
int red_x = 175;
int red_y = 0;
int red_speed = 6; 
int red_w = 50;
int red_h = 50;

PImage white_gummi;
int white_x = 50;
int white_y = -50;
int white_speed = 5; 
int white_w = 50;
int white_h = 50;

PImage popcorn2;
int pop2_x = 75;
int pop2_y = 0;
int pop2_speed = 2;
int pop2_w = 50;
int pop2_h = 50;

PImage popcorn3;
int pop3_x = 125;
int pop3_y = -50;
int pop3_speed = 3;
int pop3_w = 50;
int pop3_h = 50;

void setup() {
  size (300, 300);
  popcorn = loadImage ("popcorn-cell-phone.png");
  M_M = loadImage ("M_M.png");
  red_gummi = loadImage ("Red-Gummi-Bear.png");
  white_gummi = loadImage ("white-gummi-bear.png");
  popcorn2 = loadImage ("popcorn-cell-phone.png");
  popcorn3 = loadImage ("popcorn-cell-phone.png");
  frameRate (60);
}

// drop popcorn from bottom of screen 
void draw () {
  background (255);
  image (popcorn, pop_x, pop_y, pop_w, pop_h);
    pop_y = (pop_y + pop_speed);
  image (M_M, MnM_x, MnM_y, MnM_w, MnM_h);
    MnM_y = (MnM_y + MnM_speed);
  image (red_gummi, red_x, red_y, red_w, red_h);
    red_y = (red_y + red_speed);
  image (white_gummi, white_x, white_y, white_w, white_h);
    white_y = (white_y + white_speed);
  image (popcorn2, pop2_x, pop2_y, pop2_w, pop2_h);
    pop2_y = (pop2_y + pop2_speed);
  image (popcorn3, pop3_x, pop3_y, pop3_w, pop3_h);
    pop3_y = (pop3_y + pop3_speed);
    
// make it "rain" (to stick to bottom: pop_y, etc. = 250)
  if (pop_y + pop_h > 300) { 
  pop_y = -50;
  }
  if (MnM_y + MnM_h > 300) { 
  MnM_y = -50;
  }
  if (red_y + red_h > 300) { 
  red_y = -50;
  }
  if (white_y + white_h > 300) { 
  white_y = -50;
  }
  if (pop2_y + pop2_h > 300) { 
  pop2_y = -50;
  }
  if (pop3_y + pop3_h > 300) { 
  pop3_y = -50;
  }

  
}



