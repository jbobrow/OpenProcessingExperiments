
//Declaración e inicialización del Array.
float[] tiempo= {
  2.36, 2.50, 2.71, 2.82, 2.86, 3.40, 3.69, 3.82, 3.83, 4.11, 4.27, 4.57, 4.70, 0.00, 1.94, 2.03, 2.43, 2.78, 2.94, 2.98, 3.05, 3.36, 3.50, 3.58, 3.70, 4.10, 4.38, 4.48, 4.78, 4.79, 0.23, 1.92, 1.99, 2.19, 2.45, 2.69, 2.74, 2.93, 3.14, 3.38, 3.57, 3.74, 3.96, 4.36, 4.57, 4.79, 1.91, 1.99, 2.07, 2.33
};

float [] humor= {
  1.00, -2.00, -2.00, 0.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, -1.00, 1.00, 1.00, -1.00, -1.00, -1.00, -1.00, -1.00, -1.00, 1.00, -1.00, 1.00, 1.00, 1.00, -1.00, 1.00, 1.00, -1.00, 1.00, 1.00, 2.00, 2.00, 2.00, 2.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, -1.00, -1.00, 1.00, 1.00, 1.00, 1.00, 1.00
};

int [] ganas= {
  3, 5, 5, 4, 3, 4, 4, 3, 3, 4, 3, 4, 3, 3, 5, 3, 4, 5, 5, 3, 5, 5, 4, 4, 3, 5, 5, 5, 4, 3, 5, 4, 4, 4, 4, 4, 3, 4, 4, 3, 3, 3, 4, 3, 4, 4, 4, 4, 4, 4
};

float [] posx = new float [tiempo.length];
float [] posy = new float [tiempo.length];
float [] velx = new float [tiempo.length];
float [] vely = new float [tiempo.length];
float [] radio = new float [tiempo.length];
float [] red = new float [tiempo.length];






void setup() {
  //size(displayWidth, displayHeight);
  size(1024, 576);  
  smooth();

  for (int i=0; i<tiempo.length; i++) {
    posx [i] = map(tiempo[i], 0, 5, 50, width-50);//mapeo y asigno a el eje X a tiempo
    posy [i] = map(ganas[i], 3, 5, 60, height-60); //mapeo y asigno a eje y a ganas
    radio [i] = map(ganas[i], 3, 5, 20, 150); //mapeo y asigno al radio de las pelotas a humor
    red [i] = map(humor[i], -2, 2, 255, 100);
    velx [i] = map(tiempo[i], 0, 5, 1, 6);
    vely [i] = map(tiempo[i], 0, 5, 1, 6);
  }
}

void draw() {
  background(0);
  //stroke(255, 100);
  textSize(12);

  for (int i=0; i<tiempo.length; i++) {

    posx [i] = posx[i] + velx[i];
    posy [i] = posy [i] + vely[i];

    if (posx [i] < 0 || posx[i] >width) {
      velx[i]=-velx[i];
    }
    if (posy[i] <0 || posy[i] >height) {
      vely[i]=-vely[i];
    }
    //DIBUJO LOS CIRCULOS

    noStroke ();
    fill (red[i], 0, 255-red[i], 180);
    ellipse (posx[i], posy[i], radio[i], radio[i]);

    //DIBUJO LAS LINEAS DD EL CENTRO CON MOUSE

    if (mousePressed && (mouseButton == LEFT)) {
      stroke (255);
      strokeWeight(.2);
      noFill();
      line (width/2, height/2, posx[i], posy[i]);

      fill(190);
      text(velx[i], posx[i]+10, posy[i]-10);
      noStroke();
      fill(255);
      text("RELACIÓN DE VELOCIDAD | MOMENTO DEL DÍA", 20, 20);
    }
  }



  //DIBUJO EL SHAPE.CON MOUSE

  if (mousePressed && (mouseButton == RIGHT)) {



    beginShape ();
    for (int j=0; j<tiempo.length; j++) {

      //noStroke();
      fill(190);
      text(j, posx[j]+10, posy[j]-10);
      noStroke();
      fill(255);
      text("ORDEN CRONOLÓGICO", 20, 20);
      stroke (255);
      strokeWeight(.2);
      noFill();
      vertex (posx[j], posy[j]);
    }
    endShape (CLOSE);
  }


  //DIBUJO DE ESCALAS Y REFES



  for (int i=0; i<4; i++) { //escala de color: humor
    float red2=map(i, 0, 3, 255, 100);
    fill(red2, 0, 255-red2, 180);
    noStroke();
    ellipse (200+i*25, height-100, 20, 20);

    String s = "HUMOR | Malo -> Bueno --->";
    fill(127);
    text(s, 10, height-95);
  }

  for (int i=0; i<3; i++) { //escala de tamaño: ganas
    float radio2=map(i, 0, 2, 20, 150);
    fill(0, 50);
    strokeWeight(.2);
    stroke(180);
    smooth();
    ellipse (370, height-120, radio2, radio2);

    String s = "GANAS | Pocas (chico) -> Muchas (grande) --->";
    fill(127);
    text(s, 10, height-120);
  }
}

void keyPressed () { //puede usarse tambien "mousePressed"
  if (key=='s') {
    saveFrame ("img.png");
  }
  
}


//println (posx);



