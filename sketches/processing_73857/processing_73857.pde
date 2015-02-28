
//Sun Kyung Park
//andrewID: sunkyunp
//Copyright Sun Kyung Park oct 2012

void setup () {
  size (400, 400);
  smooth ();
  background (0);
}


void draw () {
  boomBoom ();
}

void boomBoom () {
  float i = 0;

  while (i < 400 ) {
    strokeWeight (5);
    stroke (random (255), random (255), random (255));
    line (100, i + 50, 300, i + 50);
    i = i + 30;
  }
  
}

//mouse click --> doubles or adds lines
void mousePressed () {
  if (mousePressed == true) {
   float x = 0;
   float y = random (255, 50);
   
   while (x < width) {
    strokeWeight (5);
   stroke (random (255), random (255), random (255));
  line (100, x, 300, x);
 x = x + 30; 
   }
  } 
  
}

//key press space bar --> stops, key press others --> start again
void keyPressed () {
 if (key == ' ') {
  noLoop ();
 } else {
  loop (); 
 }
  
}






