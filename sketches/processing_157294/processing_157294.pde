


void setup() {
size(400, 400, P3D);
noFill();
smooth();
}

void draw() {
background(0);
  
translate(width/2, height/2, -(width/2));
rotateY(map(mouseX, 0, width, -PI, PI));
stroke(100);
box(200);
  
rotateX(map(mouseY, 0, height, -PI, PI));
stroke(150);
box(100);
}


