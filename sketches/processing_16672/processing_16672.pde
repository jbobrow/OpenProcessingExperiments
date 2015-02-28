
void setup () {
  size (800, 600);
}
void draw (){
background(0);
stroke(234, 77,14,50);
for (int i = 0; i < 800; i++) {
float r = random(10);
strokeWeight(r);
float lineas = r + 7.0;
line(i-70, 440, i*lineas, 0);
}
}

void mousePressed(){
  saveFrame("1.JPG");
}


