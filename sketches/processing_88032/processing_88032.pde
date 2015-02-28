
//
// ITGM 315
// Fundamentals of Programming for Artists
// Professor Altman
//
//           Programming assignment 3, part 2
//           first use of a simple class
//

Creature psycho;
Creature psycho1;
Creature psycho2;

color b_green = color(0,255,0);
color b_white = color(255);
color b_red = color(255,0,0);

int mx, my;


void setup() {
  size(800,800);
  
  psycho = new Creature ("psycho", 400, 450, b_white);
  psycho1 = new Creature ("psycho1", 200, 450, b_green);
  psycho2 = new Creature ("psycho2", 600, 450, b_red);
}

void draw() {
  background(150);
  smooth();
  line(250,0,250,800);
  line(550,0,550,800);
  
  if ( mousePressed && ( mouseButton == LEFT ) ) {
    psycho.reposition(mouseX,mouseY);
    psycho1.reposition(mouseX,mouseY);
    psycho2.reposition(mouseX,mouseY);
  }
    
  psycho.display();
  psycho1.display();
  psycho2.display();
  
  mx = mouseX;
  my = mouseY;
}

void mousePressed() {
  psycho.select(mouseX,mouseY);
  psycho1.select(mouseX,mouseY);
  psycho2.select(mouseX,mouseY);
}

void mouseReleased() {
  psycho.deselect();
  psycho1.deselect();
  psycho2.deselect();
}

