
color bg;
 
void setup() {
  size(1600, 1200);
}
 
void draw() {
  background(bg);
  if (mouseX >= 250) { bg = color(random(255), random(255), random(255)); }
  line(250, 0, 250, height);
}



