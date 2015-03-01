
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

translate (50, 100);
float radiusa = 1.0;
for (int dega = 0; dega < 360 *6 ; dega += 11){
  float anglea = radians (dega);
  float xa = 75 + (cos(anglea) * radiusa);
  float ya = 42 + (sin(anglea) * radiusa);
  noStroke ();
  fill (205, 238, 242, 55);
  ellipse (xa +100, ya, 15, 15 );
  radiusa = radiusa + 0.34;

}

translate (-50, -100);
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

translate (50, -50);
float radiusb1 = 1.0;
for (int degb1 = 0; degb1 < 360 *6 ; degb1 += 11){
  float angleb1 = radians (degb1);
  float xb1 = 75 + (cos(angleb1) * radiusb1);
  float yb1 = 42 + (sin(angleb1) * radiusb1);
  noStroke ();
  fill (177, 235, 250, 55);
  ellipse (xb1 +50 , yb1 + 100, 6, 6);
  radiusb1 = radiusb1 + 0.34;


}




