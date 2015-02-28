
/*
Example Code for Math for Code, Parsons Bootcamp 2011
Ben Norskov
(Mouse Interaction not shown in class)
*/
float angle = 0;
int distance = 50;
int number_of_elements = 12;
float increment_value = TWO_PI / number_of_elements;
int circ_size = 15;
float start_angle = 0;
float rotate_speed = .8;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  smooth();
  noStroke();
}

void draw() {
  angle = radians(start_angle);
  background(180);
  
  for (int i =0; i < number_of_elements; i++) {
    fill(degrees(abs(angle))%360, 100, 100);
    ellipse(mouseX + cos(angle) * distance, mouseY + sin(angle) * distance, circ_size, circ_size);
    angle += increment_value;
  }
  start_angle += rotate_speed; 
  
  /*
  //This is how to do the code without a for loop. It should really be done with one
  
  fill(degrees(angle), 100, 100);
  ellipse(mouseX + cos(angle) * distance, mouseY + sin(angle) * distance, circ_size, circ_size);
  angle += increment_value;
  fill(degrees(angle), 100, 100);
  ellipse(mouseX + cos(angle) * distance, mouseY + sin(angle) * distance, circ_size, circ_size);
  angle += increment_value;
  fill(degrees(angle), 100, 100);
  ellipse(mouseX + cos(angle) * distance, mouseY + sin(angle) * distance, circ_size, circ_size);
  */
}

void mouseClicked() {
  rotate_speed *= -1;
}                           
