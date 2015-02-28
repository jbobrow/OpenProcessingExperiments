
float mapnum = 0;

void setup() {
  size(800, 600);
  smooth();
  colorMode(HSB,360,100,100);
}

void draw() {
  //background(mapnum, 100, 100);
  ellipse(pmouseX,pmouseY,mouseX,mouseY);
  fill(HSB,100,200,100);

  mapnum = map(mouseX, 0, width, 0, 360);
  mapnum = map(mouseY, 0, height, 360, 0);
  println(mapnum);

}
