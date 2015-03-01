
void setup () {
  size(255, 255);
  int mida= 25;


  fill(255);
  
}

void draw() {
  background(0);
  int espai= 25;
  int est= 2;
  
  
  fill(255);
  int mida= 25;
  int dist= 5;


  strokeWeight (2);
  stroke (255);

  //cuerpo
  fill(255, mouseX, 0);
  ellipse(mouseX-mida, mouseY-mida*2, mouseY/6, mouseY/6);
  ellipse(mouseX+mida, mouseY-mida*2, mouseY/6, mouseY/6);
  line(mouseX-mida, mouseY-mida*2, mouseX+mida/4, mouseY+mida/4);
  line(mouseX+mida, mouseY-mida*2, mouseX-mida/4, mouseY+mida/4);

  fill(25, 100, mouseX);
  ellipse(mouseX, mouseY+mida, mouseY, mouseY);
  //cara
  fill(mouseY, mouseX, mouseY);
  ellipse(mouseX, mouseY, mouseY/2, mouseY/2);

  //ojo izq
  fill(63, 201, 161);
  ellipse(mouseX-dist, mouseY-dist, mouseY/5, mouseY/5);
  fill(255);
  ellipse(mouseX-dist, mouseY-dist, mouseY/10, mouseY/10);
  fill(0);
  ellipse(mouseX-dist, mouseY-dist, mouseY/20, mouseY/20);
  //ojo derecho
  fill(63, 201, 161);
  ellipse(mouseX+dist, mouseY-dist, mouseY/5, mouseY/5);
  fill(255);
  ellipse(mouseX+dist, mouseY-dist, mouseY/10, mouseY/10);
  fill(0);
  ellipse(mouseX+dist, mouseY-dist, mouseY/20, mouseY/20);

  //boca
  ellipse(mouseX, mouseY, mouseY*0.1, mouseY*0.1);
}

