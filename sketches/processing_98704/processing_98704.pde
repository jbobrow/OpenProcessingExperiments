
///////////////////////////////////////////////////////////////////////////////


// yo no soy yo_


///////////////////////////////////////////////////////////////////////////////


// Práctica 04_ Workshop Grafía Manual Degenerativa


///////////////////////////////////////////////////////////////////////////////


// Pero el silencio es cierto. No, no estoy sola. 
//           Por eso escribo. Estoy sola y escribo.
//                   No, no estoy sola. Hay alguien aquí que tiembla.
// Alejandra Pizarnik


///////////////////////////////////////////////////////////////////////////////


float posX, posY;
float varX, varY;
int angulo;

void setup() {
  size(1300, 700);
  background(230);
  smooth();
  frameRate(15);
  noCursor();
}

void draw() {

  noStroke();
  fill (230, 230, 230, 40);
  ellipse (width/2, height/2, 1500, 1500);

// Calcular posición X / Y

  posX = noise ( varX) * 800;
  varX = varX + 0.0148;


  posY = noise ( varY) * 180;
  varY = varY + 0.0148;

// ruido + -

  fill(173, 2, 2, 79);
  noStroke();
  ellipse(width/2, mouseY, posX%150, posX%150);

  noFill();
  strokeWeight(random(0, 15));
  stroke(255, 255, 255);
  ellipse(mouseX, pmouseY, posX%290, posX%290);

  strokeWeight(random(0, 3));
  stroke(100, 100, 100, random(10, 100));
  line (width/2, mouseY, mouseX, mouseY);
  line (pmouseY, mouseX, width/2, mouseY);

  strokeWeight(random(0, 15));
  stroke(150, 150, 150, random(0, 190));
  ellipse(mouseY, pmouseX, posX%270, posX%270);


  if ((keyPressed == true) && (key == 'a')) {

    girar();
    strokeWeight(random(0, 1));
    stroke(random(255, 20), random (255, 20), 255);
    noFill();
    ellipse(0, 0, angulo, angulo);
    angulo++;
  }
}

void girar() {

  translate(width/2, mouseY);
  rotate(random( angulo));
}


