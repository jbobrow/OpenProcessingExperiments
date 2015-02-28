
void setup () {
  size (500, 500);
  smooth ();
}

void draw () {
  background (0);
  noStroke ();
  fill (255); 

  //head
  float d1= map (mouseX, 0, width, 320, 206);
  float d2= map (mouseX, 0, width, 320, 444);
  ellipse (height/2, height/2, d1, d2);

  //hair
  pushMatrix ();
  stroke (255);
  float hair_x1= map (mouseX, 0, width, 318, 322);
  float hair_y1= map (mouseX, 0, width, 110, 110);
  float hair_x2= map (mouseX, 0, width, 325, 425);
  float hair_y2= map (mouseX, 0, width, 92, 20);

  float hair2_x1= map (mouseX, 0, width, 318, 322);
  float hair2_y1= map (mouseX, 0, width, 110, 110);
  float hair2_x2= map (mouseX, 0, width, 340, 415);
  float hair2_y2= map (mouseX, 0, width, 100, 76);
  float hair_thickness= map (mouseX, 0, width, 5, 4);
  strokeWeight (hair_thickness);

  line (hair_x1, hair_y1, hair_x2, hair_y2);
  line (hair2_x1, hair2_y1, hair2_x2, hair2_y2);

  popMatrix ();


  //eyebrow
  fill (0);
  float brow_xpos1= map (mouseX, 0, width, 191, 170);
  float brow_xpos2= map (mouseX, 0, width, 209, 234); 
  float brow_ypos1= map (mouseX, 0, width, 172, 158);
  float brow_ypos2= map (mouseX, 0, width, 172, 77);
  float brow_thickness= map (mouseX, 0, width, 2, 8);

  float brow2_xpos1= map (mouseX, 0, width, 281, 277);
  float brow2_xpos2= map (mouseX, 0, width, 298, 329); 
  float brow2_ypos1= map (mouseX, 0, width, 172, 73);
  float brow2_ypos2= map (mouseX, 0, width, 172, 157);

  stroke (0);
  strokeWeight (brow_thickness);

  line (brow_xpos1, brow_ypos1, brow_xpos2, brow_ypos2);
  line (brow2_xpos1, brow2_ypos1, brow2_xpos2, brow2_ypos2);

  //eyes
  noFill ();
  stroke (0);
  float eye_thicken= map (mouseX, 0, width, 5, 2);
  strokeWeight (eye_thicken);
  float eye1= map (mouseX, 0, width, 14, 25);
  float eye2= map (mouseX, 0, width, 14, 95);
  ellipse (200, 191, eye1, eye2);
  ellipse (290, 191, eye1, eye2);


  //mouth
  fill (0);
  float m1= map (mouseX, 0, width, 9, 66);
  float m2= map (mouseX, 0, width, 9, 212);
  ellipse (248, 335, m1, m2);

  //hands
  pushMatrix ();
  fill (255);
  translate(-60, 40);
  float h1= map (mouseX, 0, width, 86, 71);
  float h2= map (mouseX, 0, width, 86, 170);
  float ypos= map (mouseX, 0, width, 390, 370);
  float xpos= map (mouseX, 0, width, 90, 100);

  rotate(radians (-10));
  ellipse (xpos, ypos, h1, h2);
  popMatrix ();

  translate(60, -40);
  float h3= map (mouseX, 0, width, 86, 71);
  float h4= map (mouseX, 0, width, 86, 170);
  float ypos2= map (mouseX, 0, width, 380, 370);
  float xpos2= map (mouseX, 0, width, 410, 410);

  rotate(radians (10));
  ellipse (xpos2, ypos2, h3, h4);
}



