
// Ben Norskov
// Code for Circle Bounce Homework
// 9/18/12
int num_of_circ = 300;
int[] circle_xs = new int[num_of_circ];
int[] circle_ys = new int[num_of_circ];//where the circle is onscreen
int circle_radius = 30; //how big is it?
int[] circle_x_speeds = new int[num_of_circ];
int[] circle_y_speeds = new int[num_of_circ];//how fast does it move?
 
void setup() {
  size(500, 400);
  for (int i=0; i< num_of_circ; i+=1){
    circle_xs[i]= random(width)
    circle_ys[i] =random(height)
     circle_x_speeds[i] = random(-8,8)
     circle_y_speeds[i] =random(-8,8)
};
void draw() {
  background(140, 40, 200); //our giant eraser in the sky
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
  //
  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON X
  //
  circle_x = circle_x + circle_x_speed; //this is what actually "moves" the circle, but only left or right
  if ((circle_x + circle_radius > width) || (circle_x - circle_radius < 0)) {  //move other way
  //if the circle hits the left side OR right side of the screen
  //(plus the radius, so the edge, not the middle, of the circle bounces off the screen)
    // the: || means OR
    circle_x_speed = circle_x_speed * -1;    //make positive speed negative, or vice versa
  };
  //
  //////  //////  //////  //////  //////  //////  //////  //////  MOVE ON Y
  //
  circle_y = circle_y + circle_y_speed;//this is what actually "moves" the circle, but only up or down
  if ((circle_y + circle_radius > height) || (circle_y - circle_radius < 0)) {
      //if the circle hits the top OR bottom of the screen
    circle_y_speed = circle_y_speed * -1;
    //circle_y_speed *= -1; //This line is shorthand for the above line
  }
};
