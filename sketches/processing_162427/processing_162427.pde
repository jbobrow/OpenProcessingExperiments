
/*
dont sweat the petty things and dont pet the sweaty things
                                                          -obama
*/
void setup() {
  background(255);
  size(500, 500);
}

void draw() {
  background(255);
  thing(mouseX, mouseY);
}


void thing(int x, int y) {
  fill(0);
  stroke(0);
  triangle(x-50, y, x+50, y, width/2, height);
  triangle(x-50, y, x+50, y, x, y-100);
  fill(255);
  ellipse(x,y-34,34,34);
  fill(0);
  ellipse(x,y-34,10,10);
  stroke(255);
  line(x-20,y,x+20,y);
  triangle(x-20,y,x-10,y,x-15,y-10);
  triangle(x+20,y,x+10,y,x+15,y-10);
}


