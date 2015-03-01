
void setup() {
size(500, 500);
}
void draw() {
  noStroke();
  fill(0,1);
  rect(0,0,500,500);
float s = dist(mouseX, mouseY, pmouseX, pmouseY) * -1;

fill(255, 230,150, 205);
ellipse(mouseX, mouseY, 65+s, 25+s);
stroke(255,150);
strokeWeight(-s);
line(mouseX, mouseY,mouseX,0);
}


