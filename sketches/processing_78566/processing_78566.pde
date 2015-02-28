
int x1, y1, x2, y2;

int store_this_many = 40;
int[] x_val = new int[store_this_many];
int[] y_val = new int[store_this_many];

int saved_point = 0;
void setup() {
  size(400, 600);
}

void draw() {
  background(200);
  stroke(random(0), random(40), random(80), random(205) );
//  for (int line_x=0; line_x<width; line_x+=50) {
////    line(line_x, 0, line_x, height);
//      line(line_x, 25, x_val[0], y_val[0]);
//      line(line_x, 0, x_val[1], y_val[1]);
//      line(line_x, 0, x_val[2], y_val[2]);
//      line(line_x, 0, x_val[3], y_val[3]);
//      line(line_x, 0, x_val[4], y_val[4]);
//  }
  beginShape();
  for (int counter=0; counter< store_this_many; counter+=1) {
    //ellipse(x_val[counter], y_val[counter], 20, 20);
    vertex(30, 20);
    vertex(20, 30);
  }
  endShape();
  noStroke();
  /*for (int counter=1; counter < 150; counter ++) {
    fill( random(0), random(220), random(225), random(255) );
    ellipse(random(width), random(height), 75, 75);
    ellipse(random(width), random(height), 75, 75);
    ellipse(random(width), random(height), 75, 75);
    ellipse(random(width), random(height), 75, 75);
  }*/
}

void mousePressed() {
  x_val[saved_point] = mouseX;
  y_val[saved_point] = mouseY;
  saved_point += 1;
}

//ellipse(random(width), random(height), 40, 40); ellipse(random(width), random(height), 75, 75); ellipse(random(width), random(height), 60, 60);
//ellipse(random(width), random(height), 25, 25); ellipse(random(width), random(height), 70, 70);
