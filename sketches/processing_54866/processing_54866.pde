
PShape logo;

void setup() {
  size(240, 240);
  smooth();
  logo = loadShape("logo.svg");
} 

void draw() {
  background(255,255,255);

  
  translate(width/1.9, height/2.5);
  float zoom = map(mouseX, 2, width, 1, 0.5);
  scale(zoom);
  shape(logo, -130,-100);



}


