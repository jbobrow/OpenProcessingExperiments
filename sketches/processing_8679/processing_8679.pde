

/*
Many thanks to: http://www.antigrain.com/research/adaptive_bezier/index.html
*/

float x1, y1, x2, y2, x3, y3, x4, y4, t;

void setup() {
  size(200,200);
  
  t = 0;
  
  x1 = 10;
  y1 = 180;
  
  x2 = 50;
  y2 = 5;
  
  x3 = 100;
  y3 = 10;
  
  x4 = 180;
  y4 = 180;
  
  noFill();
  
}

void draw() {
  background(255.0);
  stroke(0.0);
  strokeWeight(1.0);
  beginShape();
  vertex(x1, y1);
  bezierVertex(x2, y2, x3, y3, x4, y4);
  endShape();
  
  //find any point on the curve:
  t+=0.01;
  if(t>1) { t=0; }
  
  double mu, mum1,mum13,mu3;
  
  mu = t;
   mum1 = 1 - mu;
   mum13 = mum1 * mum1 * mum1;
   mu3 = mu * mu * mu;
   
  float xn = (float) ( mum13*x1 + 3*mu*mum1*mum1*x2 + 3*mu*mu*mum1*x3 + mu3*x4 );
  float yn = (float) ( mum13*y1 + 3*mu*mum1*mum1*y2 + 3*mu*mu*mum1*y3 + mu3*y4 );
  
  stroke(255.0, 0.0, 0.0);
  strokeWeight(5.0);
  point(xn, yn);

  stroke(0.0, 100.0);
  strokeWeight(1.0);

  line(x1, y1, x2, y2);
  line(x2, y2, x3, y3);
  line(x3, y3, x4, y4);
  
  //intersecion
  float x12 = x1+(x2-x1)*t;
  float y12 = y1+(y2-y1)*t;
  float x23 = x2+(x3-x2)*t;
  float y23 = y2+(y3-y2)*t;
  float x34 = x3+(x4-x3)*t;
  float y34 = y3+(y4-y3)*t;
  line(x12, y12, x23, y23);
  line(x23, y23, x34, y34);
  
  float x123 = x12+(x23-x12)*t;
  float y123 = y12+(y23-y12)*t;
  float x234 = x23+(x34-x23)*t;
  float y234 = y23+(y34-y23)*t;
  line(x123, y123, x234, y234);
  
  stroke(255.0, 0.0, 0.0);
  strokeWeight(2.0);
  point(x123,y123);
  point(x234,y234);
  
  stroke(255.0, 0.0, 0.0, 100.0);
  strokeWeight(3.0);
  
  beginShape();
  vertex(x1, y1);
  bezierVertex(x12, y12, x123, y123, xn, yn);
  endShape();
  
  stroke(0.0, 255.0, 0.0, 100.0);
  
  beginShape();
  vertex(x4, y4);
  bezierVertex(x34, y34, x234, y234, xn, yn);
  endShape(); 
  
}

