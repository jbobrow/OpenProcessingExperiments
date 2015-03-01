
float ancho;
int largo;
int posx;
int velx;
boolean anada;
float incremento;

void setup() {
  size (600, 100);
  ancho = 25;
  largo = 25;
  posx = width/2;
  velx = 2;
  incremento = 0.5;
}


void draw() {
  background(200);

  stroke(0);
  line(0, height/2, width, height/2);

  stroke(255, 0, 0);
  line(100, 0, 100, height);
  line(500, 0, 500, height);
  line(100+25, 0, 100+25, height);
  line(500-25, 0, 500-25, height); 

  noStroke();
  fill(255);
  ellipse(posx, height/2, ancho, largo);

  if (anada==true) {
    posx = posx + velx;
  } else {
    posx = posx - velx;
  }

  if (posx<100+25/2) {
    anada=true;
    //println("anada");
  }
   else if(posx>500-25/2) {
    //println("tornada");
    anada=false;
  }
  if (anada==true && posx>500-25-25/2) {
  ancho = ancho - incremento;
  }
  else if (anada==false && posx>500-25-25/2) {
  ancho = ancho + incremento;
  }
  if (anada==false && posx<100+25+25/2) {
  ancho = ancho - incremento;
  }
  else if (anada==true && posx<100+25+25/2) {
  ancho = ancho + incremento;
  }
  
}

