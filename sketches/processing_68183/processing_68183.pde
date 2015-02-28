
void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100);
}
void draw() {
  fill(frameCount60, 100, 100, 25);
  rect(0, 0, width, height);
  scale(2);
  translate(width*.25-100, height*.25+sin(frameCount*.08)*50);
  rotate(sin(frameCount*.03)*QUARTER_PI);
  fill((frameCount+180)60, 100, 100);
  text("Creative Computing PUDT 1203 F",0, 0);
  text("Instructor: Ben Norskov", 0, 20);
  text("Room: 425", 20, 40);
}
