
PShape figura;
String [] figuras = {"rabisco.svg", "rabisco2.svg", "rabisco3.svg"};

void setup (){
  size (500, 500);
  background (255);
  smooth();
  stroke(120);
}

void draw(){
  
}

void mouseDragged(){
  int sorteio = round(random (2));
  // int sorteio = round (random(figuras.lrnght-1));
  figura = loadShape(figuras [sorteio]);
  figura.disableStyle();
  figura.rotate(radians(random(360)));
  figura.scale(random(0.1, 0.9));
  fill (random(255), random(255), random(255));
  shape(figura, mouseX, mouseY);
}

