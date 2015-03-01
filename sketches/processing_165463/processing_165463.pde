
void setup() {
  size(500, 500);
  background(255);
}

void draw() {

  background(255);

  fill(211, 172, 121);
  strokeWeight(7);
  ellipseMode(CENTER);

  ellipse(mouseX, mouseY+40, 250, 125); //bajo cara

  noStroke();
  fill(81, 64, 48);
  ellipse(mouseX-144, mouseY-30, 100, 110);
  ellipse(mouseX+144, mouseY-30, 100, 110);

  fill(211, 172, 121);
  stroke(0);
  arc(mouseX, mouseY-50, 250, 125, PI, 2*PI); //frente

  fill(81, 64, 48);
  bezier(mouseX-125, mouseY+15, mouseX-140, mouseY+75, mouseX-220, mouseY-30, mouseX-190, mouseY-60); //oreja derecha
  bezier(mouseX-190, mouseY-60, mouseX-145, mouseY-100, mouseX-170, mouseY-100, mouseX-105, mouseY-89);

  bezier(mouseX+125, mouseY+15, mouseX+140, mouseY+75, mouseX+220, mouseY-30, mouseX+190, mouseY-60); //oreja izquierda
  bezier(mouseX+190, mouseY-60, mouseX+145, mouseY-100, mouseX+170, mouseY-100, mouseX+105, mouseY-89);

  fill(211, 172, 121);
  noStroke();
  rect(mouseX-125, mouseY-55, 250, 95); //relleno cara

  fill(81, 64, 48);

  noStroke();
  bezier(mouseX-35, mouseY+70, mouseX-20, mouseY-70, mouseX-20, mouseY-100, mouseX-140, mouseY-30); //manchas ojos
  bezier(mouseX+140, mouseY-30, mouseX+20, mouseY-100, mouseX+20, mouseY-70, mouseX+35, mouseY+30);

  noStroke();
  ellipse(mouseX-115, mouseY-61, 40, 52);
  ellipse(mouseX+115, mouseY-61, 40, 52);

  stroke(0);
  strokeWeight(7);
  line(mouseX-125, mouseY+40, mouseX-125, mouseY-50);
  line(mouseX+125, mouseY+40, mouseX+125, mouseY-50);

  fill(81, 64, 48);
  noStroke();
  ellipse(mouseX, mouseY+50, 175, 100); //morro

  fill(255);
  stroke(0);
  strokeWeight(3);
  ellipse(mouseX-80, mouseY-8, 85, 85); //ojos
  ellipse(mouseX+80, mouseY-8, 85, 85);

  fill(0);
  noStroke();
  ellipse(mouseX-85, mouseY-3, 60, 60); //pupilas
  ellipse(mouseX+85, mouseY-3, 60, 60);

  ellipse(mouseX, mouseY+25, 60, 35); //nariz

  noFill();
  stroke(0);
  bezier(mouseX+70, mouseY+50, mouseX+30, mouseY+120, mouseX+10, mouseY+55, mouseX+5, mouseY+55); //boca
  bezier(mouseX-70, mouseY+50, mouseX-30, mouseY+120, mouseX-10, mouseY+55, mouseX-5, mouseY+55);
  bezier(mouseX-5, mouseY+55, mouseX-3, mouseY+53, mouseX, mouseY+47, mouseX+5, mouseY+55);

  strokeWeight(0.5); //bigote
  ellipse(mouseX-40, mouseY+50, 5, 5);
  ellipse(mouseX-50, mouseY+60, 5, 5);
  ellipse(mouseX-30, mouseY+55, 5, 5);
  ellipse(mouseX+40, mouseY+50, 5, 5);
  ellipse(mouseX+50, mouseY+60, 5, 5);
  ellipse(mouseX+30, mouseY+55, 5, 5);
}

