
void setup () {
  size(500,500);
}
void draw() {
  background(49,79,167);
  fill(255); //punta pluma
  noStroke();
  rect(mouseX-80,mouseY-220,160,250);
  triangle((mouseX-80),mouseY+30,mouseX+80,mouseY+30,mouseX,mouseY+220);
  fill(49,79,167); //curvatura
  noStroke();
  ellipse(mouseX-80,mouseY-95,20,250);
  ellipse(mouseX+80,mouseY-95,20,250);
  //huecos
  rect(mouseX-2,mouseY+30,4,height);
  rect(mouseX-250,mouseY+205,width,height);
  ellipse(mouseX,mouseY+40,20,20);
  fill(80,136,255); //gota
  ellipse(mouseX,mouseY+235,18,18);
  triangle(mouseX-9,mouseY+235,mouseX+9,mouseY+235,mouseX,mouseY+211);
  fill(44); //agarre
  rect(mouseX-80,mouseY-230,160,10);
  rect(mouseX-95,mouseY-230,190,-25);
}


