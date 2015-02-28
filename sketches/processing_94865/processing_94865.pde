
void setup() {
  size(290, 290); // canvas size
  background(0); // background color
}

void draw() {
  hi(0, 0); // draw out thing
}

color pick() { // Random Color Flash Function
  return color(random(255), random(255), random(255)); // Return Color Command
}

void thing (int x, int y, color z) {
  fill(z); // color of head (blue)
  ellipse(140, 140, 220, 220); // shape of head
  fill(0); // black bar color
  rect(20+x, 80+y, 230, 10); // black bar #1 from top
  rect(30+x, 60+y, 210, 10); // black bar #2 from top
  rect(30+x, 40+y, 210, 10); // black bar #3 from top
  rect(35+x, 200+y, 210, 10); // black bar #4 from top
  rect(30+x, 220+y, 210, 10); // black bar #5 from top    
  fill(z); // flashing mole
  ellipse(40+x, 100+y, 10, 10); // mole shape 
  fill(255, 0, 0); // mouth layer #1 color (red)
  ellipse(140+x, 160+y, 190, 70); // oval for mouth layer #1
  fill(255, 10, 255); // mouth layer #2 and #3 color (green)
  ellipse(140+x, 160+y, 190, 50); // oval for mouth layer #2
  fill(z); // flashing mouth
  ellipse(140+x, 160+y, 190, 20); // oval for mouth layer #3
  fill(255, 0, 0); // eye layer #1 color (red)
  ellipse(90+x, 120+y, 100, 50); // green oval for eye layer #1
  fill(225, 255, 10); // eye layer #2 (yellow)
  ellipse(90+x, 120+y, 100, 30); // oval for eye layer #2
  fill(z); // blinking eyes #1
  ellipse(90+x, 120+y, 100, 10); // oval for eye layer #3
  fill(255, 0, 0); // eye layer #1 color (red)
  ellipse(190+x, 120+y, 100, 50); // eye layer #1 oval 
  fill(225, 255, 10); // eye layer #2 (yellow)
  ellipse(190+x, 120+y, 100, 30); // oval for eye layer #2
  fill(z); // blinking eyes #2
  ellipse(190+X, 120+y, 100, 10); // oval for eye layer #3
}

void hi (int x, int y) {
  thing(0+x, 0+y, pick ()); // color flash function call
}








