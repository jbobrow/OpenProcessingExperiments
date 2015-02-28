
float circle_x = 50;
float circle_y = 50; //circle position
float circle_radius = 50; //how big. radius is half the diameter (width)
float circle_x1 = 650;
float circle_y1 = 50;
float circle_radius1 = 50;
float circle_x_speed = 5;
float circle_y_speed = 3; //moving independently on both axis
Boolean move_circle = false; //used for starting and stopping the circle
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
int show_after = 6500;

//laser
float angle = 0;
int distance = 100;
int number_of_elements = 44;
float increment_value = TWO_PI / number_of_elements;
int rect_w = 1;
int rect_h = 150;
float start_angle = 0 ;
float rotate_speed = 1;





  void setup() {
  size(700, 500);
  background(255);
  img1 = loadImage ("pyramid.gif");
  img2 = loadImage ("left_hand.gif");
  img3 = loadImage ("right_hand.gif");
  img4 = loadImage ("pyrimad2.gif");
  img5 = loadImage ("right_hand2.gif");
  img6 = loadImage ("left_hand2.gif");
}

void draw() {
  if (move_circle == false) {
    circle_x = circle_x + circle_x_speed;
    circle_y = circle_y + circle_y_speed;
    circle_x1 = circle_x1 - circle_x_speed;
    circle_y1 = circle_y1 + circle_y_speed;
  };



 //black circles
  strokeWeight(1);
  stroke(255,255,255,100);
  fill( 0,0,0,50 );
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
  stroke(255,255,255, 50 );
  fill(0,0,0, 50);
  ellipse(circle_x1, circle_y1, circle_radius1*2, circle_radius1*2);



  //pyramid circle
  fill( random(159),random(190),random(210), 250 );
  ellipse(335,390,50,50);

  //circle hands
  if(millis()>show_after){
   fill( random(159),random(190),random(210), 250 );
  ellipse(140,255,40,40);
  fill( random(159),random(190),random(210), 250 );
  ellipse(565,255,40,40);
  }

  //images pt1
  image(img1, 242, 250, 200, 200);
  image(img2,10, 100, 200,443.8);
  image(img3,500,100, 200, 443.8);
  
  
  
  
  //WHEN MOUSE IS CLICKED IN CERTAIN AREAS
  
  
//LEFT PRESSED
if(mousePressed == true) //&& if(mouseX, mouseY >)
{


  //eye
  background(random(159), random(190), random(210));
  image(img6, 1,1);
  angle = radians(start_angle);

  for (int i =6; i < number_of_elements; i++) {
    fill(degrees(abs(angle))%360, 300, 100);
    rect(350 + cos(angle) * distance, 120 + sin(angle) * distance,
rect_w, rect_h);
    angle += increment_value;
  }
  start_angle += rotate_speed;

  }
  
 
 
 
 //CENTER PRESS
if(mousePressed == true) //&& if(mouseX, mouseY >
{


  //eye
  background(random(159), random(190), random(210));
  image(img4, 1,1);
  angle = radians(start_angle);

  for (int i =6; i < number_of_elements; i++) {
    fill(degrees(abs(angle))%360, 300, 100);
    rect(350 + cos(angle) * distance, 97 + sin(angle) * distance,
rect_w, rect_h);
    angle += increment_value;
  }
  start_angle += rotate_speed;

  }
  
  
  

//RIGHT PRESS
if(mousePressed == true) //&& if(mouseX, mouseY > (
{


  //eye
  background(random(159), random(190), random(210));
  image(img5, 1,1);
  angle = radians(start_angle);

  for (int i =6; i < number_of_elements; i++) {
    fill(degrees(abs(angle))%360, 300, 100);
    rect(350 + cos(angle) * distance, 120 + sin(angle) * distance,
rect_w, rect_h);
    angle += increment_value;
  }
  start_angle += rotate_speed;

  }







  //movement of circles
  if ( (circle_x + circle_radius > width) || (circle_x - circle_radius < 0) ) {
    circle_x_speed = -circle_x_speed;

    if (circle_x - circle_radius < 0) {
      circle_x = circle_radius;
    };
    if (circle_x + circle_radius > width) {
      circle_x = width-circle_radius;
    };
  };
  if ( (circle_y + circle_radius > height) || (circle_y -
circle_radius < 0) ) {
    circle_y_speed = -circle_y_speed;

    if (circle_y - circle_radius < 0) { //if off the top of the screen
      circle_y = circle_radius; //move to top edge of screen + radius
    };
    if (circle_y + circle_radius > height) { //if off the bottom of the screen.
      circle_y = height-circle_radius;//move to bottom edge of screen
    };
  };

};

