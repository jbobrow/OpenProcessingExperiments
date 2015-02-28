
int circle_diameter = 200;
float my_float = 2.3;
boolean overCircle = false;
void setup() {
  size(500,400);
};
void draw() {
  background(200);
  fill(25,203,4);
//i want to change fill color when my mouse is over the circle
//if my mouse is over the circle, change the fill color.
//if (mouseX and mouseY) are inside the cirlce, change the fill color
//if dist( mousePos, circle_center)<circle radius)
if(dist(width/2, height/2, mouseX, mouseY) < circle_diameter/2) {
  //mouse inside of circle
  fill(20,30,200);
  overCircle = true;
} else {
  //outside of circle
  overCircle=false;
}
if ((mousePressed == true) && (overCircle == true)) {
  fill(255,0,0);
}
 // println( dist(width/2, height/2, circle_diameter, circle_diameter) );
  ellipse(width/2, height/2, 100, 100);
  
  if (overCircle == false) {
    //only draw line if mouse isn't over circle
    //line(width/2, height/2, mouseX, mouseY);
  }
}


