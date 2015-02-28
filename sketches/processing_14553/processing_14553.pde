
int variableA;

void setup () {
  size (600,600);
  background (219,212,150);
  variableA = 1;
}

void draw () {
  variableA = variableA +5;
  fill (231,208,13,10);
  stroke (255,255,255);
  ellipse (mouseX,mouseY, 400,variableA);
  fill (random(126),122,88);
  ellipse (mouseX,mouseY, 150,150);
  fill (86,84,64);
  ellipse (mouseX,mouseY, 100,150);
  fill (70,66,33);
  ellipse (mouseX,mouseY, 50,150);
  fill (190,36,36);
  ellipse (mouseX,mouseY, 40,40);
}

void mouseClicked () {
  variableA = 0;
}
                
                
