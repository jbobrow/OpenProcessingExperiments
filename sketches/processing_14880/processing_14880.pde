

int mavariable;

void setup () {

  mavariable=10;

  background (mouseX,mouseY,mavariable+random(390),mavariable+random(506));

  size (750,750);

  fill(random(247),random(136),random(129));
}

void draw () {

  mavariable=mavariable+1;

  ellipse(mouseX,mouseY,mavariable+1,mavariable+1);
}

void mouseClicked () {

  mavariable=12;

  background (mouseX,mouseY,mavariable+random(390),mavariable+random(506));

  ellipse(mouseX,mouseY,mavariable+1,mavariable+1);

  textSize(180);

  String bla="BOUH";

  text(bla,mouseX,mouseY);

  fill(random(134),random(243),random(170),random(160));
}

