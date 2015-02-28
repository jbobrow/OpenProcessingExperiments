
void setup (){
  size (800,600);
}
void draw (){
background(0);
fill(252, 0,46,60);
noStroke();
smooth();
for (int y = -0; y <= 600; y += 20) {
for (int x = -0; x <= 800; x += 20) {
ellipse(x + y/4.8, y + x/3.8, 3 + x/20, 10);

}
}
}
void mousePressed(){
  saveFrame("1.JPG");
}

