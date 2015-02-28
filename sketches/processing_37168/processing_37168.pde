
int x = 150;

void setup () {
  
size(400, 400);
background (0);

if (x > 100) {
  fill (78, 227, 94);
  noStroke ();
  ellipse (200, 200, 200, 300);
  fill (0);
  ellipse (160, 160, 50, 100);
  ellipse (240, 160, 50, 100);
  stroke(0);
  strokeWeight(5);
  line (200, 250, 190, 250);  
}
}

void draw () {
  if (mousePressed) {
    fill(0);
    ellipse(200,260,60,75);
  } else { 
  fill (78, 227, 94);
  noStroke ();
  ellipse (200, 200, 200, 300);
  fill (0);
  ellipse (160, 160, 50, 100);
  ellipse (240, 160, 50, 100);
  stroke(0);
  strokeWeight(5);
  line (200, 250, 190, 250);  
  }
}
                
                
