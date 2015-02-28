
//Creamos vector de posiciÃ³n, y lo inicializamos
PVector sec = new PVector(0, 0);
PVector min = new PVector(0, 0);
PVector hora = new PVector(0, 0);
//tamaÃ±o para la bola
int sz = 20;
//valor del Ã¡ngulo, que iniciamos a 0
float angSec = 0;
float angMin = 0;
float angHora = 0;

//radio donde dibujaremos la bola (en FM!)
float radSec = 150;
float radMin = 100;
float radHora = 50;

int intervalsec = 1000;
int lastRecordedTimesec = 0;

void setup() {
  size(400, 400);
}

void draw() {
  int sec1= second();
  background(sec1*4);

  angSec = map(second(), 0, 59, PI, -PI);
  angMin = map(minute(), 0, 59, PI, -PI);
  int valorHora = hour();
  angHora = map(valorHora, 0, 23, PI, -PI);

  /*convertimos las coordenadas de polares a cartesianas
   es decir, lo que calculamos en base a radio y Ã¡ngulo, lo pasamos
   a las conocidas coordenadas de X e Y para el dibujo
   y lo hacemos respecto a witdth/2 y height/2*/
  sec.x = width/2 + (radSec * sin(angSec));
  sec.y = height/2 + (radSec * cos(angSec));
  min.x = width/2 + (radMin * sin(angMin));
  min.y = height/2 + (radMin * cos(angMin));
  hora.x = width/2 + (radHora * sin(angHora));
  hora.y = height/2 + (radHora * cos(angHora));
  
   strokeWeight(2);
    triangle(sec.x,sec.y,min.x,min.y,hora.x,hora.y);
    line(width/2, height/2, sec.x, sec.y);
    line(width/2, height/2, min.x, min.y);
    line(width/2, height/2, hora.x, hora.y);


    strokeWeight(1);
    fill(100,0,0);
    triangle(sec.x,sec.y,min.x,min.y,width/2,height/2);
    fill(150,0,0);
    triangle(min.x,min.y,hora.x,hora.y,width/2,height/2);
    fill(200,0,0);
    triangle(hora.x,hora.y,sec.x,sec.y,width/2,height/2);
    
    
    
    if(millis()-lastRecordedTimesec>intervalsec){
    println(sec1);
    lastRecordedTimesec = millis();
  
   
  }
    



}
