
PShape s;

void setup() {
  size(800, 800);
  background(50);
   
}

void draw() {
  
  for (int y=20; y <=900; y+= 40) {
    for (int x=20; x <= 900; x+= 40) {
      fill((x+y)*.055);
      noStroke();
      beginShape();
      vertex(x-40, y-40);
      vertex(x-35, y-35);
      vertex(x-30, y-40);
      vertex(x-25, y-43);
      vertex(x-30, y-46);
      vertex(x-35, y-51);
      vertex(x-40, y-46);
      vertex(x-45, y-43);
      vertex(x-40, y-40);
      endShape();
    }
}
fill (244, 209, 0);
beginShape();
vertex(0, 437);
vertex(0,416);
bezierVertex(0, 416, 316, 31, 405, 250);
bezierVertex(546, 602, 789, 329, 800, 0);
vertex(809, 8);
bezierVertex(809, 8, 820, 228, 673, 388);
bezierVertex(503, 574, 492, 447, 399, 268);
bezierVertex(322, 122, 207, 153, 8, 425);
vertex(0, 437);
endShape();

 s = loadShape("tmount.svg");
  shape(s, 0, 0, width, height);

}




