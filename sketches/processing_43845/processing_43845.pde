
/* Intro to Computational Media
 Assignment Week #5
 Manuela Donoso
 
 */

int value = 0;
float level = 1;
boolean change = true; // figure changes when mouse moves
boolean rev = true;
Pattern myPattern = new Pattern(250, 250, 500, 1);

void setup() {
  size(500, 500);
  background(#9AE0F2);
  stroke(40);
  smooth();
}

void draw() {

  background(#9AE0F2);
  fill(#EA053E);
  myPattern.level = int(level);
  myPattern.display();

  //println(frameRate);
}

void mouseMoved() {
  if (change == false) change = true;
  if (rev == false) level-=0.1;
  if (rev == true) level+=0.1;
  if (level >= 10) {
    rev = false;
    level--;
  }
  if (level <= 0) {
    rev = true;
    level++;
  } 
  //delay(300);
}


