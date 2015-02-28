
//Mida de cada capa de diferent foscor del cel i de la gespa
int nit = 10;
//Tonalitat variable per al nit i la gespa
int foscor = 0;
//Arrays d'estrelles i cometes
Estrella[] estrelles = new Estrella[500];
Cometa[] cometes = new Cometa[20];

void setup() {
  size(600,600);
  //Declarar valors d'estrelles aquí perquè tinguin una posició aleatòria però fixa al cel
  for (int quant = 0; quant < estrelles.length; quant++) {
    estrelles[quant] = new Estrella(color(200,200,random(210,255)),random(width),random(0,(height/2) + (height/6)),random(3,5));
  }
  //Declarar cometes amb tonalitats variades, posicions aleatòries fora dels marges i velocitats també diferents.
  //Atenció! Els cometes tindran mides diferents depenent de la seva relació entre velocitat X i Y
  for (int q = 0; q < cometes.length; q++) {
    cometes[q] = new Cometa(color(random(200,240),random(200,240),150),width,random((-height/2),2*(height/3)),random(2,4),random(1,2));
  }
}

void draw() {
  //Cel nocturn amb foscor gradual
  noStroke();
  for (int i = 0; i < 400; i = i + nit) {
    fill(0,0,foscor);
    rect(0,i,600,nit);
    foscor = foscor + 2;
  }
  //Estrelles del fons
  for (int quant = 0; quant < estrelles.length; quant++) {
    estrelles[quant].dibuixa();
  }
  //Pluja d'estels
  for (int q = 0; q < cometes.length; q++) {
    cometes[q].dibuixa();
    cometes[q].moure();
  }
  //Paisatge cobert de gespa, també amb tons graduals
  for (int j = 400; j < 600; j = j + nit) {
    fill(0,foscor,0);
    rect(0,j,600,nit);
    foscor = foscor - 2;
  }
  //Arbre decoratiu
  fill(#45241D);
  rect(135,280,30,150);
  triangle(135,420,145,430,100,445);
  triangle(165,420,155,430,200,445);
  triangle(145,430,155,430,150,450);
  //Aprofitem el color verd fosc que ens ha quedat de la part inferior de la gespa
  fill(0,foscor,0);
  ellipse(150,250,120,120);
  ellipse(100,250,50,50);
  ellipse(150,300,50,50);
  ellipse(200,250,50,50);
  ellipse(150,200,50,50);
  ellipse(120,220,50,50);
  ellipse(120,280,50,50);
  ellipse(180,220,50,50);
  ellipse(180,280,50,50);
  //Restablim "foscor" per al cel nocturn
  foscor = 0;
  //Persona observant l'espectacle de la pluja d'estels
  stroke(#660505);
  strokeWeight(15);
  line(450,370,450,410);
  strokeWeight(8);
  line(450,365,430,385);
  line(450,365,470,385);
  line(430,385,440,405);
  line(470,385,460,405);
  stroke(#050566);
  strokeWeight(10);
  line(448,410,440,455);
  line(452,410,460,455);
  noStroke();
  fill(#372115);
  ellipse(435,460,18,8);
  ellipse(465,460,18,8);
  fill(35);
  ellipse(450,350,20,25);
  
}
    
    
class Estrella {
  //Les estrelles del fons disposen d'un color mínimament variable, una posició X i Y,
  //i una mida lleugerament diferent entre sí
  color c;
  float x;
  float y;
  float mida;
  //Una estrella, per defecte, tindria els següent valors
  Estrella() {
    c = color(200,200,200);
    x = width/2;
    y = height/3;
    mida = 4;
  }
  //Manualment introduïrem les següents dades
  Estrella(color col, float posX, float posY, float tamany) {
    c = col;
    x = posX;
    y = posY;
    mida = tamany;
  }
  //Funció que dibuixarà les estrelles amb les dades donades
  void dibuixa(){
    fill(c);
    ellipse(x,y,mida,mida);
  }
}

class Cometa {
  //Els cometes tenen colors, posicions X i Y, i velocitats X i Y diferents
  color cc;
  float coordX;
  float coordY;
  float velocitatX;
  float velocitatY;
  //Per defecte, els cometes tindrien els següents valors
  Cometa() {
    cc = 150;
    coordX = 640;
    coordY = 0;
    velocitatX = 2;
    velocitatY = 1;
  }
  //Manualment introduïrem les següents dades
  Cometa(color cc2, float coX, float coY, float velX, float velY) {
    cc = cc2;
    coordX = coX;
    coordY = coY;
    velocitatX = velX;
    velocitatY = velY;
  }
  //Funció que dibuixarà els cometes com a esferes seguides d'altres de més petites
  //que representaran el rastre que aquests deixen
  void dibuixa() {
    //Modificadors de posició, velocitat i color
    float mult = 4;
    float mult2 = 1;
    int to = 10;
    for (int i = 0; i < 8; i++) {
      fill(cc + to);
      ellipse(coordX + mult*velocitatX,coordY - mult*velocitatY,mult2*(velocitatX/velocitatY),mult2*(velocitatX/velocitatY));
      mult = mult - 0.4;
      mult2 = mult2 + 0.5;
    }
  }
  //Funció que crearà un moviment pels cometes, basat en la velocitat que els hi hem afegit
  void moure() {
    coordX = coordX - velocitatX;
    //Si se'n van més enllà de X=-20, tornaran a una posició aleatòria al marge dret
    //per fer més passades
    if (coordX < -20) {
      coordX = width;
      coordY = random((-height/2),2*(height/3));
    }
    coordY = coordY + velocitatY;
  }
}


