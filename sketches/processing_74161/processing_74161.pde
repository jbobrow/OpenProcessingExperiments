
float hi;
void setup() {
  size(700, 700);
  background(random(255), random(255),random(255));
  fill(random(255), random(255),random(255));
  hi= 1;
}

void draw() {
  fill(random(255), random(255),random(255));
  ellipse(mouseX, mouseY, 10, 10);
  ellipse(pmouseX, pmouseY, 10, 10);
  line(mouseX, mouseY, pmouseX, pmouseY);
  translate(width/2, height/2);
  rotate(radians(frameCount%360));
  scale(hi);
  hi = hi *0.95;
  if (hi<.01) hi=4;
  fill(random(255), random(255),random(255));
  ellipse(0, 0, width, height);
  PFont apercu=loadFont("Apercu-Medium-100.vlw");
  textFont(apercu);
  fill(#03FF93);
  textSize(400);
  text('g', 0, 0);

}


