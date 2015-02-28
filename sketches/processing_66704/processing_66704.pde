
//=========================var
float w, h, bigRadius, 
      smallRadius, 
      x1, y1, x2, y2, angle, 
      halfBigRadius, halfSmallRadius, speed;

//========================setup
void setup() {
  size(400, 400);
  //frameRate(12);
  background(0);
  noStroke();
  //fill(255);
  smooth();

  w = x1 = x2 = width / 2;
  h = y1 = x2 = height / 2;
  
  bigRadius = 100;
  smallRadius = 50;
  
  halfBigRadius = bigRadius / 2;
  halfSmallRadius = smallRadius / 2;
  
  speed = 0.02;
  angle = 0.0;
}

//================================draw
void draw() {

  //big ball
  fill(255);
  ellipse(w - 60, h, bigRadius, bigRadius); //left
  ellipse(w + 60, h, bigRadius, bigRadius); //right
  
  //left small ball
  x1 = (w - 60) + (cos(angle) * (halfBigRadius - halfSmallRadius));
  y1 = (h) + (sin(angle) * (halfBigRadius - halfSmallRadius));
  
  fill(0);
  ellipse(x1, y1, smallRadius, smallRadius);
  
   
  // right small ball
  x2 = (w + 60) + (cos(angle) * (halfBigRadius - halfSmallRadius));
  y2 = (h) + (sin(angle) * (halfBigRadius - halfSmallRadius));
 
  fill(0);
  ellipse(x2, y2, smallRadius, smallRadius);
  
  angle += speed;

}
