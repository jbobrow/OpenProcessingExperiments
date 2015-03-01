
void setup() {
  frameRate(30);
  
}

void draw() {
  
size(800, 600);
background(0);
smooth();
for (int y = 32; y <= height; y += 35){
 for (int x = 12; x <= width; x += 15) {
  ellipse(x, y, 56 - y/50.0, 56 - y/50.0);
  
}
 }
strokeWeight(4);
fill(255, 0, 0);
ellipse(278, -100, 400, 400);
strokeWeight(4);
fill(0, 26, 51);
ellipse(278, 300, 400, 400);
strokeWeight(4);
fill(255, 0, 0);
ellipse(278, 700, 400, 400);
strokeWeight(4);
fill(0, 26, 51);
ellipse(678, -100, 400, 400);
strokeWeight(4);
fill(255, 0, 0);
ellipse(678, 300, 400, 400);
strokeWeight(4);
fill(0,26, 51);
ellipse(678, 700, 400, 400);
strokeWeight(4);
fill(0, 26, 51);
ellipse(-122, -100, 400, 400);
strokeWeight(4);
fill(255, 0, 0);
ellipse(-122, 300, 400, 400);
strokeWeight(4);
fill(0, 26, 51);
ellipse(-122, 700, 400, 400);
strokeWeight(4);
println(frameCount);
}

