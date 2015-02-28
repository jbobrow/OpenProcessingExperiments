
//Sept. 11, 2012
//shingeru ban
//ro & ad architecture
//Classwork
//Gabby Garuz
//Homework: make button that does something.

int circle_diameter=200;
float my_float=2.3;
boolean overCircle = false;
void setup() {
  size (500, 400);
};

void draw() {
  background(200);
  fill(230, 50, 100);
  //I want to change fill color when my mouse is over the circle
  //If my mouse is over the circle, change fill color
  //If (mouseX and mouseY) are inside the circle, CtFC
  //If dist(mousePos, circle_center)<circle radius)
  if ( dist(width/2, height/2, mouseX, mouseY) < circle_diameter/2) {
    fill(20, 30, 200);
    overCircle = true;
  } 
  else {
    overCircle = false;
  }
  if ((mousePressed == true) && (overCircle == true)) {
    fill (255, 0, 0);
  }
  println( dist(width/2, height/2, mouseX, mouseY));
  line(width/2, height/2, mouseX, mouseY);
  ellipse(width*.5, height/2, circle_diameter, circle_diameter);

  if (overCircle == false) {
    //only draw the line if mouse isn't over circle
    line(width/2, height/2, mouseX, mouseY);
  }
}



/*int circle_radius = 50;
 int circle_x = 250;
 int circle_speed = 100;
 void setup() {
 size(500, 400);
 
 };
 void draw() {
 background(30);
 ellipse(circle_x, 20, circle_radius, circle_radius);
 circle_x = circle_x + circle_speed;
 if (circle_x <= 0)
 circle_speed = circle_speed *-1;
 if (circle_x >= 500) {
 circle_speed = circle_speed *-1;
 } */

