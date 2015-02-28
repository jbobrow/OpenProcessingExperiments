

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

void setup() {
  size(400, 400);
}

void draw() {
  background(0);

  //  println(second());

  angSec = map(second(), 0, 59, PI, -PI);
  angMin = map(minute(), 0, 59, PI, -PI);
  int valorHora = hour()%12;
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

  //Dibujamos 
 
   

    fill(255);
    strokeWeight(1);
    line(width/2, height/2, sec.x, sec.y);
    strokeWeight(4);
    line(width/2, height/2, min.x, min.y);
    strokeWeight(6);
    line(width/2, height/2, hora.x, hora.y);
    noFill();
    stroke(255);
   
   
    ellipse(width/2, height/2, radSec*2, radSec*2);
     if (!mousePressed) {    
  
    fill(#ffffff);
    textSize(32);
    text("9", radSec/2, height/2+8);  
    textSize(32);
    text("3",radSec*2, height/2+8); 
    textSize(32);
   text("12", width/2-17,radSec/2+8); 
    textSize(32);
 text("6", width/2-17,radSec*2+40); 
     }
  else   
{fill(#ffffff);
    textSize(32);
    point( radSec/2, height/2+8);  
    textSize(32);
    point(radSec*2+10, height/2+8); 
    textSize(32);
   point( width/2,radSec/2+8); 
    textSize(32);
 point( width/2,radSec*2+20); 
}
}


