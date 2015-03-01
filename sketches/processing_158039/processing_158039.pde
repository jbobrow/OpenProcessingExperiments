
int perro = 0;
void setup() {
  size(500,500);
}
void draw() {
  perro = perro+2;
  fill(119,214,250);
  ellipse(perro,height/2,50,50);
  ellipse(perro,height/4,50,50);
  ellipse(perro,height/20,50,50);
  ellipse(perro,height/2,50,50);
  ellipse(perro,height-140,50,50);
  ellipse(perro,height-40,50,50);
  ellipse(width/2, perro, 50,50);
  ellipse(width/4, perro, 50,50);
  ellipse(width-40, perro, 50,50);
  ellipse(width-140, perro, 50,50);
  ellipse(width/16, perro, 50,50);
}


