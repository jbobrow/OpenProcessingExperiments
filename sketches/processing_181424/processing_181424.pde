

float mida = 60;
float x = 15;
float y = 20;


void setup () {

  size(255, 255);
}

void draw () {

  background(0);
  stroke(255);
  strokeWeight(2);

  fill(0);
  ellipse(mouseX, mouseY, mida, mida);

  //ull esquerra
  fill(255);
  ellipse(mouseX-x, mouseY-y, mouseY/4, mouseY/4);
  noStroke();
  fill(mouseX, 222, 196);
  ellipse(mouseX-x, mouseY-y, mida/3, mida/3);
  fill(0);
  ellipse(mouseX-x, mouseY-y, mida/6, mida/6);

  //ull dret
  fill(255);
  ellipse(mouseX+x, mouseY-y, mouseY/4, mouseY/4); 
  noStroke();
  fill(mouseX, 222, 196);
  ellipse(mouseX+x, mouseY-y, mida/3, mida/3);
  fill(0);
  ellipse(mouseX+x, mouseY-y, mida/6, mida/6);

  //boca
  fill(222, 101, 145, mouseX);
  ellipse(mouseX, mouseY+12, mouseY/6, mouseY/8);

  //cames
  stroke(255);
  line(mouseX-15, mouseY+26, mouseX-30, mouseY+45);
  line(mouseX+15, mouseY+26, mouseX+30, mouseY+45);

  fill(mouseX, 120, mouseX);
  ellipse(mouseX-30, mouseY+47, mouseY/6, mouseY/9);
  ellipse(mouseX+30, mouseY+47, mouseY/6, mouseY/9);
}
