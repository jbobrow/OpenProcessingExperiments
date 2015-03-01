

//mouse
float mida = 90;

//hores
PImage hora0;
PImage hora1;
PImage hora2;
PImage hora3;
PImage hora4;
PImage hora5;
PImage hora6;
PImage hora7;
PImage hora8;
PImage hora9;
PImage hora10;
PImage hora11;
PImage hora12;

//minuts i segons
PImage temps0;
PImage temps1;
PImage temps2;
PImage temps3;
PImage temps4;
PImage temps5;
PImage temps6;
PImage temps7;
PImage temps8;
PImage temps9;
PImage temps10;

//pokeballs
PImage pokeball;
PImage poke;
PImage master;
//pokemons

float posicioX =  random(300);
float posicioY =  random(300);
float vX = random(10);
float vY = random(10) ;
float midamew= 100;

float pokeX, pokeY, latiosx, latiosy, latiosvx, latiosvy, vxzubat, vyzubat, xzubat, yzubat, latiasx, latiasy, latiasvx, latiasvy;

PImage mew;
PImage latios;
PImage latias;
PImage zubat;


void setup() {
  size(1100, 500);
  //hores
  hora0 = loadImage("hora0.png");
  hora1 = loadImage("hora1.png");
  hora2 = loadImage("hora2.png");
  hora3 = loadImage("hora3.png");
  hora4 = loadImage("hora4.png");
  hora5 = loadImage("hora5.png");
  hora6 = loadImage("hora6.png");
  hora7 = loadImage("hora7.png");
  hora8 = loadImage("hora8.png");
  hora9 = loadImage("hora9.png");
  hora10 = loadImage("hora10.png");
  hora11 = loadImage("hora11.png");
  hora12 = loadImage("hora12.png");


  //minuts i segons
  temps0 = loadImage("temps0.png");
  temps1 = loadImage("temps1.png");
  temps2 = loadImage("temps2.png");
  temps3 = loadImage("temps3.png");
  temps4 = loadImage("temps4.png");
  temps5 = loadImage("temps5.png");
  temps6 = loadImage("temps6.png");
  temps7 = loadImage("temps7.png");
  temps8 = loadImage("temps8.png");
  temps9 = loadImage("temps9.png");
  //altres
  pokeball = loadImage("pokeball.PNG");
  poke = loadImage("poke.png");
  master = loadImage("master.png");
  mew = loadImage("mew.png");
  zubat= loadImage("zubat.png");
  latios= loadImage("latios.png");
  latias= loadImage("latias.png");

  // latios
  latiosx = width;
  latiosy = 30;
  latiosvx= -10;
  latiosvy=-0.0001;

  //latias
  latiasx = 0;
  latiasy= 450;
  latiasvx= 10;
  latiasvy= 0.0001;

  //zubat
  xzubat = width/2;
  yzubat = height/2;
  vxzubat = random(-4, -1);
  vyzubat = random(-4, -1);
}

void draw() {

  background( hour()*10, minute()*2+second()*2, hour()*5+minute()*2);

  CursorMarc();

  hores();
  minutsDesenes();
  minutsUnitats();
  segonsDesenes();
  segonsUnitats();


  zubat();
  mew();
  latios();
  latias();
}





void CursorMarc() {
  //cursor
  noCursor();
  mida = 3*second();
  image(master, mouseX, mouseY, mida, mida);

  //marc on es el temps
  noStroke();
  rect(width/9, height/3.5, 1000, 180);
  stroke((hour()*20), (minute()*4), random(second()*10));
  strokeWeight(7);
  arc(width/9, height/3.5 + 180/2, 180, 180, PI/2, TWO_PI-PI/2);
  line(width/9, height/3.5, width, height/3.5);
  line(width/9, height/3.5+180, width, height/3.5+180);
  image(pokeball, width/9 - 85, height/3.5 + 45, 90, 90);
  image(poke, width/4 +50, height/3.5 + 40, 30, 30); 
  image(poke, width/4 +50, height/3.5 + 120, 30, 30);
  image(poke, width/1.5 -30, height/3.5 + 40, 30, 30); 
  image(poke, width/1.5 - 30, height/3.5 + 120, 30, 30);
}


void segonsDesenes() {

  //desenes
  if (second() <= 9) {
    image(temps0, (width/6) * 4, height/3, 150, 150 );
  }

  if ((second() >= 10) && (second() < 20)) {
    image(temps1, (width/6) * 4, height/3, 150, 150 );
  }
  if ((second() >= 20) && (second() < 30)) {
    image(temps2, (width/6) * 4, height/3, 150, 150 );
  }

  if ((second() >= 30) && (second() < 40)) {
    image(temps3, (width/6) * 4, height/3, 150, 150 );
  }
  if ((second() >= 40) && (second() < 50)) {
    image(temps4, (width/6) * 4, height/3, 150, 150 );
  }

  if ((second() >= 50) && (second() < 60)) {
    image(temps5, (width/6) * 4, height/3, 150, 150 );
  }
}


void segonsUnitats() {
  //unitats

    if ((second() == 0)||(second() == 10) ||(second() == 20) ||(second() == 30)||(second() == 40)||(second() == 50) ) {
    image(temps0, (width/6) * 5, height/3, 150, 150 );
  }
  if ((second() == 1)||(second() == 11) ||(second() == 21) ||(second() == 31)||(second() == 41)||(second() == 51) ) {
    image(temps1, (width/6) * 5, height/3, 150, 150 );
  }
  if ((second() == 2)||(second() == 12) ||(second() == 22) ||(second() == 32)||(second() == 42)||(second() == 52) ) {
    image(temps2, (width/6) * 5, height/3, 150, 150 );
  }
  if ((second() == 3)||(second() == 13) ||(second() == 23) ||(second() == 33)||(second() == 43)||(second() == 53) ) {
    image(temps3, (width/6) * 5, height/3, 150, 150 );
  }
  if ((second() == 4)||(second() == 14) ||(second() == 24) ||(second() == 34)||(second() == 44)||(second() == 54) ) {
    image(temps4, (width/6) * 5, height/3, 150, 150 );
  }
  if ((second() == 5)||(second() == 15) ||(second() == 25) ||(second() == 35)||(second() == 45)||(second() == 55) ) {
    image(temps5, (width/6) * 5, height/3, 150, 150 );
  }
  if ((second() == 6)||(second() == 16) ||(second() == 26) ||(second() == 36)||(second() == 46)||(second() == 56) ) {
    image(temps6, (width/6) * 5, height/3, 150, 150 );
  }
  if ((second() == 7)||(second() == 17) ||(second() == 27) ||(second() == 37)||(second() == 47)||(second() == 57) ) {
    image(temps7, (width/6) * 5, height/3, 150, 150 );
  }
  if ((second() == 8)||(second() == 18) ||(second() == 28) ||(second() == 38)||(second() == 48)||(second() == 58) ) {
    image(temps8, (width/6) * 5, height/3, 150, 150 );
  }
  if ((second() == 9)||(second() == 19) ||(second() == 29) ||(second() == 39)||(second() == 49)||(second() == 59) ) {
    image(temps9, (width/6) * 5, height/3, 150, 150 );
  }
}

void minutsDesenes() {
  if ((minute() == 0)||(minute() == 1) ||(minute() == 2) ||(minute() == 3)||(minute() == 4)||(minute() == 5)||(minute() == 6) ||(minute() == 7) ||(minute() == 8) ||(minute() == 9)) {
    image(temps0, (width/6) * 2, height/3, 150, 150 );
  }
  if ((minute() == 10)||(minute() == 11) ||(minute() == 12) ||(minute() == 13)||(minute() == 14)||(minute() == 15)||(minute() == 16)||(minute() == 17)||(minute() == 18)||(minute() == 19) ) {
    image(temps1, (width/6) * 2, height/3, 150, 150 );
  }
  if ((minute() == 20)||(minute() == 21) ||(minute() == 22) ||(minute() == 23)||(minute() == 24)||(minute() == 25)||(minute() == 26)||(minute() == 27)||(minute() == 28)||(minute() == 29) ) {
    image(temps2, (width/6) * 2, height/3, 150, 150 );
  }
  if ((minute() == 30)||(minute() == 31) ||(minute() == 32) ||(minute() == 33)||(minute() == 34)||(minute() == 35)||(minute() == 36)||(minute() == 37)||(minute() == 38)||(minute() == 39) ) {
    image(temps3, (width/6) * 2, height/3, 150, 150 );
  }
  if ((minute() == 40)||(minute() == 41) ||(minute() == 42) ||(minute() == 43)||(minute() == 44)||(minute() == 45)||(minute() == 46)||(minute() == 47)||(minute() == 48)||(minute() == 49) ) {
    image(temps4, (width/6) * 2, height/3, 150, 150 );
  }
  if ((minute() == 50)||(minute() == 51) ||(minute() == 52) ||(minute() == 53)||(minute() == 54)||(minute() == 55) ||(minute() == 56)||(minute() == 57)||(minute() == 58)||(minute() == 59)) {
    image(temps5, (width/6) * 2, height/3, 150, 150 );
  }
}




void minutsUnitats() {

  if ((minute() == 0)||(minute() == 10) ||(minute() == 20) ||(minute() == 30)||(minute() == 40)||(minute() == 50) ) {
    image(temps0, (width/6) * 3, height/3, 150, 150 );
  }
  if ((minute() == 1)||(minute() == 11) ||(minute() == 21) ||(minute() == 31)||(minute() == 41)||(minute() == 51) ) {
    image(temps1, (width/6) * 3, height/3, 150, 150 );
  }
  if ((minute() == 2)||(minute() == 12) ||(minute() == 22) ||(minute() == 32)||(minute() == 42)||(minute() == 52) ) {
    image(temps2, (width/6) * 3, height/3, 150, 150 );
  }
  if ((minute() == 3)||(minute() == 13) ||(minute() == 23) ||(minute() == 33)||(minute() == 43)||(minute() == 53) ) {
    image(temps3, (width/6) * 3, height/3, 150, 150 );
  }
  if ((minute() == 4)||(minute() == 14) ||(minute() == 24) ||(minute() == 34)||(minute() == 44)||(minute() == 54) ) {
    image(temps4, (width/6) * 3, height/3, 150, 150 );
  }
  if ((minute() == 5)||(minute() == 15) ||(minute() == 25) ||(minute() == 35)||(minute() == 45)||(minute() == 55) ) {
    image(temps5, (width/6) * 3, height/3, 150, 150 );
  }
  if ((minute() == 6)||(minute() == 16) ||(minute() == 26) ||(minute() == 36)||(minute() == 46)||(minute() == 56) ) {
    image(temps6, (width/6) * 3, height/3, 150, 150 );
  }
  if ((minute() == 7)||(minute() == 17) ||(minute() == 27) ||(minute() == 37)||(minute() == 47)||(minute() == 57) ) {
    image(temps7, (width/6) * 3, height/3, 150, 150 );
  }
  if ((minute() == 8)||(minute() == 18) ||(minute() == 28) ||(minute() == 38)||(minute() == 48)||(minute() == 58) ) {
    image(temps8, (width/6) * 3, height/3, 150, 150 );
  }
  if ((minute() == 9)||(minute() == 19) ||(minute() == 29) ||(minute() == 39)||(minute() == 49)||(minute() == 59) ) {
    image(temps9, (width/6) * 3, height/3, 150, 150 );
  }
}





void hores() {

  if (hour() == 0) {
    image(hora0, (width/8), height/3.4, 170, 170 );
  }
  if ((hour() == 1) ||  (hour() == 13)) {
    image(hora1, (width/8), height/3.4, 170, 170 );
  }
  if ((hour() == 2) ||  (hour() == 14)) {
    image(hora2, (width/8), height/3.4, 170, 170 );
  }
  if ((hour() == 3) ||  (hour() == 15)) {
    image(hora3, (width/8), height/3.4, 170, 170 );
  }
  if ((hour() == 4) ||  (hour() == 16)) {
    image(hora4, (width/8), height/3.4, 170, 170 );
  }
  if ((hour() == 5) ||  (hour() == 17)) {
    image(hora5, (width/8), height/3.4, 170, 170 );
  }

  if ((hour() == 6) ||  (hour() == 18)) {
    image(hora6, (width/8), height/3.4, 170, 170 );
  }

  if ((hour() == 7) ||  (hour() == 19)) {
    image(hora7, (width/8), height/3.4, 170, 170 );
  }
  if ((hour() == 8) ||  (hour() == 20)) {
    image(hora8, (width/8), height/3.4, 170, 170 );
  }
  if ((hour() == 9) ||  (hour() == 21)) {
    image(hora9, (width/8), height/3.4, 170, 170 );
  }

  if ((hour() == 10) ||  (hour() == 22)) {
    image(hora10, (width/8), height/3.4, 170, 170 );
  }
  if ((hour() == 11) ||  (hour() == 23)) {
    image(hora11, (width/8), height/3.4, 170, 170 );
  }
  if (hour() == 12) {
    image(hora12, (width/8), height/3.4, 170, 170 );
  }
}



void mew() {

  posicioX = posicioX + vX;
  posicioY = posicioY + vY;

  image(mew, posicioX, posicioY, midamew*1.5, midamew);


  if (posicioX >= (width - midamew*1.5) || posicioX <= 0) { 
    vX = -vX;
  }
  if (posicioY >= height - midamew || posicioY <= 0) { 
    vY = -vY;
  }

  if (mousePressed == true) {
    float distanciaX= mouseX - posicioX;
    float distanciaY= mouseY - posicioY;

    posicioX= posicioX+ distanciaX*0.1;
    posicioY= posicioY+ distanciaY*0.1;
    vX= distanciaX*0.05;
    vY= distanciaY*0.05;
  } else {
    posicioX+=vX;
    posicioY+=vY;
  }
}



void zubat() {




  image(zubat, xzubat+random(5), yzubat+random(5), 60, 50);

  xzubat  = xzubat + vxzubat;
  yzubat  = yzubat + vyzubat;

  if (xzubat>= width) {
    xzubat=0;
  }
  if (yzubat>= height) {
    yzubat=0;
  }
  if (xzubat< 0 ) {
    xzubat=width;
  }
  if (yzubat<0 ) {
    yzubat=height;
  }
}

void latios() {

  image(latios, latiosx, latiosy, 200, 100);
  latiosx+=latiosvx; 
  latiosy+=latiosvy;



  if (latiosy>= height) {
    latiosy=0;
  }
  if (latiosx< -1000 ) {
    latiosx= width+500;
  }
  if (latiosy<0 ) {
    latiosy=height - 100;
  }
}

void latias() {

  image(latias, latiasx, latiasy, 200, 100);
  latiasx+=latiasvx; 
  latiasy+=latiasvy;

  if (latiasx >= width+500) {
    latiasx = -500;
  }
  if (latiasy<= height) {
    latiasy= 350;
  }
}








