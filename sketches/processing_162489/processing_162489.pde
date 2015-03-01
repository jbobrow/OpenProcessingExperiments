
size (300, 200);
colorMode (RGB);
background (0);
smooth ();

  


float radius1 = 1.0;
for (int deg1 = 0; deg1 < 360 *6 ; deg1 += 11){
  float angle1 = radians (deg1);
  float x1 = 75 + (cos(angle1) * radius1);
  float y1 = 42 + (sin(angle1) * radius1);
  noStroke ();
  fill (205, 238, 242, 55);
  ellipse (x1, y1, 15, 17);
  radius1 = radius1 + 0.34;

}

float radiusa = 1.0;
for (int dega = 0; dega < 360 *6 ; dega += 11){
  pushMatrix ();
translate (50, 100);
  float anglea = radians (dega);
  float xa = 75 + (cos(anglea) * radiusa);
  float ya = 42 + (sin(anglea) * radiusa);
  noStroke ();
  fill (205, 238, 242, 55);
  ellipse (xa +100, ya, 15, 15 );
  radiusa = radiusa + 0.34;
popMatrix ();
float radiusaa = 1.0;
for (int degaa = 0; degaa < 360 *6 ; degaa += 11){
  float angleaa = radians (degaa);
  float xaa = 75 + (cos(angleaa) * radiusaa);
  float yaa = 42 + (sin(angleaa) * radiusaa);
  noStroke ();
  fill (205, 238, 242, 55);
  ellipse (xaa +100, yaa, 15, 15 );
  radiusaa = radiusaa + 0.34;
}

float radiusb = 1.0;
for (int degb = 0; degb < 360 *6 ; degb += 11){
  float angleb = radians (degb);
  float xb = 75 + (cos(angleb) * radiusb);
  float yb = 42 + (sin(angleb) * radiusb);
  noStroke ();
  fill (177, 235, 250, 55);
  ellipse (xb +50 , yb + 100, 6, 6);
  radiusb = radiusb + 0.34;
}


float radiusb1 = 1.0;
for (int degb1 = 0; degb1 < 360 *6 ; degb1 += 11){
  translate (50, -50);
  pushMatrix ();
  float angleb1 = radians (degb1);
  float xb1 = 75 + (cos(angleb1) * radiusb1);
  float yb1 = 42 + (sin(angleb1) * radiusb1);
  noStroke ();
  fill (177, 235, 250, 55);
  ellipse (xb1 +50 , yb1 + 100, 6, 6);
  radiusb1 = radiusb1 + 0.34;
popMatrix ();
float radiusb11 = 1.0;
for (int degb11 = 0; degb11 < 360 *6 ; degb11 += 11){
  float angleb11 = radians (degb11);
  float xb11 = 75 + (cos(angleb11) * radiusb11);
  float yb11 = 42 + (sin(angleb11) * radiusb11);
  noStroke ();
  fill (177, 235, 250, 55);
  ellipse (xb11 +50 , yb11 + 100, 6, 6);
  radiusb11 = radiusb11 + 0.34;
}
}
}




