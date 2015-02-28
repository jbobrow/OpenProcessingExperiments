
void setup() {
  size(700, 700);
  smooth();
  frameRate(5);
}

int col_width = 100;
int col_height = 600;
int cir_diameter = 69;

int w_start = 0;
int h_start = 100;
int color_start = 100;
int cir_x_start = 50;
int cir_y_start = 50;
int cur_end = 36;
//color cur_color_start = color(60, 149, 180);
color cur_color_start = color(37, 173, 156);

int w_change = 100;
int h_change = 50;
int c_change = 15;
int cir_x_change = 100;
int cir_y_change = 50;
//int cir_diameter_change = 10;
int cir_diameter_change = 15;
int cur_change = 28;


int t = 0; 

void draw() {  
  /* Don't need to use a while loop or a for loop if we want to see
     each column to "grow up" individually.*/
  
  int i = 0;
  
  // Change the background color each time a different column is drawn.
  background(color_start);
  color_start = color_start + c_change;
  
  w_start = 0;
  h_start = 100;
  cir_x_start = 50;
  cir_y_start = 50;
  cir_diameter = 69;
    
  while(i <= t) {
    noStroke();
      
    // Control the colors of the columns.
    if (0 == i) {
      // Red;
      fill(255, 0, 0, 255);
    } else if (1 == i) {
      // Orange;
      fill(255, 127, 0, 191);
    } else if (2 == i) {
      fill(255, 255, 0, 127);
    } else if (3 == i) {
      fill(0, 255, 0, 127);
    } else if (4 == i) {
      fill(0, 0, 255, 127);
    } else if (5 == i) {
      fill(75, 0, 130, 191);
    } else if (6 == i) {
      fill(143, 0, 255, 255);
    }

    
    // Draw the columns.
    rect(w_start, h_start, col_width, col_height);
    //col_height = col_height - h_change;
    
    
    boolean row_circle = true;
    if (row_circle) {
      // Draw the row of circles that's above the column.
      fill(247, 240, 255);
      ellipse(cir_x_start, cir_y_start, cir_diameter, cir_diameter);
        if(cir_diameter < 15) {
          cir_diameter_change = -4;
        }
    } else {
      // Draw the increasing circle that's at the right-hand side corner of the canvas.
      // This circle has the "a moon that increases its size" effect.
      fill(255, 248, 33);
      ellipse(600, 100, cir_diameter, cir_diameter);
    }
    
    
    // Curve
    pushMatrix();
    translate(cir_x_start - (cir_diameter / 2), cir_y_start - (cir_diameter / 2));
    stroke(255);
    //fill(237, 255, 0);   
    fill(cur_color_start);
    curve(120, 15, -8, -8, cur_end, cur_end, 105, 80);    
    popMatrix();   
    
    w_start = w_start + w_change;
    h_start = h_start + h_change;
    cir_x_start = cir_x_start + cir_x_change;
    cir_y_start = cir_y_start + cir_y_change;
    cir_diameter = cir_diameter - cir_diameter_change;
    cur_end = cur_end + cur_change;
    cur_color_start = cur_color_start - c_change;
    
    i += 1;
  }
  
  // End the loop once i reaches 7.
  t += 1;
  if(10 == t) {
    noLoop();
  }
}  
  
void mousePressed() {
  t = 0;
}  
  
  
  
  
  
  /* The first column of the rainbow pattern, the Red one (with 75% opacity).
  noStroke();
  fill(255, 0, 0, 191);
  rect(0, 100, width, height);
  
  // The second column of the rainbow pattern, the Orange one (with 75% opacity).
  noStroke();
  fill(255, 127, 0, 191);
  rect(100, 150, width, 550);
  
  // The third column of the rainbow pattern, the Yellow one (with 75% opacity).
  noStroke();
  fill(255, 255, 0, 191);
  rect(200, 200, width, 500);
  
  // The fourth column of the rainbow pattern, the Green one (with 75% opacity).
  noStroke();
  fill(0, 255, 0, 191);
  rect(300, 250, width, 450);
  
  // The fifth column of the rainbow pattern, the Blue one (with 75% opacity).
  noStroke();
  fill(0, 0, 255, 191);
  rect(400, 300, width, 400);
  
  // The sixth column of the rainbow pattern, the Indigo one (with 75% opacity).
  noStroke();
  fill(75, 0, 130, 191);
  rect(500, 350, width, 350);
  
  // The seventh column of the rainbow pattern, the Violet one (with 75% opacity).
  noStroke();
  fill(143, 0, 255, 191);
  rect(600, 400, width, 300);
  
}*/


