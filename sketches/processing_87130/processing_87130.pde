
void setup() {

  size(854, 480);
}
void draw() {
  background(255-mouseX/10);
  //Cloud base
  noStroke();
  fill(180-mouseX/5);
  translate(width/2, height/2);
  ellipse(0, 0, 400, 200);//Base Ellipse
  ellipse(80, 100, 90+mouseX/10, 90+mouseX/10);// Bottom Right
  ellipse(150, 200/2, 100+mouseX/15, 100+mouseX/15);//2
  ellipse(0, 200/2, 100+mouseX/10, 100+mouseX/10);//3
  ellipse(-100, 200/2, 100+mouseX/15, 100+mouseX/15);//4
  ellipse(-50, 130, 50+mouseX/10, 50+mouseX/10);//small almost bottom middle left
  ellipse(-170, 80, 75+mouseX/15, 75+mouseX/15);
  ellipse(-200, 100/2, 100+mouseX/10, 100+mouseX/10);//Bottom Left
  ellipse(-200, 0, 75+mouseX/15, 75+mouseX/15);//6
  ellipse(-180, -70, 80+mouseX/10, 80+mouseX/10);//Top Left
  ellipse(-110, -60, 75+mouseX/15, 75+mouseX/15);//
  ellipse(-70, -80, 75+mouseX/10, 75+mouseX/10);//
  ellipse(-20, -80, 100+mouseX/15, 100+mouseX/15);//Top Middle
  ellipse(60, -100, 75+mouseX/10, 75+mouseX/10);
  ellipse(100, -70, 75+mouseX/15, 75+mouseX/15);
  ellipse(60, -100, 75+mouseX/10, 75+mouseX/10);
  ellipse(140, -80, 75+mouseX/15, 75+mouseX/15);
  ellipse(180, -40, 75+mouseX/10, 75+mouseX/10);//Top Right
  ellipse(200, 20, 80+mouseX/15, 90+mouseX/15);//Right
  ellipse(200, 70, 70+mouseX/10, 70+mouseX/10);

  //Cloud Face

  noStroke();
  fill(255-mouseX/10);
  pushMatrix();
  translate(-80, -80);
  rotate(radians(mouseX/30));
  rectMode(CENTER);
  rect(15, 0, 70+mouseX/40, 5+mouseX/40);
  popMatrix();
  pushMatrix();
  translate(80, -80);
  rotate(radians(-mouseX/30));
  rect(-15, 0, 70+mouseX/40, 5+mouseX/40);
  popMatrix();

  ellipse(-70, -40+mouseX/40, 5+mouseX/40, 40+mouseX/40);//left eye
  ellipse(70, -40+mouseX/40, 5+mouseX/40, 40+mouseX/40);//right eye
  rectMode(CORNER);

  rect(-80, 40-mouseX/100, 160, 5+mouseX/10);//mouth
}
