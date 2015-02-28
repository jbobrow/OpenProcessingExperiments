
//Giovanna Marrone
//Título: Obra eterna
//Data: 14/05/2013

PFont myFont;
void setup() {
  frameRate(10);
  background(#4DD4F7);
  size(400, 200);
  myFont = createFont("FFScala", 16);
  textFont(myFont);
  text("Giovanna Marrone", 10, 20);
}

void draw() {
  
myFont = createFont("FFScala", 16);
  textFont(myFont);
  stroke(255);
  text("Giovanna Marrone", 10, 20);
  noFill();
  bezier(0, height, 100, 0, width, 200, 500, 0);
  stroke(255);
  fill(255);
  rect(100, 50, 200, 75);//prédio principal
  stroke(#4D2C01);
  strokeWeight(3);
  line(50, 100, 50, 200);//tronco 1
  line(50, 120, 40, 85);//galho 1.1
  line(50, 130, 70, 80);//galho 1.2
  line(50, 140, 75, 105);//galho 1.3
  line(325, 75, 325, 200);//troco 2
  line(325, 85, 350, 75);//galho 2.1
  line(325, 90, 315, 80);//galho 2.2
  line(350, 50, 350, 200);//tronco 3
  line(350, 57, 340, 50);//galho 3.1
  line(350, 70, 357, 56);//galho 3.2

  for (int p = 105; p < 280; p = p + 10) {//pilotis
    stroke(255);
    rect(p, 125, (p - 110)/16, 75);
  }

  for (int q = 110; q < 270; q = q + 25) {//janelas
    fill(#2CE6F5);
    stroke(#2CE6F5);
    rect(q, 75, q/10, 25);
  }

  stroke(#EFEDF5);
  for (int l = 100; l <300; l = l + 5) { 
    line(l, 50, l, 125); // grades da fachada
  }

  if (mouseX > 100 && mouseX < 200) {
    noStroke();
    fill(240, 176, 15);
    ellipse(50, 100, 60, 60);//copa da árvore - seca 1
    ellipse(325, 90, 60, 100);//copa da árvore - seca 2
    ellipse(350, 70, 50, 70);//copa da árvore - seca 3

    stroke(#FCF78C);
    fill(#FCF78C);
    ellipse(375, 15, 30, 30);// sol
  }
  else

      if (mouseX > 200) {
      noStroke();
      fill(21, 234, 72);
      ellipse(50, 100, 60, 60);//copa da árvore - verde 1
      fill(#0DCB04);
      ellipse(325, 90, 60, 100);//copa da árvore - verde 2
      fill(#10E88C);
      ellipse(350, 70, 50, 70);//copa da árvore - verde 3
    }

  if (mouseX < 100) {
    background(#4DD4F7);
    noFill();
    bezier(0, height, 100, 0, width, 200, 500, 0);
    stroke(255);
    fill(255);
    rect(100, 50, 200, 75);//prédio principal
    stroke(#4D2C01);
    strokeWeight(3);
    line(50, 100, 50, 200);//tronco 1
    line(50, 120, 40, 85);//galho 1.1
    line(50, 130, 70, 80);//galho 1.2
    line(50, 140, 75, 105);//galho 1.3
    line(325, 75, 325, 200);//troco 2
    line(325, 85, 350, 75);//galho 2.1
    line(325, 90, 315, 80);//galho 2.2
    line(350, 50, 350, 200);//tronco 3
    line(350, 57, 340, 50);//galho 3.1
    line(350, 70, 357, 56);//galho 3.2
    
    
    for (int p = 105; p < 280; p = p + 10) {//pilotis
      stroke(255);
      rect(p, 125, (p - 110)/16, 75);
    }

    for (int q = 110; q < 270; q = q + 25) {//janelas
      fill(#2CE6F5);
      stroke(#2CE6F5);
      rect(q, 75, q/10, 25);
    }

    stroke(#EFEDF5);
    for (int l = 100; l <300; l = l + 5) { 
      line(l, 50, l, 125); // grades da fachada
    }
    
    stroke(#FCF78C);
    fill(#FCF78C);
    ellipse(375, 15, 30, 30);// sol

  }
}
