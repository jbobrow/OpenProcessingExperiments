
//Declaracions
//PEIXETS
float y = random (0, 800);
float x = random (0, 1000);
//BOMBA
float bombaX;
float bombaY; 
float posicioX;
float posicioY;
//GENERAL
float mida, b;
float ampladafalsa;
float alturafalsa;

//BOMBOLLES X SEGON
int totalBombolles = 59;
float [] bombollaX = new float [totalBombolles];
float [] bombollaY = new float [totalBombolles];
float [] velocitatb = new float [totalBombolles];
int midabombolla;


//IMATGES
PImage fons, pixitu, bomba, peixets, explosio, espina;

float ppinicialX, ppinicialY, ppvelocitatX, ppvelocitatY;

//PEIXETS X MINUT
int totalPeixets = 59;
float [] peixetX = new float [totalPeixets];
float [] peixetY = new float [totalPeixets];

/*@pjs preload = "Fons_rellotge.jpg";*/

//----------------------------SET UP ---------------------------//

void setup () {
  size (1000, 600);
  noCursor ();
  ampladafalsa = 800;
  alturafalsa = 600;
  // CARREGA IMATGES
  fons = loadImage ("Fons_rellotge.jpg");
  pixitu = loadImage ("Pixitu_rellotge.png");
  peixets = loadImage ("Peixet_rellotge.png");
  bomba = loadImage ("bomb.png");
  explosio = loadImage ("Explosio_rellotge.png");
  espina = loadImage ("fishbone_rellotge.png");
  // POSICIÓ PEIX SEGONS
  posicioX = mouseX;
  posicioY = mouseY;
  mida = 10;

  ppinicialX = 20;
  ppinicialY = 20;
  ppvelocitatX = 10;
  ppvelocitatY = 10;

  // PEIXOS PER MINUT
  for (int i = 0; i <totalPeixets; i++) {
    peixetX [i] = int (random (0, ampladafalsa-50) );
    peixetY [i] = int (random (0+50, alturafalsa-50));
  }
  // BOMBOLLES PER SEGON
  for (int i = 0; i <totalBombolles; i++) {
    bombollaX [i] = int (random (0+10, ampladafalsa-10));
    bombollaY [i] = int (alturafalsa);
    velocitatb [i] = int (1);
  }

  midabombolla = 12;
}
//PEIXOS PER HORA


//---------------------------- DRAW ---------------------------------//

void draw () {
  image (fons, 0, 0, width, height);


  peixitu (mouseX, mouseY);
  peixets ();
  bomba();
  bombolles ();
espines ();







  if (second ()== 59 && minute () == 59) {
    image (fons, ampladafalsa, alturafalsa);
  }
  if  (second ()== 59 && minute () == 59) {
    image (explosio, 300, 70);
  }
}





















//////////////////FUNCIONS PRÒPIES///////////////////////////////////
void peixitu (float x, float y) {
  //dibuix peix 
  fill (250, 152, 53);
  noStroke ();
  //Cos peix
  ellipse (x, y, mida*4, mida*4);
  // Cua
  ellipse (x +mida*2.3, y -6.5, mida*1.5, mida*1.5);
  ellipse (x +mida*2.3, y +6.5, mida*1.5, mida*1.5);
  //ulls
  fill (255);
  ellipse (x +mida/1.5, y -mida, mida, mida);
  ellipse (x -mida/1.5, y -mida, mida, mida);
  fill (0);
  ellipse (x -mida/1.5, y -mida, mida/2, mida/2);
  ellipse (x +mida/1.5, y -mida, mida/2, mida/2);
}

// BOMBOLLES X SEGON
void bombolles () {


  for (int i = 0; i < second (); i++) {
    fill (26, 234, 229);
    ellipse (bombollaX [i], bombollaY [i], midabombolla, midabombolla);
    fill (255);
    ellipse (bombollaX [i]+2, bombollaY [i]-1.5, midabombolla*0.5, midabombolla*0.5);
    bombollaY [i] = bombollaY [i] - velocitatb [i];
    if (bombollaY [i] == 0) {
      bombollaY [i] = alturafalsa;
    }
  }
}

// BOMBA CAU X MINUT I EXPLOTA A L'HORA
void bomba () { // bomba cau cada minut

  image (bomba, ampladafalsa/2, bombaY);
  /*fill (0);
   ellipse (width/2, bombaY, mida*5, mida*5);*/

  bombaY = map (minute (), 0, 59, 0, alturafalsa);
}

// N'APAREIX 1 CADA MINUT
void peixets () { //apareix peix cada minut
  for (int i = 0; i < minute (); i++) {
    image (peixets, peixetX[i], peixetY[i]);
  }
}


void espines () {
  fill (0);
  rect (width-200, 0, 200, height);
 
  for (int i = 0; i < hour (); i++) {
    /* stroke (0);
     fill (255);
  rect (width-200, height/24*i, 200, height/24);*/
  image (espina, width-179, height/24*i, 158, height/24);
  }
  
}
  
  
  
