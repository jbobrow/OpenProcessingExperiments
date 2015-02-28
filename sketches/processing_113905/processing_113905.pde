
int rows = 34;
int cols = 42;
int cellsize = 20;
int border = int(cellsize*2.5);

int w = cols*cellsize + 2*border;
int h = rows*cellsize + 2*border;

void setup() {
  size(940, 780); //w and h
  noSmooth();
}

/* star class */

class Superstar {
  float starx;
  float stary;
  float rand_starx;
  float rand_stary;
  int star_row;
  int star_col;
  boolean is_cross;
  
  Superstar(boolean poopface) {
    starx = w/2.0;
    stary = h/2.0;
    is_cross = poopface;
  }
  
  void update() {
    /* create randomness based on distance from mouse and star x and y */
    float d = sqrt( sq(starx - mouseX) + sq(stary - mouseY) );
    float starx_jitter = 0.75*d * random(-1, 1);
    float stary_jitter = 0.75*d * random(-1, 1);
    
    /* move the star towards mouse slowly with randomness */
    starx += (mouseX - starx) / 20;
    stary += (mouseY - stary) / 20;
    rand_starx = starx + starx_jitter;
    rand_stary = stary + stary_jitter;
    /* update the star row and col for new x and y */
    star_row = int(int(rand_stary - border) / cellsize);
    star_col = int(int(rand_starx - border) / cellsize);
  }
  
  void display() {
    /* find cell star resides in by constraining its row and col */
    int row = constrain(star_row, 0, rows-1);
    int col = constrain(star_col, 0, cols-1);
    
    /* find cell x and y and draw star in it */
    int cellx = col*cellsize + border;
    int celly = row*cellsize + border;
    pushMatrix();
    translate(cellx, celly);
    noStroke();
    fill(star_color);
    /* if is a cross, draw star as cross */
    if (is_cross) {
      float unit = cellsize/5.0;
      beginShape();
      vertex(2*unit, unit);
      vertex(3*unit, unit);
      vertex(3*unit, 2*unit);
      vertex(4*unit, 2*unit);
      vertex(4*unit, 3*unit);
      vertex(3*unit, 3*unit);
      vertex(3*unit, 4*unit);
      vertex(2*unit, 4*unit);
      vertex(2*unit, 3*unit);
      vertex(unit, 3*unit);
      vertex(unit, 2*unit);
      vertex(2*unit, 2*unit);
      endShape(CLOSE);
    } else {
      /* draw star as filled in */
      float margin = cellsize/8.0;
      rect(margin, margin, cellsize-2*margin, cellsize-2*margin);
    }
    popMatrix();
  }
}

/* stuff */

Superstar star1 = new Superstar(true);
Superstar star2 = new Superstar(false);
Superstar star3 = new Superstar(false);
Superstar star4 = new Superstar(false);

/*
color bg_color = color(16);
color cell_stroke_color = color(0);
color cell_color = color(0, 0, 0, 32);
color star_color = color(255);
*/

///*
color bg_color = color(239);
color cell_stroke_color = color(255);
color cell_color = color(255, 255, 255, 32);
color star_color = color(0);
//*/

boolean first = true;  /* tells if we are initializing the view */

void draw() {
  
  /* bg stuff */
  
  if (first) {
    /* initialize an opaque background to draw grid on */
    background(bg_color);
    draw_grid(true);
    first = !first;
  }
  
  draw_grid(false);
  
  /* star stuff */
  
  star1.update();
  star2.update();
  star3.update();
  star4.update();
  
  star1.display();
  star2.display();
  star3.display();
  star4.display();
}

void draw_grid(boolean is_opaque) {
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      draw_cell(row, col, is_opaque);
    }
  }
}

void draw_cell(int row, int col, boolean is_opaque) {
  //stroke(cell_stroke_color);
  noStroke();
  if (is_opaque) {
    fill(get_opaque(cell_color));
  } else {
    fill(cell_color);
  }

  int cellx = col*cellsize + border;
  int celly = row*cellsize + border;
  float margin = cellsize/8.0;
  pushMatrix();
  translate(cellx, celly);
  rect(margin, margin, cellsize-2*margin, cellsize-2*margin);
  popMatrix();
}

color get_opaque(color c) {
  /* returns color equivalent to c except with an alpha value of 255 */
  return color(red(c), green(c), blue(c));
}
