
float x1, x2, x3, x4;
float y1, y2, y3, y4;
float px1, px2, px3, px4;
float py1, py2, py3, py4;
float velx1, velx2, velx3, velx4;
float vely1, vely2, vely3, vely4;
float c1;
float incC1;
float mouseVel;
int imgIndex;


//---------------------
void setup() {
  size(640, 480);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 90, 50);

  imgIndex=0;

  incC1 = 0.2;
  c1 = 0;

  mouseVel = 0;

  x1 = random(0, width);
  x2 = random(0, width);
  x3 = random(0, width);
  x4 = random(0, width);

  y1 = random(0, height);
  y2 = random(0, height);
  y3 = random(0, height);
  y4 = random(0, height);

  px1 = x1;
  px2 = x2;
  px3 = x3;
  px4 = x4;

  py1 = y1;
  py2 = y2;
  py3 = y3;
  py4 = y4;

  velx1 = random(-2.5, 2.5);
  velx2 = random(-2.5, 2.5);
  velx3 = random(-2.5, 2.5);
  velx4 = random(-2.5, 2.5);

  vely1 = random(-2.5, 2.5);
  vely2 = random(-2.5, 2.5);
  vely3 = random(-2.5, 2.5);
  vely4 = random(-2.5, 2.5);
}

//---------------------
void draw() {

  noStroke();
  fill(25, 75, 80, 1);
  rect(0, 0, width, height);

  mouseVel = dist(pmouseX, pmouseY, mouseX, mouseY);

  stroke(0, 20, 30, 50);
  fill((c1+240)%360, 100, 50, 100);
  ellipse(mouseX, mouseY, mouseVel, mouseVel);

  stroke(0, 20, 30, 50);
  fill((c1+200)%360, 100, 75, 5);
  quad(x1, y1, x2, y2, x3, y3, x4, y4);

  fill((c1+100)%360, 100, 75, 5);
  beginShape();
  vertex(x1, y1);
  bezierVertex(x2, y2, x3, y3, x4, y4);
  endShape();

  fill((c1+280)%360, 100, 75, 5);
  beginShape();
  vertex(x3, y3);
  bezierVertex(x4, y4, x2, y2, x1, y1);
  endShape();

  //---------------------  
  stroke(c1, 50, 25, 75);
  line(x1, y1, x2, y2);
  line(mouseX, mouseY, x1, y1);
  line(mouseX, mouseY, x2, y2);
  line(mouseX, mouseY, x3, y3);
  line(mouseX, mouseY, x4, y4);

  stroke((c1+60)%360, 50, 75, 25);
  line(x1, y1, px1, py1);
  stroke((c1+90)%360, 50, 75, 25);
  line(x2, y2, px2, py2);
  stroke((c1+180)%360, 50, 75, 25);
  line(x3, y3, px3, py3);
  stroke((c1+170)%360, 50, 75, 25);
  line(x4, y4, px4, py4);
  //guardamos posiciones anteriores

  px1 = x1;
  px2 = x2;
  px3 = x3;
  px4 = x4;

  py1 = y1;
  py2 = y2;
  py3 = y3;
  py4 = y4;

  //actualización de posiciones
  x1 += velx1;
  x2 += velx2;
  x3 += velx3;
  x4 += velx4;

  y1 += vely1;
  y2 += vely2;
  y3 += vely3;
  y4 += vely4;

  c1 += incC1;
  c1 %= 360;

  //manejo de fronteras
  // (x1 ,y1)
  if (x1 < 0 || x1 > width) {
    velx1 *= -1;
  }
  if (y1 < 0 || y1 > height) {
    vely1 *= -1;
  }
  // (x2 ,y2)
  if (x2 < 0 || x2 > width) {
    velx2 *= -1;
  }
  if (y2 < 0 || y2 > height) {
    vely2 *= -1;
  }
  // (x3 ,y3)
  if (x3 < 0 || x3 > width) {
    velx3 *= -1;
  }
  if (y3 < 0 || y3 > height) {
    vely3 *= -1;
  }
  // (x4 ,y4)
  if (x4 < 0 || x4 > width) {
    velx4 *= -1;
  }
  if (y4 < 0 || y4 > height) {
    vely4 *= -1;
  }
}


void keyPressed() {

  if (key == 's') {
    save("recapitulando" + imgIndex + ".jpg");
    imgIndex++;
  }

  if (key == 'v') {
    velx1 = random(-2.5, 2.5);
    velx2 = random(-2.5, 2.5);
    velx3 = random(-2.5, 2.5);
    velx4 = random(-2.5, 2.5);

    vely1 = random(-2.5, 2.5);
    vely2 = random(-2.5, 2.5);
    vely3 = random(-2.5, 2.5);
    vely4 = random(-2.5, 2.5);
  }
}



