
PShape logo;



void setup() {
  size(800,800);
  smooth();
  logo = loadShape("logo.svg");
  shapeMode(CENTER);
}

void draw(){
  background(255);
  
  shape(logo, mouseX, mouseY, 100,100);
  
  
  
}

