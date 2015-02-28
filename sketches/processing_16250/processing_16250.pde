
int mavariable;
int compteur1;
void setup () {

  mavariable=10;

  background (mouseX,mouseY,mavariable+random(390),mavariable+random(506));

  size (750,750);

  fill(random(247),random(136),random(129));

 
}

void draw () {

  mavariable=mavariable+1;

  ellipse(mouseX,mouseY,mavariable+1,mavariable+1);
   compteur1=0;
  while(compteur1<100)
    compteur1++;
    fill (random(255),random(255),random(255));
    rect(compteur1*10,0,10,10);

}

void mouseClicked () {

  mavariable=12;

  background (mouseX,mouseY,mavariable+random(390),mavariable+random(506));

  ellipse(mouseX,mouseY,mavariable+1,mavariable+1);


  fill(random(134),random(243),random(170),random(160));

}

