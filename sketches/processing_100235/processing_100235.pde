
PShape Shape;

void setup(){
  size(400, 400);
  smooth();
  background(255);
  frameRate(6);
  
  Shape = loadShape("processing.svg");
  shapeMode(CENTER);
}

void draw(){
  float ratio = random(1, 4);
 
 shape(Shape, random(width), random(height), Shape.width/ratio, Shape.height/ratio);
}




