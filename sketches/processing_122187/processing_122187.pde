
void setup () {

  size(200, 200);
  }

void draw () {
  /* Theorie: X, Y, Breedte, Hoogte 
  -Bij kleur is het 5e argument de transparantie. 0-255 grijswaarden, 3 is RGB
  -De 5e argument bij een kleur is een ronding in hoeken
  -Functio: noStroke, noFill, haalt weg 
  -mouseX -> mouseY , + of - vanaf de eerste function die je mouse maakt.
  */
  
  background(250); 
  
  /*Digglet hoofd*/
  stroke(0);
  fill(161,50,16);
  rect(mouseX, mouseY, 80, 130, 40);
  
  /*Digglet hoofd  - Oog links*/
  stroke(0);
  fill(0);
  rect(mouseX+24, mouseY+18, 8, 24, 40);
  
  /*Digglet hoofd  - Pupil links*/
  stroke(0);
  fill(255);
  rect(mouseX+24, mouseY+18, 7, 10, 40);
  
  /*Digglet hoofd  - Oog rechts*/
  stroke(0);
  fill(0);
  rect(mouseX+49, mouseY+18, 8, 24, 40);
  
   /*Digglet hoofd  - Pupil rechts*/
  stroke(0);
  fill(255);
  rect(mouseX+49, mouseY+18, 8, 10, 40);
  
  /*Digglet hoofd  - Neus*/
  stroke(0);
  fill(219,138,172);
  rect(mouseX+22, mouseY+50, 35, 19, 80);

  
 }

