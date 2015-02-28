
//segundos
PVector segundos = new PVector(0, 0);
PVector segundos1 = new PVector(0, 0);
float angSegundos = 0;
float radioSegundos = 180;
//minutos
PVector minutos = new PVector(0, 0);
PVector minutos1 = new PVector(0, 0);
float angMinutos = 0;
float radioMinutos = 220;
//horas
PVector horas = new PVector(0, 0);
PVector horas1 = new PVector(0, 0);
float angHoras = 0;
float radioHoras = 240;



void setup() {
  size(500, 500);
}

void draw() {
  background(0);

  //horas  
  for (int k=0; k<24; k++) {

    //valores vectores horas 
    angHoras = map(hour(), 0, 24, 0, -TWO_PI)-PI;
    angHoras += PI*k/12;
    horas.x= width/2 + radioHoras * sin(angHoras);
    horas.y= height/2 + radioHoras * cos(angHoras);
    horas1.x= width/2 + (radioHoras - 100) * sin(angHoras);
    horas1.y= height/2 + (radioHoras - 100) * cos(angHoras);

    //dibuja lineas horas
    strokeWeight(5);
    strokeCap(ROUND);
    stroke(200-k*8, 200-k*8, 0);
    line(horas.x, horas.y, horas1.x, horas1.y);
  }

  //minutos  
  for (int j=0; j<60; j++) {
    angMinutos = map(minute(), 0, 60, 0, -TWO_PI)-PI;
    angMinutos += PI*j/29.8;
    minutos.x= width/2 + radioMinutos * sin(angMinutos);
    minutos.y= height/2 + radioMinutos * cos(angMinutos);
    minutos1.x= width/2 + (radioMinutos-100) * sin(angMinutos);
    minutos1.y= height/2 + (radioMinutos-100) * cos(angMinutos);

    strokeWeight(3);
    strokeCap(ROUND);
    stroke(190-j*3, 0, 200-j*3);
    line(minutos.x, minutos.y, minutos1.x, minutos1.y);
  }

  //segundos
  for (int i=0; i<60; i++) {
    angSegundos = map(second(), 0, 60, 0, -TWO_PI)-PI;
    angSegundos += PI*i/30;
    segundos.x= width/2 + radioSegundos * sin(angSegundos);
    segundos.y= height/2 + radioSegundos * cos(angSegundos);
    segundos1.x= width/2 + (radioSegundos-100) * sin(angSegundos);
    segundos1.y= height/2 + (radioSegundos-100) * cos(angSegundos);

    strokeWeight(2);
    strokeCap(ROUND);
    stroke(0, 200-i*3, 200-i*3);
    line(segundos.x, segundos.y, segundos1.x, segundos1.y );
  }
}



