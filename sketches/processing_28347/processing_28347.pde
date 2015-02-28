
//Jason Fitzgerald
//math programming and art
//spring 2011
//Basic trig
// I missed this class, so I'm rebuilding stuff I'm dissecting by
//checking examples from open processing and the textbook.
//my buddy Tommy is helping me out on this too, since this is actual math and It's making my brain die.

int theta_degrees; //180 degrees
float hypotenuse; //...is te longest side of a triangle.
float a_x;
float a_y;  // it took me a second to remember to assign a, b, and c as points on the triangle.
//sometimes it's the simplest thing that eludes me.
void setup() {
  size(350, 350);
  stroke(0);
  hypotenuse = 400;
  theta_degrees = 45;
  a_x = 25; //where the first points of the triangle originate
  a_y = height-25; //where the first points of the triangle originate
}



void draw() {
  float theta_radians = radians(theta_degrees);
  float opposite = hypotenuse * sin(theta_radians);
  float adjacent = hypotenuse * cos(theta_radians);


  float b_x = a_x + adjacent;
  float b_y = a_y - opposite;
  float c_x = b_x;
  float c_y = a_y;


  background(0);
  fill(255);
  triangle(a_x, a_y, b_x, b_y, c_x, c_y);
}


