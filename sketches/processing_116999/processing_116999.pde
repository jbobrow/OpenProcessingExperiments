
// the baby-step way to draw a line
// program for lectures on "The Wrong Way to Draw a Line"
// schien@mail.ncku.edu.tw

void setup() {
  size(500, 100);
  noLoop();
}

void draw() {
  background(255);
  strokeWeight(5);
  stroke(0, 30);
  line(20, 50, 480, 50);

  stroke(20, 50, 70); 
  int step = 10; 
  float ystep = 10;
  float lastx = -999; 
  float lasty = -999; 
  float y = 50; 
  int border = 20; 
  for (int x=border; x<=width-border; x+=step) { 
    ystep = random(20)-10;
    y+= ystep;
    if (lastx > -999) { 
      line(x, y, lastx, lasty);
    } 
    lastx = x; 
    lasty = y;
  }
}



