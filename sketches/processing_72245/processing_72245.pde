
//Zach Hurley
//HW week 5
// 09/27/12


// where the circle starts at, radius, and how fast it will go on each axis
float circle_x = 250;
float circle_y = 250;
float circle_radius = 40;
float circle_x_speed = 5 ;
float circle_y_speed = 7 ;
Boolean move_circle = false;
 
void setup() {
  size(500, 500);
  background(30,46,54);
  
}
 
void draw() {
  fill(57,87,103);
stroke(random(255), random(255), random(255));
  ellipse(250,250,200,200);
  fill(72,114,137);
  ellipse(250,50,100,100);
  ellipse(250,450,100,100);
   //do placement with screen
  ellipse(width/2,height/2,100,100);
  if (mousePressed == true) { // if you press the mouse
    if (move_circle == true) { // moving object
      move_circle = false; // it will stop when mouse is pressed, the movement is false
    } else {               // BUT
      move_circle = true; // if the circle is not moving and you press mouse, it will begin to move
  };
  fill(150,178,193);
  ellipse(mouseY,mouseX/2,40,40);
  ellipse(mouseY/2,mouseX,20,20);
  fill(250,250,250);
  ellipse(mouseY,mouseX/2,20,20);
  ellipse(mouseY/2,mouseX,10,10);
  };
  if (move_circle == true) {
    circle_x = circle_x + circle_x_speed;
    circle_y = circle_y + circle_y_speed;
  };
  fill(random(255), random(255), random(255));
  stroke(random(255), random(255), random(255));
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
   
  if ( (circle_x + circle_radius > width) || (circle_x - circle_radius < 0) ) {
    circle_x_speed = circle_x_speed*-1;
     
    if (circle_x - circle_radius < 0) {
      circle_x = circle_radius;
    };
    if (circle_x + circle_radius > width) {
      circle_x = width-circle_radius;
    };
  };
   
  if ( (circle_y + circle_radius > height) || (circle_y - circle_radius < 0) ) {
    circle_y_speed = -circle_y_speed;
 
    if (circle_y - circle_radius < 0) {
      circle_y = circle_radius;
    };
    if (circle_y + circle_radius > height) {
      circle_y = height-circle_radius;
    };
  };
};


