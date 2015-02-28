
// jennifer lau


void setup() {
  size(700, 700);
  smooth();
  background (255);
  }



void draw() {
  fill(240, 5); //show less transparency therefore slower
  rect (0,0,width,height); 
  pushMatrix();
  translate(mouseX, mouseY);
  
  //logo
  stroke (114, 16, 23);
  strokeWeight(2);
  strokeCap (ROUND);
  scale (5);
  line (5, 0, 15, 0);
  line (15, 0, 18, 3);
  line (18, 3, 18, 24);
  line (3, 8, 15, 8);
  line (15, 8, 18, 10);
  line (0, 10, 3, 8);
  line (0, 10, 0, 40);
  line (0, 23, 14, 23);
  line (14, 23, 18, 24);
  line (18, 24, 20, 27);
  line (20, 27, 24, 27);

  popMatrix();

}

void mousePressed() {
  fill (255,100);
  }

void mouseClicked () {
  if (mouseButton == RIGHT) {
    background(255);
  }

}


