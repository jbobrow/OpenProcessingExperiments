
nt x=0;
int y=0;

void setup () {
  size(300, 300);
  smooth();
}


void draw () {
  background(255);
  x=mouseX;
  y=mouseY;
  float r = map(x,0, width, 0,225); 
  float g = map(y,0, height, 0,225); 
  float b = map(x+ y,0, width+height, 0,225); 
  //head
  fill(225);
  map(x,0, width, 0, 225);
  map(y,0, height, 0, 225);
  arc(x-25, y-10, 50, 60, 0, PI/2);
  //wings
  arc(x+25, y-10, 50, 60, PI/2, PI);
  arc(x, y-10, 50, 60, PI, TWO_PI);
  noStroke();
  //body
  fill(225);
  triangle(x, y+40, x-26, y-10, x+26, y-10);
  //face
  fill(70);
  ellipse(x, y-14, 40, 40);
  //right eye
  fill(120);
  ellipse(x+10, y-15, 15, 15);
  fill(r,g,b);
  ellipse(x+8, y-16, 10, 10);
  fill(255);
  ellipse(x+8, y-16, 3, 3);
  //left eye
  fill(120);
  ellipse(x-10, y-15, 15, 15);
  fill(r,g,b);
  ellipse(x-8, y-16, 10, 10);
  fill(255);
  ellipse(x-8, y-16, 3, 3);
  //beak
  fill(150);
  arc(x, y-10, 8, 8, PI, TWO_PI);
  triangle(x, y-2, x-4, y-10, x+4, y-10);
}
