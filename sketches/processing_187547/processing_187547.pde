
//From Sol Lewitt's Wall Drawing #305:
//The Eighth point is located halfway between the two points 
//where an arc with its center at the first point and with a radius equal to the distance between the first and the seventh points 
//would cross a line from the upper right corner 
//to a point halfway between the midpoint of the bottom side and the lower right corner.

void setup() {
  size(600,600);
  noLoop();
}

void draw() {
  background(100);
  stroke(255);
  float firstx = random(600);
  float firsty = random(600);
  point(firstx,firsty);
  
  float seventhx = random(600);
  float seventhy = random(600);
  point(seventhx,seventhy);
  
  float radius=sqrt(sq(seventhx-firstx)+sq(seventhy-firsty));
  noFill();
  arc(firstx,firsty,radius,radius,0,PI);
  stroke(200);
  line(150,600,600,600);
}


