
void setup () {
  size (500, 500);
  background (250,240);

}

void draw () {
    noStroke ();
    fill (24,41,121); //blue rect
  rect (0, 220, 30, 180);
    fill (205,192,38); //yellow rect
  rect (230, 0, 170, 50);
    fill (0); //black rect
  rect (400, 0, 100, 120);
    fill (179,50,28); //red rect
  rect (400, 450, 170, 100);
    fill (24,41,121); //blue rect
    noStroke ();
  rect (0, 220, 30, 180);
    stroke (0);
   strokeWeight (7);
  line (5, 50, 400, 50);
  line (230, 5, 230, 50);
  line (400, 0, 400, 495);
  line (400, 120, 500, 120);
  line (400, 450, 495, 450);
  line (5, 400, 400, 400);
  line (30, 50, 30, 400);
  line (0, 220, 30, 220);
  
}

