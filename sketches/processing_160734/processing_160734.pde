
float a =45;
float b =45;
float c =180;
float e =-45;
float f =-45;
int ds = 3;
float diaSmall = 21;
void setup() {
  size (500, 500);
}
void draw() { 
 diaSmall = mouseX/3+21;
  noStroke();
  fill (0, 8);
  rect (0, 0, width, height);
  stroke (254, 43, 42, 80);
  fill (255, 43, 42, 80);
  for (int s=0; s<2; s++) {
    pushMatrix();
    translate(250, 160+180*s);
    rotate(radians(e));
    ellipse (diaSmall, diaSmall, ds, ds);
    rotate(radians(c));
    ellipse (diaSmall, diaSmall, ds, ds);    
    popMatrix();
    pushMatrix();
    translate(250, 160+180*s);
    rotate(radians(f));
    ellipse (diaSmall, diaSmall, ds, ds);
    rotate(radians(c));
    ellipse (diaSmall, diaSmall, ds, ds);
    popMatrix();
  }
  fill (255, 255, 0, 100); 
  stroke (255, 255, 0, 100); 
  for (int s=0; s<2; s++) {
    for (int i=0; i<2; i++) {
      pushMatrix();
      translate(220+60*i, 190+120*s);
      rotate(radians(a));
      ellipse (diaSmall, diaSmall, ds, ds);
      rotate(radians(c));
      ellipse (diaSmall, diaSmall, ds, ds);    
      popMatrix();
      pushMatrix();
      translate(220+60*i, 190+120*s);
      rotate(radians(b));
      ellipse (diaSmall, diaSmall, ds, ds);
      rotate(radians(c));
      ellipse (diaSmall, diaSmall, ds, ds);
      popMatrix();
    }
  }
  fill (255, 0, 255, 100); 
  stroke (255, 0, 255, 100); 
  for (int i=0; i<4; i++) {
    pushMatrix();
    translate(160+60*i, 250);
    rotate(radians(a));
    ellipse (diaSmall, diaSmall, ds, ds);
    rotate(radians(c));
    ellipse (diaSmall, diaSmall, ds, ds);    
    popMatrix();
    pushMatrix();
    translate(160+60*i, 250);
    rotate(radians(b));
    ellipse (diaSmall, diaSmall, ds, ds);
    rotate(radians(c));
    ellipse (diaSmall, diaSmall, ds, ds);
    popMatrix();
  } 
  fill (0, 255, 0, 100); 
  stroke (0, 255, 0, 100); 
  for (int s=0; s<2; s++) {
    for (int i=0; i<3; i++) {
      pushMatrix();
      translate(190+60*i, 220+60*s);
      rotate(radians(e));
      ellipse (diaSmall, diaSmall, ds, ds);
      rotate(radians(c));
      ellipse (diaSmall, diaSmall, ds, ds); 
      popMatrix();
      pushMatrix();
      translate(190+60*i, 220+60*s);
      rotate(radians(f));
      ellipse (diaSmall, diaSmall, ds, ds);
      rotate(radians(c));
      ellipse (diaSmall, diaSmall, ds, ds);
      popMatrix();
    }
  }
  fill (0, 0, 255, 100); 
  stroke (0, 0, 255, 100);
  for (int i=0; i<2; i++) {
    pushMatrix();
    translate(190+120*i, 250);
    rotate(radians(a));
    ellipse (diaSmall*2, diaSmall*2, ds, ds);
    rotate(radians(c));
    ellipse (diaSmall*2, diaSmall*2, ds, ds);    
    popMatrix();
    pushMatrix();
    translate(190+120*i, 250);
    rotate(radians(b));
    ellipse (diaSmall*2, diaSmall*2, ds, ds);
    rotate(radians(c));
    ellipse (diaSmall*2, diaSmall*2, ds, ds);
    popMatrix();
  }
  for (int s=0; s<2; s++) {
    pushMatrix();
    translate(250, 190+120*s);
    rotate(radians(e));
    ellipse (diaSmall*2, diaSmall*2, ds, ds);
    rotate(radians(c));
    ellipse (diaSmall*2, diaSmall*2, ds, ds);    
    popMatrix();
    pushMatrix();
    translate(250, 190+120*s);
    rotate(radians(f));
    ellipse (diaSmall*2, diaSmall*2, ds, ds);
    rotate(radians(c));
    ellipse (diaSmall*2, diaSmall*2, ds, ds);
    popMatrix();
  }
  a = a+0.3;
  b = b-0.3;
  e = e+0.3;
  f = f-0.3;
}
