
float posx, posy;
void setup() {
size(600,600, P3D);
background(65,396,325);
  smooth();
}

void draw() {
  background(13,13,13);
  posx=posx+(mouseX-posx)/10;
  posy=posy+(mouseY-posy)/10;
  fill(mouseY,mouseX,13);
  stroke(255,3,3);
  //translate(+width/2, +height/2, 10);
  ellipse(posx,posy,150,150);
}


