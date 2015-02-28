
// a simple counter variable that increases over time
float my_num = 20;
float coeff = 0;
float bg = 0;
 
void setup() {
  size(400, 400);
  background(#810C2F);
  fill(255);
  noStroke();
  smooth();
  rectMode(CENTER);
  colorMode(HSB);
}

void draw_bubble(float coeff) {
  translate(width * noise(my_num + 3*coeff), height * noise(my_num + 4*coeff));
  rotate(10 * noise(my_num + 2*coeff));
  fill(255, 128 * noise(my_num));
  ellipse(0, 0, 200 * noise(coeff + my_num), 200 * noise(my_num));
  resetMatrix();
}

void draw() {
  background(bg,128,128);
  //background(#810C2F);
  int c = 1;
  while (c<40) {
     draw_bubble(c*50);
     c += 1;
  }   
  my_num = my_num + 0.005;
}

void mouseClicked() {
  bg = 5+ noise(my_num) * 255;
}
