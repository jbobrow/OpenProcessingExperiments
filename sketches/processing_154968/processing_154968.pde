
float a, b, Xa, Ya, w, w1, m, c, Xb1, Yb1, Xb2, Yb2,theta;

void setup(){
  size(700,700);
  a = 300;
  b = 200;
  background(255);
}

void draw (){
  background(255);
  // keep origin at middle of screen
  translate(width/2, height/2);
  noFill();
  
  //draw x-axis & y-axis
  stroke(0);
  strokeWeight(1);
  line(0, -height/2, 0, height/2);
  line(-width/2, 0, width/2, 0);
  
  //draw ellipse major axis 'a' and minor axis 'b'
  stroke(0);
  strokeWeight(1);
  ellipse(0, 0, 2 * a, 2 * b);
  
  //set your angle to y-axis (i've used w as variable) in radians
  theta = random(0, 2 * PI);          // PI / 12 radians = 15 degrees 
  w =   PI / 2 + theta ; //PI/2 moves angle round to being from the Y-axis rather than the default x-axis

  //choose an x value Xa = some vale less than 'a'
  Xa = random(2 * a) - a;
  //Xa = 250;
  // top or bottom of ellipse at random
  int top = (int)random(2);
  if (top == 0) {
    Ya = -b * sqrt(1 - ((Xa * Xa) / (a * a)));
  } else {
    Ya =  b * sqrt(1 - ((Xa * Xa) / (a * a)));
  } 
  // Draw the point in yellow
  strokeWeight(4);
  stroke(255,255,0);
  point(Xa,Ya);
  
  // Solve the straight line equation y = mx + C at the point (Xa,Ya) to get C
  // given that the angle to the y-axis is w
  m = -tan(w);
  c = Ya - (Xa * m);
  // so the point (0,c) is on the line
  strokeWeight(1);
  stroke(0,255,0);
  //line(Xa,Ya,0,c);
  
  //now the "MAGIC" to find the other point where the line intersects the ellipse, (they already intersect at (Xa,Ya)
  // you need to solve a quadratic of the form A*X^2 + B*X + C = 0 
  // created by obtaining from the line formula Y = mx + c
  // and substituting this for the y in the formula of the ellipse gives
  // ((b * b)/(a * a) + (m * m)) * (X * X)  + (2 * m * c) * X + ((c * c) - (b * b)) = 0
  float A, B, C, root1, root2;
  A = ((b * b) / (a * a)) + (m * m);
  B = 2 * m * c;
  C = (c * c) - (b * b);

  // has answers X = -B + sqrt((B * B) - (4 * A * C)) )/ (2 * A)
  // and         X = -B - sqrt((B * B) - (4 * A * C)) )/ (2 * A)
  root1 = (-B + sqrt((B * B) - (4 * A * C)) )/ (2 * A);
  root2 = (-B - sqrt((B * B) - (4 * A * C)) )/ (2 * A);

  Xb1 =root1;
  Yb1 = -tan(w) * root1 + Ya - Xa * -tan(w);
  strokeWeight(2);
  stroke(0,0,255);
  //point( Xb1, Yb1);
  line(Xa, Ya, Xb1, Yb1);
  
  Xb2 =root2;
  Yb2 = -tan(w) * root2 + Ya - Xa * -tan(w);
  strokeWeight(2);
  stroke(255,0,0);
  //point( Xb2, Yb2);
  line(Xa, Ya, Xb2, Yb2);
  //debug line to see the values generated
  //println( str(Xa) + "   " + str(Ya) + "   " + str(Xb1) + "   " + str(Yb1) + "   " + str(Xb2) + "   " + str(Yb2) ) ;
  
  //a comparison of the integer values of these two points will Xa,Ya will tell you which is your Xa,Ya and which is your Xb,Yb
}


