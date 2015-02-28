
float angle = 0;
int distance = 5;
int number_of_elements = 3;
float increment_value = TWO_PI / number_of_elements;
int circ_size = 15;
float start_angle = 0;
float rotate_speed = .8;
int circle_x = 56;
int circle_y = 40;
int circle_w = 25;
int star_x = 56;
int star_y = 87;
int star_w = 30;
int square_x = 55;
int square_y = 140;
int square_w = 27;
int tri_x = 56;
int tri_y = 163;
int tri_w = 30;
int background_chooser = 0;

int num_point_to_store = 100;
int[] x_vals = new int[num_point_to_store];
int[] y_vals = new int[num_point_to_store]; 


void setup() {
  size(500, 500);
  background(255);
  
}

void draw() {
  background(102);

  if ( background_chooser == 0) {
    background(255);
    stroke(0);
  } 
  else if (background_chooser == 1) {
    background(255, 247, 157);
    stroke(255);
  } 
  else if ( background_chooser == 2) {
    background(145, 206, 244);
  }
  else if ( background_chooser == 3) {
    background(0);
  }

  

  //145, 206, 244
  noFill();
  rect(31, 15, 50, 180);
  fill( random(247), random(0), random(134));
  triangle(56, 163, 44, 183, 69, 183);
  ellipse(circle_x, circle_y, circle_w, circle_w);
  beginShape();//begin drawing the shape -- It's a big star
  vertex(56, 69);
  vertex(61, 79);
  vertex(72, 80);
  vertex(64, 88);
  vertex(66, 98);
  vertex(56, 93);
  vertex(47, 98);
  vertex(49, 88);
  vertex(41, 80);
  vertex(52, 79);
  vertex(56, 69);
  rect(45, 120, 23, 23);
  endShape();

  noStroke();
  println(mouseX + " " + mouseY);
  
  for(int i = x_vals.length-1; i>0; i--) {
    x_vals[i] = x_vals[i-1];
    y_vals[i] = y_vals[i-1];
  }
  noFill();
  //(random(222), random(153),random(191)
  stroke(202, 0, 136);
  //239, 122, 209
  strokeWeight(9);
  beginShape();
  for (int i=0; i<x_vals.length; i++) {
    vertex(x_vals[i], y_vals[i]);
    
  }
 
  endShape();
  stroke(239, 122, 209);
  strokeWeight(6);

  beginShape();
  for (int i=0; i<x_vals.length; i++) {
    vertex(x_vals[i], y_vals[i]);
  }
    endShape();
  stroke(255);
  strokeWeight(3);

  beginShape();
  for (int i=0; i<x_vals.length; i++) {
    vertex(x_vals[i], y_vals[i]);
  }
  
  endShape();
  
}
void mouseDragged() {
  //line(mouseX, mouseY, pmouseX, pmouseY);

  //ellipse(mouseX + cos(angle) * distance, mouseY + sin(angle) * distance, circ_size, circ_size);
  x_vals[0] = mouseX;
  y_vals[0] = mouseY;
}
void mouseClicked() {
  if(dist (mouseX, mouseY, circle_x, circle_y) < circle_w/2){
    background_chooser = 0;
  }; 

  if(dist (mouseX, mouseY, star_x, star_y) < star_w/2){
    background_chooser = 1;
  };
  
  if(dist (mouseX, mouseY, square_x, square_y) < square_w/2){
    background_chooser = 2;
  };
  
  if(dist (mouseX, mouseY, tri_x, tri_y) < tri_w/2){
    background_chooser = 3;
  };
}
