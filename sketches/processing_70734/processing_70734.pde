
//Ji Hyun Kim
// September 17, 2012
// Creative Computing
//Button?

int circle_x;
int circle_y;
int circle_diameter = 50;
boolean overCircle = false;

void setup() {

size(500,500);

circle_x = width/2;
circle_y = height/2;

};

void draw() {
background(200);

if (dist(circle_x, circle_y, mouseX, mouseY) < circle_diameter/2) {
  fill(200);
  overCircle= true;
  
}else {
  overCircle =false;
  fill(100);

};
if ((mousePressed == true) && (overCircle==true)) {
  background(100);
circle_diameter ++;
 
};
noStroke();
ellipse(circle_x, circle_y, circle_diameter, circle_diameter);

};
