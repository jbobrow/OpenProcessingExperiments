
float posx, posy;
void setup() {
size(600,600);
background(116,110,100);
  smooth();
}

void draw() {
  posx=posx+(mouseX-posx)/50;
  posy=posy+(mouseY-posy)/50;
  fill(mouseY,mouseX,22,152);
  stroke(300,300,250,250);
  ellipse(posx,posy,posx,posx);
}


