
/* Francis Sheehan
Homework 1
Visual Foundation Studio

Attempt #1 to recreate the Processing logo within Processing. First sketch.
*/

void setup() {
  size(400, 400);
}

void draw() {
  background(000); 
  
  pentagon();
  P();
}

void pentagon(){
  strokeWeight(3);
  stroke(#6c58ff);
  
  // Outline
  line(200,63,340,165);
  line(340,165,290,315);
  line(290,315,135,315);
  line(135,315,80,165);
  line(80,165,200,63);
  
  //Inner lines (center on point 200,200)
  strokeWeight(1);
  line(200,63,200,200);
  line(340,165,200,200);
  line(290,315,200,200);
  line(135,315,200,200);
  line(80,165,200,200);
}

void P(){
  //On (150,270)
  PFont letter;
  letter = createFont("Cambria",230,true);
  fill(255);
  
  textFont(letter);
  text("P", 140, 270);
}
