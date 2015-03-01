
void setup () {
  size (600, 600);
  background (#22486B);
  smooth ();
}

void draw () {
  
  //space specs
  fill(200);
  strokeWeight (0);
  ellipse (random(600), random(600), random(6),random(5));

  //head
  strokeWeight (0);
  fill(0);
  ellipse (300, 110, 200, 200);

  //eyes
  strokeWeight (0);
  fill(random(100), random(255), random(100));
  ellipse (250, 80, 20, 20);
  ellipse (350, 80, 20, 20);

  //body
  strokeWeight (0);
  fill(0);
  rect (200, 280, 230, 200);

  //neck
  strokeWeight (0);
  line (300, 210, 250, 300);
  line (280, 190, 230, 280);
  line (340, 200, 270, 320);
  line (300, 210, 350, 300);
  line (340, 200, 380, 280);


  //legs
  strokeWeight (0);
  beginShape ();
  vertex (220, 480);
  vertex (200, 490);
  vertex (240, 490);
  endShape();

  beginShape ();
  vertex (410, 480);
  vertex (390, 490);
  vertex (430, 490);
  endShape();

  //arms
  strokeWeight (4);
  line (200, 350, 140, 250 );
  line (430, 350, 480, 250);

  //mouth
  strokeWeight (0);
  fill(random(255), random(20), random(50));
  rect (250, 130, 100, 40);
}


