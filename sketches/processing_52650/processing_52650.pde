
int t= 0;

void setup () {
  size (700, 700);
  background (255);


  for (int i = 100;i <=300; i+=50) {
    fill (random (255), random (255), random (255));
    drawFourCircles (i, i);
  }

  pushMatrix();
  translate (width/2, height/2);

  fill (random (255), random (255), random (255));

  float theta3 = 0.0;
  float radius3 = 200;
  for ( int i=0; i <12; i++) {
    pushMatrix ();
    translate (cos(theta3)*radius3, sin(theta3)*radius3); 
    ellipse (0, 0, 100, 100);
    popMatrix();
    theta3+= TWO_PI/12;
  }

  fill (random (255), random (255), random (255));
  float theta = 0.0;
  float radius = 250;
  for ( int i=0; i <12; i++) {
    pushMatrix ();
    translate (cos(theta)*radius, sin(theta)*radius); 
    ellipse (0, 0, 100, 100);
    popMatrix();
    theta+= TWO_PI/12;
  }

  fill (random (255), random (255), random (255));
  float theta2 = 0.0;
  float radius2 = 300;
  for ( int i=0; i <15; i++) {
    pushMatrix ();
    translate (cos(theta2)*radius2, sin(theta2)*radius2); 
    ellipse (0, 0, 100, 100);
    popMatrix();
    theta2+= TWO_PI/12;
  }
  popMatrix();

  while (t < 40) {
    fill (random (255), random (255), random (255));
    drawFourCircles(200 - t*5, t*2); 
    t++;
  }


  fill (random (255), random (255), random (255));
  drawFourCircles(50, 20);



  int x = 0;
  while (x< 45) {
    fill (random (255), random (255), random (255));
    drawFourRect (100 + x*4, x*3);
    x++;
  }
}


