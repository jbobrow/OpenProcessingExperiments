
float x = random(200, 300) ;
float y = random(200, 300);

void setup() {
  background(255);
  size(600, 600);
  smooth();
}

void draw() {
  fill(209, 209, 209, 20);
  translate (mouseX, mouseY);
  strokeWeight( 3);
  arc(x+35, y, 20, 20, HALF_PI, PI+HALF_PI);
  arc(x-5, y, 20, 20, PI+HALF_PI, TWO_PI+HALF_PI );
  arc(x+50, y, 20, 20, PI+HALF_PI, TWO_PI+HALF_PI );
  if (mousePressed) {
    stroke(234, 7, 7);
  } 
  else {
    stroke(0);
  }
  strokeWeight( 5);
  arc(x+35, y, 40, 40, HALF_PI, PI+HALF_PI);
  arc(x-5, y, 40, 40, PI+HALF_PI, TWO_PI+HALF_PI );
  arc(x+50, y, 40, 40, PI+HALF_PI, TWO_PI+HALF_PI );
  x= x + random(5)-random(5);
  y= y + random(5)-random(5);
}

void mouseClicked() {
  background(255);
  x= random(200);
  y = random(200);
}

void mousePressed()
{
  saveFrame("scaling-##.tif");
}


