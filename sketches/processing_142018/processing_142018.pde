
PVector segundos = new PVector(0,0);
PVector minutos = new PVector (0,0);
PVector horas = new PVector (0,0);

int sz = 20;

float angSegundos = 5;
float radioSegundos = 150;

float angMinutos = 5;
float radioMinutos = 150;

float angHoras = 5;
float radioHoras = 150;



void setup(){
 size (400,400); 
}

void draw(){
  
   
float cSegundos = map(second(),0,59,0,255);
float cMinutos = map(minute(),0,59,0,255);
float cHoras = map(hour(),0,23,255,0);

  
  //println(second());
  //println(hour());
  //println(cHoras);
  //println(cMinutos);
  //println(cSegundos);
  
 
noStroke();
  fill(cHoras,10);
  rect(0,0,width,height);
  
  angSegundos = map(second(),0,59,0,-TWO_PI);
  angSegundos += PI;
  
  angMinutos = map(minute(),0,59,0,-TWO_PI);
  angMinutos += PI;
  
  angHoras = map(hour()%12,0,11,0,-TWO_PI);
  angHoras += PI;
   
  segundos.x = width/2 + radioSegundos * sin(angSegundos);
  segundos.y = height/2 + radioSegundos * cos(angSegundos);
  
  minutos.x = width/2 + radioMinutos * sin(angMinutos);
  minutos.y = height/2 + radioMinutos * cos(angMinutos);
  
  horas.x = width/2 + radioHoras * sin(angHoras);
  horas.y = height/2 + radioHoras * cos(angHoras);

 /////dibujamos las ellipses con los colores variables segun el tiempo//////////

  noStroke();
 
  fill(cHoras,cSegundos,cMinutos);
  ellipse(horas.x, horas.y, sz*2,sz*2);
 
  fill(cMinutos,cHoras,cSegundos);
  ellipse(minutos.x, minutos.y, sz,sz);
 
  fill(cSegundos,cMinutos,cHoras);
  ellipse(segundos.x, segundos.y, sz/2,sz/2);
  
}


