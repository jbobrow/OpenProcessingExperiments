
// L'interactivité du clavier

int rect_x = 150;
int rect_y = 150;

void setup() {
size (400,400);
fill (255);
noStroke();
}

void draw() {
background(0); // Fond noir
rect(rect_x,rect_y,100,100);
}

// keyPressed est appelé à chaque pression sur une touche du clavier :
void keyPressed() {
  
// Modifier la couleur du rectangle, la variable key :
if (key == 'r') { fill (255,0,0); }
if (key == 'v') { fill (0,255,0); }
if (key == 'b') { fill (0,0,255); }

// Pour les touches spéciales commes les flèches, on doit passer par keyCode :
if (key == CODED) {
  if (keyCode == UP) { rect_y = rect_y - 5; }
  if (keyCode == DOWN) { rect_y = rect_y + 5; }
  if (keyCode == RIGHT) { rect_x = rect_x + 5; }
  if (keyCode == LEFT) { rect_x = rect_x - 5; }
}

}

