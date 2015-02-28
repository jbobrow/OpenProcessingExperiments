
//ben norskov
//creative computing — Button code
//9-11-12
int circle_xx = 210;
int circle_yy = 300;
int circle_radius = 30;
int circle_x_speed = 5;
int circle_y_speed = 5;
int circle_x;
int circle_y; //where is the circle? x and y position
int circle_diameter = 200; //how wide and tall the circle is.
boolean overCircle = false; //if this is true, the mouse should be inside the circle.
 
//anything in setup runs once. It "sets up" the sketch.
void setup() {
  size(500, 500);
  circle_x = width/2;
  circle_y = height/2; //put the circle in the middle of the screen. You really can put it anywhere though.
};
 
//anything in draw runs continuously.
void draw() {
  background(200);  //clear the background. Take this out to draw on top of your previous drawings
 
  //  println( dist(circle_x, circle_y, mouseX, mouseY) );
  // uncomment the line above to see the actual distance your mouse is from the center of the circle
  if ( dist(circle_x, circle_y, mouseX, mouseY) < circle_diameter/2 ) {
    //if the distance from the mouse to the center of the circle < [is less than] the radius [half diameter] of that circle
    //then the mouse is inside of the circle so
    fill(20, 30, 200); //change the fill
    overCircle = true; //change overCircle to true. We can use overCircle in other parts of the sketch to do cool stuff
  } else {
    //the distance from the center of the circle to the mouse is more than the radius of the circle
    //so the mouse is outside of the circle
    overCircle=false;
    fill(230, 50, 100); //this is the default fill
  };//with an if else statement, you can only pick one. So the mouse is either over the circle or not, it can't be both
 
  if ((mousePressed == true) && (overCircle == true)) {
    //mousePressed is a Boolean as well. It can only be true or false, similar to overCircle.
    //if the mouse is pressed AND overCircle is true
    //then change the fill
    fill(255, 0, 0);
     ellipse(circle_xx, circle_yy, circle_radius*2, circle_radius*2);
//    for X
circle_xx = circle_xx + circle_x_speed;
 if ((circle_xx + circle_radius > width) || (circle_xx - circle_radius < 0)) {
    // || means OR
    //make speed negative
    circle_x_speed = circle_x_speed * -1;
  };
  
//  for y
circle_yy = circle_yy + circle_y_speed;
   if ((circle_yy + circle_radius > height) || (circle_yy - circle_radius < 0)) {
      circle_y_speed = circle_y_speed * -1;
    }
  
  };
  //draw a circle!
  ellipse(circle_x, circle_y, circle_diameter, circle_diameter);
 
  if (overCircle == false) {
    //only draw line if mouse isn't over circle
    line(width/2, height/2, mouseX, mouseY);
  };
};


