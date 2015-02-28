
PVector seg = new PVector(0,0);
PVector minut = new PVector(0,0);
PVector hora = new PVector(0,0);
PVector milis = new PVector(0,0);

PVector triang = new PVector(5,5);

int bola = 20;

float segRadius = 150;
float minutRadius = 100;
float horaRadius = 50;
float milisRadius = 200;

void setup() {
  size(600,600);
  smooth();
}

void draw() {
  update();
  drawMe();
}

void update() {
  //milis
  int tiempoMilis = millis();
  float angMilis = map(tiempoMilis, 0, 60, 0, TWO_PI);
  angMilis -= PI;
  angMilis *= -1;

  milis.x = width/2 + (milisRadius * sin(angMilis));
  milis.y = height/2 + (milisRadius * cos(angMilis));

  //segundos
  int tiempoSeg = second();
  float angSeg= map(tiempoSeg, 0, 60, 0, TWO_PI);
  angSeg -= PI;
  angSeg *= -1;

  seg.x = width/2 +(segRadius * sin(angSeg));
  seg.y = height/2 +(segRadius * cos(angSeg));

  //minutos
  int tiempoMinut = minute();
  float angMinut = map(tiempoMinut, 0, 60, 0, TWO_PI);
  angMinut -= PI;
  angMinut *= -1;

  minut.x = width/2 +(minutRadius * sin(angMinut));
  minut.y = height/2 +(minutRadius * cos(angMinut));

  //horas
  int tiempoHora = hour();
  if(tiempoHora > 12) {
    tiempoHora -= 12;
  }
  float angHora = map(tiempoHora, 0, 12, 0, TWO_PI);
  angHora -= PI;
  angHora *= -1;

  hora.x = width/2 + (horaRadius * sin(angHora));
  hora.y = height/2 + (horaRadius * cos(angHora));
}

void drawMe() {
  background(0);

  if(!mousePressed) {
    stroke(255);
    noFill();

    stroke(255);
    fill(24,24,45);
    ellipse(width/2, height/2, milisRadius*2, milisRadius*2);

    stroke(255);
    fill(40, 30, 15*(millis()%1000/segRadius*2), 120);
    arc(seg.x, seg.y, width/2, height/2, seg.x, seg.y + seg.x);
    ellipse(width/2, height/2, segRadius*2, segRadius*2);

    stroke(255);
    fill(55, 200, 10*(millis()%60000/(minutRadius*2)), 130);
    arc(minut.x, minut.y, width/2, height/2, minut.x, minut.y+minut.x);
    ellipse(width/2, height/2, minutRadius*2, minutRadius*2);

    stroke(255);
    fill(150, 24, 5*(millis()%720000/(horaRadius*2)), 100);
    arc(hora.x, hora.y, width/2, height/2, hora.x, hora.y + hora.x);
    ellipse(width/2, height/2, horaRadius*2, horaRadius*2);

    noStroke();
    fill(255);
    ellipse(milis.x, milis.y, bola, bola);
    stroke(255);
    fill(65, 9, 48);
    ellipse(seg.x, seg.y, bola, bola);
    ellipse(minut.x, minut.y, bola, bola);
    ellipse(hora.x, hora.y, bola, bola);
  }
  else {
    fill(200, 70, 15*(millis()%1000/segRadius*2), segRadius*2);
    arc(width/2, height/2, milisRadius*2, milisRadius*2, milisRadius*2-PI, milisRadius*2);
    ellipse(width/2, height/2, segRadius*2, segRadius*2);

    line(hora.x, hora.y, milis.x, milis.y);
    line(minut.x, minut.y, milis.x, milis.y);
    line(seg.x, seg.y, milis.x, milis.y);
    line(seg.x, seg.y, minut.x, minut.y);
    line(minut.x, minut.y, hora.x, hora.y);
    line(hora.x, hora.y, seg.x, seg.y);
  }
} 


