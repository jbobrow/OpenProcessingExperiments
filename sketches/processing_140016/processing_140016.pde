
size(500,400);
background(0,255,255);
fill(0,0,0);
stroke(255,255,255);
ellipse(230,200,300,300);
stroke(255,255,255);
line(220,200,220,50);
line(240,200,240,50);
line(240,200,340,300);
line(220,200,120,300);
line(240,230,320,320);
line(220,230,140,320);
line(220,230,220,350);
line(240,230, 240,350);
    
// Move the mouse across the image
// to change its value

int value = 0;

void draw() {
  fill(value);
  ellipse(230,200,300,300)
  stroke(255,255,255);
line(220,200,220,50);
line(240,200,240,50);
line(240,200,340,300);
line(220,200,120,300);
line(240,230,320,320);
line(220,230,140,320);
line(220,230,220,350);
line(240,230, 240,350)
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}
