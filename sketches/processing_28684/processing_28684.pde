
void testFace() {
  background(50);
  translate(250, 250);
  scale(1+v/10); 
  noStroke();


  //1st level
  //face
  strokeCap(ROUND);
  stroke(0);
  fill(249, 192, 123, v*50); 
  ellipse(0, -80, 280, 280);
  //eyes
  noStroke();
  fill(0, 0, 0, v*40);
  ellipse(-65, -125, 20+v*10, 20+v*10);
  //hair
  smooth();
  tint(246, 255, 0, v*200);
  image(hair, -250, -250, 500, 500);

  //body
  tint(255, 255, 255, v*50);
  image(body1, -250, -250, 500, 500);
  //eyes
  noStroke();
  fill(0, 0, 0, v*40);
  ellipse(-65, -125, 20+v*10, 20+v*10);
  //mouth
  fill(0, 0, 0, v*40);
  ellipse(0, 0, 50+v*10, 50+v*10);
  //eyebrows
  stroke(0, 0, 0, v*60);
  strokeWeight(10+v);
  line(-90, -160, -40+v*5, -140+v);

  //-----------------------------------------------------------

  //2nd level

  //hair
  tint(250,250,250,v*2);
  image(rhair, -13,-33-v/100,50,50 +v/35);
  image(lhair, -25, -33-v/100, 50, 50+v/35);


  hair5(10, 11, 2, -1);
  hair5(10, 12, 1, -1);
  hair5(10, 13, 5, 1 );
  hair5(10, 14, 3, -1);
  hair5(10, 15, 4, -1);


  hair5(-10, -11, 2, -1);
  hair5(-10, -12, 1, -1);
  hair5(-10, -13, 5, 1);
  hair5(-10, -14, 3, -1);
  hair5(-10, -15, 4, 1);


  //face
  noStroke();
  strokeWeight(1);
  fill(255, 255, 255, v*2);
  rect(0, -4, 20, 27);

  hair5(10,10, 0, 1);
  hair5(-10,-10, -1, 1);

  //hat
  tint(255, 255, 255, v*4);
  image(hat, -39, -43, 80, 50);

  //eyes
  noStroke();
  fill(234, 17, 17, v*3);
  rect(4, -10, 3+v/35, 3+v/35);
  rect(-4, -10, 3+v/35, 3+v/35);

  //mouth
  fill(0, 0, 0, v*3);
  noStroke();
  quad(-2, -3.5-v/50, 2, -3.5-v/50, 4+v/50, 1+v/15, -4-v/50, 1+v/15);

  //eyebrows
  stroke(0, 0, 0, v*3);
  strokeWeight(v/50);
  strokeCap(SQUARE);
  line(7+v/100, -14, 1.5-v/100, -12);
  line(-7-v/100, -14, -1.5+v/100, -12);



  //-----------------------------------------------------------

  //3rd level
  //face
  noStroke();
  scale(v);
  noFill();
  stroke(random(255), random(255), random(255), v*3);
  strokeWeight(.1);
  pushMatrix();
  rotate(v);
  quad(0, -2, 2, 0, 0, 2, -2, 0);
  popMatrix();

  //eyes
  strokeWeight(.075);
  stroke(random(255), random(255), random(255), v*3);
  pushMatrix();
  translate(-.6, -.5);
  rotate(-v);
  quad(0, -.3, .3, 0, 0, .3, -.3, 0);
  popMatrix();

  pushMatrix();
  translate(.6, -.5);
  rotate(-v);
  quad(0, -.3, .3, 0, 0, .3, -.3, 0);
  popMatrix();

  //mouth
  strokeWeight(.1);
  stroke(random(255), random(255), random(255), v*3);
  pushMatrix();
  translate(0, .6);
  rotate(-v);
  quad(0, -.4, .4, 0, 0, .4, -.4, 0);
  popMatrix();

  // Credits
  fill(150);
  String credits = "Eliott Ephrati";
  text(credits, -240, 240);
  fill(255);
}




void hair5 (int x, int y, int z, int n) {
  smooth();
  speed = .1 +v/300;
  stroke(52, 35, 25, v*2);
  strokeWeight(0.5);
  noFill();
  float y1 = offset + sin(angle) * scalar;
  float y3 = offset + -sin(angle) * scalar;
  float y2 = offset + cos(angle) * scalar;
  float y4 = offset + -cos(angle) * scalar;

  beginShape();
  curveVertex(x, -17.5);
  curveVertex(x, -17.5);
  curveVertex((y+n*y1), -14.1+v/20);
  curveVertex((y+n*y2), -12.7+v/20);
  curveVertex((y+n*y3), -10.3+v/20);
  curveVertex((y+n*y4), -7.9+v/20);
  curveVertex(y, -5.5+v/15+z);
  curveVertex(y, -5.5+v/15+z); 
  endShape();

  angle += speed;
}


