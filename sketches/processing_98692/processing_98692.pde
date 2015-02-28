

//Creamos vector de posicion, y lo inicializamos
PVector sec = new PVector(0, 0);
PVector min = new PVector(0, 0);
PVector hora = new PVector(0, 0);

//valor del angulo, que iniciamos a 0
float angSec = 0;
float angMin = 0;
float angHora = 0;

//radio donde dibujaremos la bola (en FM!)
float radSec = 350;
float radMin = 300;
float radHora = 200;

void setup() {
  size(400, 400);
}

void draw() {
  background(0);

  angSec = map(second(), 0, 59, PI, -PI)-HALF_PI;
  angMin = map(minute(), 0, 59, PI, -PI)-HALF_PI;
  angHora = map(hour(), 0, 23, PI, -PI)-HALF_PI;

  

  //Dibujamos 
    noStroke();
    fill(#FF43FC,70);
    arc(width/2,height/2, radSec, radSec, 0-HALF_PI, 0-angSec, PIE);
    fill(#7CFFF7,80);
    arc(width/2,height/2, radMin, radMin, 0-HALF_PI, 0-angMin, PIE);
    fill(#FFFF7C,90);
    arc(width/2,height/2, radHora, radHora, 0-HALF_PI, 0-angHora, PIE);

  
}



