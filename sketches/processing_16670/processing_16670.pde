
void setup (){
  size (800,600);

}
void draw (){
  background(0);
  fill(47, 58,149,50);
noStroke();
smooth();
for (int y = -10; y <= 800; y += 26) {
for (int x = -10; x <= 600; x += 26) {
ellipse(x + y/1.0, y + x/1.8, 35 + x/12, 20);

}
}
}
void mousePressed(){
  saveFrame("1.JPG");
}

