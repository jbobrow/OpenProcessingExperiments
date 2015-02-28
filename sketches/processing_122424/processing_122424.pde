
int monsterX;
int monsterY;

void setup () {
  size (200,200);
  
  /* Om een monster een begin plek te geven moet je de int's een start positie geven.
  */
  monsterX = 100;
  monsterY = 200;
  
  }

void draw () {
  /* Theorie: X, Y, Breedte, Hoogte 
  -Bij kleur is het 5e argument de transparantie. 0-255 grijswaarden, 3 is RGB
  -De 5e argument bij een kleur is een ronding in hoeken
  -Functio: noStroke, noFill, haalt weg 
  -monsterX -> monsterY , + of - vanaf de eerste function die je mouse maakt.
  */
  
  /*Beweging*/
  monsterY = monsterY - 1;
  monsterX = mouseX;
  
  background(250); 
  
  
  
  /*Digglet hoofd*/
  stroke(0);
  fill(161,50,16);
  rect(monsterX, monsterY, 80, 130, 40); /* 56x, 30y */
  
  /*Digglet hoofd  - Oog links*/
  stroke(0);
  fill(0);
  rect(monsterX+24, monsterY+18, 8, 24, 40);
  
  /*Digglet hoofd  - Pupil links*/
  stroke(0);
  fill(255);
  rect(monsterX+24, monsterY+18, 7, 10, 40);
  
  /*Digglet hoofd  - Oog rechts*/
  stroke(0);
  fill(0);
  rect(monsterX+49, monsterY+18, 8, 24, 40);
  
   /*Digglet hoofd  - Pupil rechts*/
  stroke(0);
  fill(255);
  rect(monsterX+49, monsterY+18, 8, 10, 40);
  
  /*Digglet hoofd  - Neus*/
  stroke(0);
  fill(219,138,172);
  rect(monsterX+22, monsterY+50, 35, 19, 80);


 
}
