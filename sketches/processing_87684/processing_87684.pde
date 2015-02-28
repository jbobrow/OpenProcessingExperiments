
//hipster face//

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(106);
  float d = map(mouseX, 0, width, 20, 50);
  float e = map(mouseX, 0, width, 4, 40);
  float f = map(mouseX, 10, width, 50, 20);

  fill(0, 0, 0);
  ellipse(306, 172, d, d);//eye
  ellipse(195, 172, d, d);//eye
  ellipse(283, 271, e, e);//left nostril

  float d2 = map(mouseX, 0, width, 10, 60);
  float e2 = map(mouseX, 0, width, 4, 40);
  float f2 = map(mouseX, 0, width, width/2 - 100, width/2);
  float g2 = map(mouseX, 0, width, width/2 + 50, width/5);

  fill(255);
  ellipse(309, 171, d2, d2);//right pupil
  ellipse(191, 172, d2, d2);//left pupil
  fill(0, 0, 0);
  ellipse(231, 271, e2, e2);//right nostril


  float xpos = map(mouseX, 10, width, 50, 420);

  float o = map(mouseX, 0, width, 5, 30);


  fill(0, 0, 0);
  ellipse(220, 320, 83, 19.50);//left lip
  ellipse(296, 320, 83, 19.50);//right lip
  ellipse(259, 330,o,o);//bottom lip  


  ellipse(88, 169, 15.50, 28.50);//right ear
  ellipse(424, 169, 15.50, 28.50);//left ear
  rect(223, 382, 72, 115.50);//moustache

  rect(421, 240, 15, 259.50);//right sideburn
  rect(79, 241, 15, 258.50);//left sideburn
  rect(85, 422, 339.50, 80.50);//chin

  strokeWeight(10);
  strokeCap(SQUARE);
  line(130, 140, f2, 140);//left eyebrow
  line(378, 140, g2, 140);//right eyebrow
  triangle(154, 0, 361, 232, 259, -8);//hair
  triangle(295, -8, 354, 220, 367, -6);//hair
}



