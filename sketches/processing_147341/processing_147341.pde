
//EN AQUESTA PRÀCTICA 4 PRENDRÉ COM A ELEMENT PRINCIPAL D'ITERACIÓ LA MONEDA,
//I ESBORRARÉ LA RESTA D'ELEMENTS PER NO CREAR CONFUSIÓ.

//VARIABLES
float v;
float xpos; 
float ypos;

//SETUP
void setup() {
  size(1000, 700);
  xpos=(width/2); 
  ypos=(height/2);
  v=5;

  print("MARC ALONSO - 20N GEDI - GRUP1 - INFORMÀTICA");
}

void draw() {

  background(100, 200, 255);
  noStroke();
  smooth();

  VariarPosicio();
  NoPassarLimits();

  //MONEDA


  fill(180, 180, 0);
  if (xpos>(3*width/4)) {
    fill(random(255), random(255), random(255));
  }
  ellipse(xpos, ypos, 160, 160);
  fill(220, 220, 0);
  if (xpos>(3*width/4)) {
    fill(random(255), random(255), random(255));
  }
  ellipse(xpos, ypos, 155, 155);
  fill(200, 200, 0);
  if (xpos>(3*width/4)) {
    fill(random(255), random(255), random(255));
  }
  ellipse(xpos, ypos, 145, 145);
  fill(250, 250, 0);
  if (xpos>(3*width/4)) {
    fill(random(255), random(255), random(255));
  }
  ellipse(xpos, ypos, 140, 140);

  //si la moneda és la zona 3/4 de la pantalla, la moneda
  //canviarà de colors.

  //si cliques el mouse, el random walker es converteix
  //en 10 monedes que es mouen aleatòriament.
  if (mousePressed) {
    for (int i=0;i<100;i=i+100) {
      xpos=random(width); 
      ypos=random(height);
    }
  }

  //canonada verda
  stroke(0);
  strokeWeight(2);
  fill(0, 215, 100);
  rect(600, 200, 250, 50);
  rect(620, 250, 210, 360);

  //base
  strokeWeight(5);
  fill(150);
  rect(-100, 610, 200, 100);
  rect(-100+200, 610, 200, 100);
  rect(-100+400, 610, 200, 100);
  rect(-100+600, 610, 200, 100);
  rect(-100+800, 610, 200, 100);
  rect(-100+1000, 610, 200, 100);
}

void VariarPosicio() {
  float w = random(20);

  if (w < 5) {
    xpos = xpos+v;
  } 
  else if (w < 10) {
    xpos = xpos-v;
  } 
  else if (w<15) {
    ypos = ypos -v;
  } 
  else if (w<20) {
    ypos = ypos +v;
  }
}

void NoPassarLimits() {

  if (xpos < 0) {
    xpos = 0;
  }
  if (xpos>width) {
    xpos=width;
  }
  if (ypos < 0) {
    ypos = 0;
  }
  if (ypos>height) {
    ypos=height;
  }
}



