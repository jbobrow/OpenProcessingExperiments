
color[] powerfull = {#E5C893, #FFFFC7, #92DEB4, #E82C0C, #F0840C};
color[] palette = powerfull;

int i = 1;
int x = 0;

void setup(){
  size(600, 200);
  smooth();
  stroke(palette[3]);
  strokeWeight(7);
}

void draw() {
  background(palette[0]);
  fill(palette[i]);
  ellipse(width/2, height/2, 100, 100);
}

void keyPressed(){
  x += 10;
}

void mousePressed(){
 i = int(random(1, 5));
}
