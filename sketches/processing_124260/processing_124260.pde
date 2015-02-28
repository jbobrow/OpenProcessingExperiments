
//Nicolás Montes Vázquez

//Variables imatges
PImage pc;
PImage nube;
PImage musica;
PImage pdf;
PImage pelicula;
PImage winrar;
PImage warning;
PImage tuxPower;

//Variables Fitxers
int ficheroMusica=0;
int ficheroPdf=0;
int ficheroPelicula=0;
int ficheroWinrar=0;
int disco=50;
int tamano=0;

//Creació d'arrays, un per objecte
musica[] f1 = new musica[200];
pdf[] f2 = new pdf[200];
pelicula[] f3 = new pelicula[200];
winrar[] f4 = new winrar[200];

void setup(){
  //Mida de la finestra
  size(800,600);
  //Assignacio d'imatges a les variables
  pc=loadImage("pc.png");
  nube=loadImage("nube.png");
  musica=loadImage("musica.png");
  pdf=loadImage("pdf.png");
  pelicula=loadImage("pelicula.png");
  winrar=loadImage("winrar.png");
  warning=loadImage("warning.png");
  tuxPower=loadImage("tux_power.jpg");
  
  //Declaració d'objectes
  for (int i = 0; i < f1.length;i++){
    f1[i] = new musica(random(0,15), random(0,245));
  }
  for (int i = 0; i < f2.length;i++){
    f2[i] = new pdf(random(250,315), random(0,245));
  }
    for (int i = 0; i < f3.length;i++){
    f3[i] = new pelicula(random(0,315), random(0,15));
  }
    for (int i = 0; i < f4.length;i++){
    f4[i] = new winrar(random(0,315), random(195,245));
  }
}
void draw (){
  //Fons de pantalla
  background(tuxPower);
  //Color i mida del text (a dalt-dreta)
  fill(0,255,0);
  textSize(72);
  //Text(a dalt-dreta)
  text("Descarrega",325,60);
  text("d'arxius",325,135);
  //Color i mida del text (a baix-esquerra)
  fill(255,0,0);
  textSize(20);
  //Text (a baix-esquerra)
  text("Clica per descarregar tot tipus d'arxius",15,470);
  text("Pulsa 'q' per descarregar arxius pdf",15,490);
  text("Pulsa 'w' per descarregar arxius winrar",15,510);
  text("Pulsa 'e' per descarregar arxius de musica",15,530);
  text("Pulsa 'r' per descarregar arxius de pelicula",15,550);
  //Sense borde
  noStroke();
  //color i rectangle, (a baix-esquerra)
  fill(255,255,0);
  rect(10,555,480,30,25,25,25,25);
  //color i text, (a baix-esquerra)
  fill(255,0,0);
  text("Clica aquí per aumentar la capacitat del disc dur",15,577.5);
  //Imatge núvol (a dalt-esquerra)
  image(nube,0,0,291,234);
  //Borde negre
  stroke(0);
  //Imatge ordinador (a baix-dreta)
  image(pc, width-192,height-192,192,192);
  
  //Dibuix dels objectes, per ordre, musica, pdf, pelicula, winrar
  for(int i=0;i<f1.length &&i<ficheroMusica; i++){
  f1[i].dibuixa();
  f1[i].moure();
  }
  for(int i=0;i<f2.length &&i<ficheroPdf; i++){
  f2[i].dibuixa();
  f2[i].moure();
  }
  for(int i=0;i<f3.length &&i<ficheroPelicula; i++){
  f3[i].dibuixa();
  f3[i].moure();
  }
  for(int i=0;i<f4.length &&i<ficheroWinrar; i++){
  f4[i].dibuixa();
  f4[i].moure();
  }
  //Avis d'arribada al limit de la mida del teoric "disc dur"
  if(tamano>=(disco+1)){
    //Imatge (centre)
    image(warning,10,250,125,125);
    //color i mida del text (centre)
    fill(255,0,0);
    textSize(60);
    //Text que surt al costat de la imatge (centre)
    text("El disc dur està ple",150,350);
  }
}

void mousePressed(){
  //Fa de teoric "disc dur".
  if(tamano<=disco){
  ficheroMusica=ficheroMusica+1;
  ficheroPdf=ficheroPdf+1;
  ficheroPelicula=ficheroPelicula+1;
  ficheroWinrar=ficheroWinrar+1;
  tamano=tamano+10;
  }
  
  //Amplia el "disc dur" teoric
  if(mouseX>10&&mouseX<490&&mouseY>555&&mouseY<585){
  disco=disco+50;  
  }
}

void keyPressed(){
  //Cadascuna de les tecles que hem de prémer, per crear cada un dels arxius per individual 
  if(key=='q'&&tamano<=disco){
     ficheroPdf=ficheroPdf+1;
     tamano=tamano+1;
  }
  if(key=='w'&&tamano<=disco){
     ficheroWinrar=ficheroWinrar+1;
     tamano=tamano+2;
  }
   if(key=='e'&&tamano<=disco){
     ficheroMusica=ficheroMusica+1;
     tamano=tamano+3;
  }
  if(key=='r'&&tamano<=disco){
     ficheroPelicula=ficheroPelicula+1;
     tamano=tamano+4;
  }
}

