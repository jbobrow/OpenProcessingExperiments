
void setup() {
size (300, 480);
smooth(); //
strokeWeight (3);
}
void draw () {
background (255);
stroke (0);
background(0, 26, 51);
int feet = 30;
int shoulders = 30;
int d = 60;
int p = 10;
int hand = 35;

fill(10, 200, 250);
ellipse (130, 350, feet, feet); // feet
ellipse (150, 350, feet, feet); // feet
fill(10, 150, 200);
rect (110, 240, 80, 110); // legs
rect (140, 120, 15, 40); // neck

ellipse (150, 100, 80, 80); // head
strokeWeight (3); //
ellipse (150, 230, 150, 150); // body


rect (50, 165, d, p); // upper arm left
rect (190, 165, d, p); // upper arm right
rect (45, 170, p, d); // lower arm left
rect (245, 170, p, d); // lower arm right

fill (10, 150, 250);
ellipse (100, 170, shoulders, shoulders); // shoulders
ellipse (200, 170, shoulders, shoulders); // shoulders
ellipse (50, 170, 20, 20); // elbow
ellipse (250, 170, 20, 20); // elbow
strokeWeight (3); //
fill (10, 200, 250);
ellipse (50, 240, hand, hand); // hand left
ellipse (250, 240, hand, hand); // hand left
noStroke ();

fill (255);
if (mousePressed == true) { // eyes change colour when pressed
  fill (50, 100, 250);
  }
ellipse (135, 90, 30, 40); // outer eye left

if (mousePressed == true) { // eyes change colour when pressed
  fill (70, 10, 150);
  }
ellipse (165, 95, 25, 20); // outer eye right

fill (0);
ellipse (130, 90, p, p); // pupil left
ellipse (165, 95, 8, 8); //pupil right
rect(140, 120, 25, 4); // mouth


fill (10, 200, 250);

if (mousePressed == true) {
  fill (50, 100, 200);
  }
rect (120, 200, d, d); // chest
fill (0);
ellipse (170, 230, p, p); // handle
}



