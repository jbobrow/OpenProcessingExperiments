
//Maria Zaragoza Grup PES
//Anna del Corral

int numdibuixos = 100;
int i; //reconeixer i fora per aixi no haver-la de repetir


float [] posicioX = new float [numdibuixos]; // array que diu que per cada numdibuixos hi haura una posicioX
float [] posicioY = new float [numdibuixos]; // es float perque no es tracta nomes de numeros sencers
float [] velocitatX = new float [numdibuixos];
float [] velocitatY = new float [numdibuixos];
int [] sz = new int [numdibuixos]; // hi haura una mida per cada numdibuixos

void setup(){
  size(800,800);
  //inicialitzem posicions i velocitats:
  for (i = 0; i<numdibuixos; i++){ //la i representa cada pilota fins a 4 (comptant amb el 0!)
    posicioX [i] = width/2; //cada bola em començarà al 0,0
    posicioY [i] = height/2;
    velocitatX [i] = random(3); //velocitats randoms son les que fan que es moguin com vulguin! tant en y com en x!
    velocitatY [i] = random(3); //no fa falta posar float perque el random ja dona numeros decimals!
    sz [i] = 60;
  }
}

void draw(){
  
  for (i = 0; i<numdibuixos; i++){ //la i representa cada pilota
    moviment(i); //instruccions moviment del parametre i(personatge)
    limits_verticals_horitzontals(i);// es tota la funció
    personatge(i);
  }
}

void moviment(int _i){

      posicioX [_i] += velocitatX [_i];
      posicioY [_i] += velocitatY [_i];
      
}

void limits_verticals_horitzontals(int _i){
  if((posicioX [_i] < sz[_i]/2)||(posicioX [_i] > width-sz[_i]/2)){ //si la bola compleix aixo, canvia el sentit de la velocitat
    velocitatX [_i] = -velocitatX [_i];
  }
  if ((posicioY [_i] < sz[_i]/2)||(posicioY [_i] > height-sz[_i]/2)){
    velocitatY [_i] = -velocitatY [_i];
  }
}

void personatge(int _i){
  noStroke();
  fill(0);
  ellipse(posicioX[_i],posicioY[_i],40,40);

  fill(random(255), random(255), random(255));
  ellipse(posicioX[_i],posicioY[_i]-25,10,10);
  fill(random(255), random(255), random(255));
  ellipse(posicioX[_i]+25,posicioY[_i],10,10);
  fill(random(255), random(255), random(255));
  ellipse(posicioX[_i],posicioY[_i]+25,10,10);
  fill(random(255), random(255), random(255));
  ellipse(posicioX[_i]-25,posicioY[_i],10,10);
  fill(random(255), random(255), random(255));
  ellipse(posicioX[_i]-17.5,posicioY[_i]+17.5,10,10);
  fill(random(255), random(255), random(255));
  ellipse(posicioX[_i]-17.5,posicioY[_i]-17.5,10,10);
  fill(random(255), random(255), random(255));
  ellipse(posicioX[_i]+17.5,posicioY[_i]-17.5,10,10);
  fill(random(255), random(255), random(255));
  ellipse(posicioX[_i]+17.5,posicioY[_i]+17.5,10,10);

  fill(255);
  ellipse(posicioX[_i]-8,posicioY[_i],10,15);
  ellipse(posicioX[_i]+8,posicioY[_i],10,15);
  fill(0);
  ellipse(posicioX[_i]-8,posicioY[_i]+3,5,5);
  ellipse(posicioX[_i]+8,posicioY[_i]+3,5,5);
}
