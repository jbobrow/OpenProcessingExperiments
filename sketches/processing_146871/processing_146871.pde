
PVector segundos = new PVector(0, 0);
PVector minutos = new PVector(0, 0);
PVector horas = new PVector(0, 0);

float angSegundos = 5;
float radioSegundos = 150;

float angMinutos = 5;
float radioMinutos = 100;

float angHoras = 5;
float radioHoras = 50;

float sz1 = 0;
float sz2 = 0;
float sz3 = 0;
float trans1 = 0;
float trans2 = 0;
float trans3 = 0;
float onda1 = 0;
float onda2 = 0;
float onda3 = 0;

void setup() {
  size(500, 500);
}

void draw() {
  //println(second());

  trans1 = random(255); 
  trans2 = random(255); 
  trans3 = random(255); 

  fill(trans1, trans2, trans3);
  rect(0, 0, width, height);
  noFill();


  angSegundos = map(second(), 0, 60, 0, -TWO_PI);
  angSegundos += PI;

  segundos.x = width/2 + radioSegundos * sin(angSegundos);
  segundos.y = height/2 + radioSegundos * cos(angSegundos);

  //Minutos

    angMinutos = map(minute(), 0, 60, 0, -TWO_PI);
  angMinutos += PI;

  minutos.x = width/2 + radioMinutos * sin(angMinutos);
  minutos.y = height/2 + radioMinutos * cos(angMinutos);

  //Horas
  angHoras = map(hour(), 0, 12, 0, -TWO_PI);
  angHoras += PI;


  horas.x = width/2 + radioHoras * sin(angHoras);
  horas.y = height/2 + radioHoras * cos(angHoras);

  //Mostrar
  stroke(random(255), random(255), random(255));
  if(onda1 < width){
  onda1 +=10;
  }else{
  onda1 = 0;
  }
  
  if(onda2 < width){
  onda2 +=50;
  }else{
  onda2 = 0;
  }
  
  if(onda3 < width){
  onda3 +=100;
  }else{
  onda3 = 0;
  }
  ellipse(width/2, height/2, onda1, onda1);
  ellipse(width/2, height/2, onda2, onda2);
  ellipse(width/2, height/2, onda3, onda3);
  
  noStroke();
  sz1 = random(5, 30);
  fill(random(255));
  ellipse(segundos.x, segundos.y, sz1, sz1);
  sz2 = random(10, 40);
  fill(random(255));
  ellipse(minutos.x, minutos.y, sz2, sz2);
  sz3 = random(20, 50);
  fill(random(255));
  ellipse(horas.x, horas.y, sz3, sz3);
}



