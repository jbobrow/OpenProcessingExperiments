
float x, y, rad;

void setup()
{
  size(500, 500);
  ellipseMode(CENTER);
  smooth();
  strokeWeight(3);
}

void draw()
{
  background(100);
  rad = 200;
  x = width/2;
  y = width/2;
  translate(mouseX, mouseY);
  rotate((mouseX/TWO_PI/5));
  //body
  fill(0);
  arc(0, 0, rad, rad, 0, PI/2);
  fill(255, 0, 0);
  arc(0, 0, rad, rad, PI/2, PI);
  fill(0);
  arc(0, 0, rad, rad, PI, (3*PI)/2);
  fill(255, 0, 0);
  arc(0, 0, rad, rad, (3*PI)/2, 2*PI);
  //head
  fill(255, 255, 0);
  ellipse(0, -(2*rad)/3, rad/2, rad/2);
  //eyes & mouth
  fill(0);  
  ellipse(-20, -rad/2-40, rad/15, rad/10);
  ellipse(20, -rad/2-40, rad/15, rad/10);
  line(-15, -rad/2-20, 15, -rad/2-20);
  //left hand
  fill(255, 255, 0);
  ellipse(-rad/2, -rad/3, rad/3, rad/3);
  //right hand
  fill(255, 0, 0);
  ellipse(rad/2, -rad/3, rad/3, rad/3);

  if (mousePressed && (mouseButton == RIGHT))
  {
    pushStyle();
    fill(255, 0, 0);
    strokeWeight(5);
    ellipse(rad/2, -rad/3, 2*(rad/3), 2*(rad/3));
    popStyle();
  }

  if (mousePressed && (mouseButton == LEFT))
  {
    pushStyle();
    fill(255, 255, 0);
    strokeWeight(5);
    ellipse(-rad/2, -rad/3, 2*(rad/3), 2*(rad/3));
    popStyle();
  }


}





