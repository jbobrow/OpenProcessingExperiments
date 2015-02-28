
//import processing.pdf.*;

//int w_in = 16;
//int h_in = 5;
//int dpi = 72;

//int w = w_in*dpi; int h = h_in*dpi;

int w = 900;
int h = 300;

void setup() {

  /* if you want to output to a pdf file, use this.
   * try to make the dpi at least 200.
   * comment this out if you are just testing on screen.
   */
  //size(w, h, PDF, "aout.pdf");
   
  /* if you want to just test it on the screen, use this.
   * comment this out if you want to output to a pdf file.
   */
  size(900, 300);

  noLoop();
}

int barwidth = w/16; //50

color bg_fill = color(255); //color(255, 255, 250);
color line_fill = color(0); //color(70, 60, 80);

float noise_ctr = 0;
int max_circles = 3;

void draw() {
  background(bg_fill);
  for (int x = 0; x < w; x += barwidth) {
    fill(bg_fill);
    noStroke();
    rect(x, 0, barwidth, h);
    int num_of_circles = (int) ( noise(noise_ctr)*max_circles );
    for (int j = 0; j < num_of_circles; j++) {
      drawRandCircle(x);
    }
    noise_ctr += 0.03;
  }
  
  //exit();
}

void drawRandCircle(int x) {
  noFill();
  stroke(line_fill);
  float line_weight = barwidth/5;
  strokeWeight(line_weight);
  float circle_d = random(barwidth+line_weight, h);
  float circle_x = random(x - circle_d/2, x+barwidth + circle_d/2);
  float circle_y = random(0 - circle_d/2, h + circle_d/2);
  ellipse(circle_x, circle_y, circle_d, circle_d);
  
}
