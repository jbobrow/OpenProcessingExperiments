
void ala_esq () {
  fill(255, 60);
  rotate(90);
  ellipse (0, 0, 100, 40);
}

void ala_dret () {
  fill(255, 60);
  rotate(-90);
  ellipse (0, 0, 100, 40);
}

void setup () {
  size (255, 255);
}

void draw () {
  background (175, 100, 100);

  ellipseMode(CENTER);
  //rotate (0);

  //telaraña
  stroke (175);
  line (5, 255, mouseX, mouseY);
  line (0, 10, mouseX, mouseY);
  line (255, 30, mouseX, mouseY);
  strokeWeight (0.5);
  line (250, 10, mouseX, mouseY);
  line (100, 0, mouseX, mouseY);
  strokeWeight (2);
  line (255, 255, mouseX, mouseY);
  line (0, 190, mouseX, mouseY);

  //potes
  strokeWeight(3);
  stroke (0);

  line (mouseX, mouseY, mouseX-35, mouseY-50);//dalt_esq
  line (mouseX-35, mouseY-50, mouseX-40+random(6), mouseY-40);

  line (mouseX, mouseY, mouseX-50, mouseY);//mig_esq
  line (mouseX-50, mouseY, mouseX-45+random(3), mouseY+10);

  line (mouseX, mouseY, mouseX-35, mouseY+50);//baix_esq
  line (mouseX-35, mouseY+50, mouseX-30+random(5), mouseY+55);

  line (mouseX, mouseY, mouseX+35, mouseY+50);//baix_dret
  line (mouseX+35, mouseY+50, mouseX+30+random(4), mouseY+55);

  line (mouseX, mouseY, mouseX+50, mouseY);//mig_dret
  line (mouseX+50, mouseY, mouseX+45+random(5), mouseY+10);

  line (mouseX, mouseY, mouseX+35, mouseY-50);//dalt_dret
  line (mouseX+35, mouseY-50, mouseX+40+random(4), mouseY-40);

  //cos
  strokeWeight (1);
  fill (0);
  ellipse (mouseX, mouseY, height/5, width/4);

  //ulls
  fill (mouseX, mouseY, random(255));
  ellipse (mouseX+12, mouseY-20, height/12, width/12);
  ellipse (mouseX-12, mouseY-20, height/12, width/12);

  fill (255);
  ellipse (mouseX+12, mouseY-25, height/20, width/30);
  ellipse (mouseX-12, mouseY-25, height/20, width/30);

  //ales

  pushMatrix();
  translate(mouseX-30, mouseY+40);
  ala_esq();
  popMatrix();

  pushMatrix();
  translate(mouseX+30, mouseY+40);
  ala_dret();
  popMatrix();
}

