
float mapnum = 0;
float circlesize = 0;

void setup() {
  size(800, 800);
  smooth();
  colorMode(HSB,360,100,100);
}

void draw() {
  //background(mapnum, 100, 100);
  strokeWeight(1);
  fill(123, mapnum, 345);
  
  mapnum = map(mouseX, 0, width, 0, 100);
  circlesize = map(mouseY,0,height,0,100);
  mapnum = map(mouseY, 0, height, 360, 0);
  ellipse(mouseX,mouseY,circlesize,circlesize);
  println(mapnum);

}
