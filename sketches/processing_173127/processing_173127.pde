
float teglalapY;
float sebesseg = -10;
float gravitacio = 0.2;

void setup() {
  size(400, 300);
  rectMode(CENTER);
  background(#00E8FF);
  teglalapY  = height;
}

void draw() {
  background(#00E8FF);
  rect(width/2, teglalapY, 40, 40);
  teglalapY += sebesseg;
  sebesseg += gravitacio;
}


