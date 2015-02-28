
PShape logo;
PShape ID;

void setup() {
  size(670, 270);
  smooth();
  logo = loadShape("logo.svg");
  ID = loadShape("ID.svg");
} 

void draw() {
  background(255,255,255);
  
  translate(width/1000, height/3);
  shape(ID, 0, 0, 450, 125);
  
  translate(width/1.135, height/6.5);
  float zoom = map(mouseX, 1, width, 0.3, 0.8);
  scale(zoom);
  shape(logo, -150,-100);




}


