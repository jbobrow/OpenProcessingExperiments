
// Basic code made by Instructor Ben Norskov in the Dorkshop "Math for Code". 
// 7 objects around the mouse equally spaced

int numbers_of_obj = 60;
int distance = 100;
float angle_inc = TWO_PI/numbers_of_obj; 
float current_angle = 10; 
void setup() {
  size(800, 600, P3D);
  colorMode(HSB, 360, 100, 100);
  smooth();
}

void draw() {
  background(80);

  for (int i = 0; i < numbers_of_obj; i++) {  
    float offset_x = cos(angle_inc*i)*distance; // for the x
    float offset_y = sin(angle_inc*i)*distance; // for the y always 
    fill(map(angle_inc*i, 0, TWO_PI, 0, 360), 90, 100, 60);
    //    ellipse(width/2+offset_x, height/2+offset_y, 20, 20);

    //Draw the group of Hexagons
    pushMatrix();
    //translate(width/2+offset_x, height/2+offset_y, height/2+offset_y);
    translate(width/1.7-offset_x, height/2-offset_y, 0);
    myHexa();
    popMatrix();

    pushMatrix();
    //translate(width/2+offset_x, height/2+offset_y, height/2+offset_y);
    translate(width/3+offset_x, height/2+offset_y, 0);
    myHexa();
    popMatrix();
  }
}

void myHexa( ) {
  int a = 12;
  int b = 8;
  int c = 16;

  /* draw the hexagon */
  scale(4);
  beginShape();
  vertex(-b, -a);
  vertex(b, -a);
  vertex(c, 0);
  vertex(b, a);
  vertex(-b, a);
  vertex(-c, 0);
  endShape(CLOSE);

}


