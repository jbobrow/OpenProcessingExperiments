
// This sketch shows how to fit a circle inside an angle, which can be used
// to round-out sharp corners
// June 24, 2011 using Processing 1.5.1
// Paul P Miller

void setup() {
  size(300, 300);
}

void draw() {
  background(127, 127, 127);
  
  // Vector A goes from the origin to (50, 0)
  // (the origin has pixel coordinates (150, 150))
  float Ax = 50, Ay = 0;
  
  // Vector B goes from the origin to the mouse pointer
  float Bx = mouseX - 150, By = 150 - mouseY;
  
  // Dot product of A and B
  float AdotB = Ax*Bx + Ay*By;
  
  // Magnatude of each vector
  float Alen = 50;
  float Blen = sqrt(Bx*Bx + By*By);
  
  // Interior angle made by A and B, using the definition of the dot product
  float Theta = acos(AdotB/(Alen*Blen));
  
  float ThetaSupplement = PI - Theta;
  
  // Radius of the circle
  float _Radius = Alen / tan(ThetaSupplement / 2.0);
  
  // Z-component of A cross B; if positive, Theta is a clockwise angle, and
  // the circle will be drawn above vector A; if negative, Theta is a
  // counter-clockwise angle and the circle will be drawn below vector A
  float AcrossB_z = Ax*By - Ay*Bx;
  
  // Draw the vectors
  line(150,150, 150+Ax,150-Ay);
  line(150,150, 150+Bx,150-By);
  
  // Draw the circle
  if(AcrossB_z > 0) {
    ellipse(200,150-_Radius,_Radius*2.0,_Radius*2.0);
  } else {
    ellipse(200,150+_Radius,_Radius*2.0,_Radius*2.0);
  }
}

