
size (400, 400);
colorMode (RGB);
smooth();
rectMode (CENTER);
//Grid setup
for (int P = 0; P <= width; P+=20) {        //Horizontal 
  for (int J = 0; J <= height; J+=20) {     //Vertical
    stroke (0, 150);
    fill (random (width));                  // fill with random gray scale
    rect (P, J, 20, 20);                    // grid unit 20 by 20 rectangles
  }
}

          // Quarter frame order following  
          // 1,2
          // 4,3

pushMatrix();
// Setup for the 1st quarter 
for (int A = 0; A <= width/2; A+=20) {
  for (int B = 0; B <= height/2; B+=20) {
    ellipseMode (CENTER);
    noStroke();
    //stroke (random (width));
    fill (random (width));
    ellipse (A, B, 15, 15);
  }
}  
// Setup for the 2nd quarter 
translate (width/2+20, 0);                    //move the origin on the 2nd quarter 
for (int  C= 0; C <= width/2; C+=20) {
  for (int D = 0; D <= height/2; D+=20) {
    fill (random (width));
    rect (C, D, 15, 15);
  }
}
// Setup for the 3rd quarter 
translate (0, height/2+20);                   //move the origin on the 3rd quarter
for (int  E= 0; E <= width/2; E+=20) {
  for (int F = 0; F <= height/2; F+=20) {
    fill (random (width));
    ellipse (E, F, 10, 15);
  }
}
// Setup for the 4th quarter 
translate (-height/2-20, 0);                  //move the origin on the 4th quarter 
for (int  G= 0; G <= width/2; G+=20) {
  for (int H = 0; H <= height/2; H+=20) {
    fill (random (width));
    rect (G, H, 10, 15);
  }
}
popMatrix();


