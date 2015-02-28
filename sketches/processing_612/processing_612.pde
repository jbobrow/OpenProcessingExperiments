
  
void setup () {
size (500,500);
}


void draw () {
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23 
  
  background (0,h*8,h*8);
  
  for (int x=350; x<500; x=x+20) {
  stroke (0);
  line (x, 0, x, 500);
}

  
  stroke (0);
  strokeWeight (5);
  talloM ();

  fill (h+25,125,m);
  stroke (1);
  strokeWeight (5);
  topM ();
  
if (s == 59) {
  stroke (1);
  strokeWeight (5);  
  fill (0, s+55, s+124);
    ellipse (323, 250, 200, 200);
}
  
  fill (0, s+55, s+124);
  stroke (1);
  strokeWeight (2);
  ellipse (s*5, 250, 50, 50);
  
}



void talloM () {
beginShape(POLYGON);
vertex (323, 0);
vertex(323,500);
endShape(CLOSE);
}

void topM () {
beginShape(POLYGON);
  ellipse (323, 250, 200, 200);
endShape(CLOSE);
}

