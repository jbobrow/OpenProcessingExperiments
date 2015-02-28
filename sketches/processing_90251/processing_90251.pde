
//rollover state on a circle
//ben norskov
//Feb 19, 2013
float circleX;
float circleY;

void setup() {
  size(400, 400);
  circleX = width/2;
  circleY = height/2;//you have to assign variables here because the
  //sketch doesn't have a size until after the size() function is called
}
void draw() {
  //comment back in to see the distance relationship
  //println( dist(circleX, circleY, mouseX, mouseY) + " radius:" + 100);
  //rollover state
  if (dist(circleX, circleY, mouseX, mouseY) < 100) {
    //if the mouse is less than the radius of the circle
    if (mousePressed == true) {
      //mousePressed is either false or true. true means it's pressed down
      fill(0, 0, 242);
    } else {
      fill(40, 160, 20);
    }
  } else {
    //if the mouse is outside the circle
    fill(200, 30, 169);
  }
  ellipse(circleX, circleY, 200, 200);
}
