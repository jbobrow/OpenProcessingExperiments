
//import java.utils.Threading;
//=========================var
float w, h, bigRadiusX, bigRadiusY, 
      smallRadius, 
      x1, y1, x2, y2, angle, 
      halfBigRadiusX, halfBigRadiusY, halfSmallRadius, speed;

//========================setup
void setup() {
  size(400, 400);
  frameRate(2);
  background(0);
  noStroke();
  //fill(255);
  smooth();

  w = x1 = x2 = width / 2;
  h = y1 = x2 = height / 2;
  
  bigRadiusX = 150;
  bigRadiusY = 100;
  smallRadius = 50;
  
  halfBigRadiusX = bigRadiusX / 2;
  halfBigRadiusY = bigRadiusY / 2;
  halfSmallRadius = smallRadius / 2;
  
  speed = 0.02;
  angle = 0.0;
}

//================================draw
void draw() {

  //big ball
  fill(255);
  ellipse(w - 80, h, bigRadiusX, bigRadiusY); //left
  ellipse(w + 80, h, bigRadiusX, bigRadiusY); //right
  
  //left small ball
  x1 = (w - 80) + (cos(angle) * (halfBigRadiusX - halfSmallRadius));
  y1 = (h) + (sin(angle) * (halfBigRadiusY - halfSmallRadius));
  
  fill(0);
  ellipse(x1, y1, smallRadius, smallRadius);
  
   
  // right small ball
  x2 = (w + 80) + (cos(angle) * (halfBigRadiusX - halfSmallRadius));
  y2 = (h) + (sin(angle) * (halfBigRadiusY - halfSmallRadius));
 
  fill(0);
  ellipse(x2, y2, smallRadius, smallRadius);
  
  //angle += speed;
  angle = random(360);

}
