
/* Eulani Labay. Bootcamp 2011 */


// Set up elements:
PImage popcorn;
int pop_x = 150;
int pop_y = 0;
int pop_w = 50;
int pop_h = 50;

PImage M_M;
int MnM_x = 100;
int MnM_y = 0;
int MnM_w = 50;
int MnM_h = 50;

PImage red_gummi;
int red_x = 175;
int red_y = 0;
int red_w = 50;
int red_h = 50;

void setup () {
  size (600, 600);
  background (255);
  popcorn = loadImage ("popcorn-cell-phone.png");
  M_M = loadImage ("M_M.png");
  red_gummi = loadImage ("Red-Gummi-Bear.png");
}

void draw () {
}
  
// Draw on path of mouse drag:
void mouseDragged () {
if (key == '1') {
     image (popcorn, mouseX, mouseY, pop_w, pop_h); // Draw with popcorn
  } else if (key == '2') {
    image (M_M, mouseX, mouseY, MnM_w, MnM_h); // Draw with M&M   
  } else if (key == '3') {
    image (red_gummi, mouseX, mouseY, red_w, red_h); // Draw with gummi bear
}
}



