
PVector segundos = new PVector(0, 0);
PVector minutos = new PVector(0, 0);
PVector horas = new PVector(0, 0);

float angSegundos;
float radioSegundos = 170;

float angMinutos;
float radioMinutos = 120;

float angHoras;
float radioHoras = 70;

int sz = 15;
int separacion = 5;

color fillSeg, fillMin, fillHoras;


void setup() {
  size(500, 500);
  //frameRate(1);
  fillSeg = color(255, random(0,127), random(100,127));
  fillMin = color(random(10,50), random(170,200), random(10,50));
  fillHoras = color(random(0,127), random(0,127), 255);
}

void draw() {
  background(0);

  // segundos
  angSegundos = map(second(), 0, 60, 0, -TWO_PI);
  angSegundos += PI;
  segundos.x = width/2 + radioSegundos * sin(angSegundos);
  segundos.y = height/2 + radioSegundos * cos(angSegundos);

  // minutos
  angMinutos = map(minute(), 0, 60, 0, -TWO_PI);
  angMinutos += PI;
  minutos.x = width/2 + radioMinutos * sin(angMinutos);
  minutos.y = height/2 + radioMinutos * cos(angMinutos);

  // horas  
  angHoras = map(hour()%12, 0, 12, 0, -TWO_PI);
  angHoras += PI;  
  horas.x = width/2 + radioHoras * sin(angHoras);
  horas.y = height/2 + radioHoras * cos(angHoras);


  if (mousePressed) {
    // reloj de agujas
    frameRate(30);
    strokeWeight(4);
    stroke(255);
    for (float i=0; i < TWO_PI; i+=TWO_PI/12) {
       rect(width/2 + (radioSegundos-20) * sin(i) - 2, height/2 + (radioSegundos-20) * cos(i) - 2, 4, 4);
      
    }

    strokeWeight(9);
    stroke(random(255), random(255), random(255));
    line(width/2, height/2, minutos.x, minutos.y);

    strokeWeight(7);
    stroke(random(255), random(255), random(255));
    line(width/2, height/2, horas.x, horas.y);


    strokeWeight(2);
    stroke(random(255), random(255), random(255));
    line(width/2, height/2, segundos.x, segundos.y);
  }
  else {
    // bolas
    frameRate(1);
    noStroke();
    
    fill(random(255), random(255), random(255));
    ellipse(width/2, height/2, radioSegundos*2, radioSegundos*2);
    
    fill(fillSeg);
    ellipse(width/2, height/2, radioSegundos*2 - separacion, radioSegundos*2 - separacion);
    //ellipse(segundos.x, segundos.y, sz, sz);
    
    fill(random(255), random(255), random(255));
    ellipse(width/2, height/2, radioMinutos*2, radioMinutos*2);
    
    fill(fillMin);
    ellipse(width/2, height/2, radioMinutos*2 - separacion, radioMinutos*2 - separacion);
    ellipse(minutos.x, minutos.y, sz, sz);
    
    fill(random(255), random(255), random(255));
    ellipse(width/2, height/2, radioHoras*2, radioHoras*2);
    
    fill(fillHoras);
    ellipse(width/2, height/2, radioHoras*2 - separacion, radioHoras*2 - separacion);
    ellipse(horas.x, horas.y, sz, sz);
    
    pushMatrix();
    translate(segundos.x, segundos.y);
    rotate(angSegundos+PI);
    fill(random(255), random(255), random(255));
    scale(3);
    triangle(-3, 1, 0, -5, 3, 1);
    popMatrix();
  }
}




