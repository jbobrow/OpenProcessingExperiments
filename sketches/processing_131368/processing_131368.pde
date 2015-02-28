
void setup() {
size(500,500);
background(255);
}
float a_radius = 100;
float a_angle = 0;
float a_x = cos(a_angle*PI/180)*a_radius;
float a_y = sin(a_angle*PI/180)*a_radius;

float b_radius = 150;
float b_angle = 0;
float b_x = cos(b_angle*PI/180)*b_radius;
float b_y = sin(b_angle*PI/180)*b_radius;

float c_radius = 80;
float c_angle = 0;
float c_x = cos(c_angle*PI/180)*c_radius;
float c_y = sin(c_angle*PI/180)*c_radius;


void draw() {
background(255);

// this is the first motion, just a line
a_angle = a_angle + 15;
float a_x = cos(a_angle*PI/180)*a_radius;
float a_y = sin(a_angle*PI/180)*a_radius;
strokeWeight(5);
line(350, 320, 350+a_x, 320+a_y);

// this is the second motion, line with a circle
b_angle = b_angle - 3;
float b_x = cos(b_angle*PI/180)*b_radius;
float b_y = sin(b_angle*PI/180)*b_radius;
strokeWeight(3);
line(150, 200, 150+b_x, 200+b_y);
ellipse(150+b_x, 200+b_y, 10, 10);

// this is the third motion, just a circle moving
c_angle = c_angle + 6;
float c_x = cos(c_angle*PI/180)*c_radius;
float c_y = sin(c_angle*PI/180)*c_radius;
fill(0);
ellipse(300+c_x, 100+c_y, 50, 50);

}
