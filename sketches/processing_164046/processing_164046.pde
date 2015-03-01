
char a= 'S';
char b= 'P';
char c= 'O';
char d= 'T';
char e= 'L';
char f= 'I';
char g= 'G';
char h= 'H';
char i= 'T';

void setup () {
  size (500, 500);
  smooth ();
  strokeWeight(40);
}

void draw() {
  background(0);
  if (keyPressed) {
    ellipse(200, 250, 400, 400);
    fill(255);
  }
}
