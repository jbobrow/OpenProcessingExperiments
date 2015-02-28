
//Declaració d'imatges utilitzades a tot el sketch
PImage outside, hall, painting1, painting2, painting3, painting4, wall;
//Tots els botons de canvi de secció utilitzats al sketch (alguns duplicats però amb diferent pantalla d'origen)
Boto exterior, dins, dinsEsc, dinsPint, dinsCien, escultura, esculturaPint, esculturaCien, pintura, pinturaEsc, pinturaCien, ciencia, cienciaEsc, cienciaPint;
//Tots els botons de canvi de quadre de la secció "Pintura"
BotoQuad anterior, seguent;
//Tots els botons que afegeixen o treuen parts del cos a la secció "Escultura"
BotoEsc construir, reiniciar;
//Array del conjunt d'àtoms de la secció "Ciència"
Atom[] atoms = new Atom[40];
//Variable encarregada de definir la pantalla actual en la qual ens trobem i que es veu modificada pel
//valor de "pantSeg" de la classe "Boto"
int selector = 1;
//Variable encarregada de fer canviar el quadre exposat a la secció "Pintura" i que es veu modificada pel
//valor de "funcio" de la classe "BotoQuad"
int quadres = 1;
//Posició inicial del scroll (la posem aquí perquè no faci actualitzar constantment el seu valor)
int xPos = 215;
//Velocitat inicial dels àtoms
float vel = 1;
//Regulador de les parts del cos de la figura de la secció "Escultura"
int parts = 0;

void setup() {
  size(600,600);
  //Definició de totes les variables d'imatge
  outside = loadImage("fora.jpg");
  hall = loadImage("vestibul.jpg");
  painting1 = loadImage("quadre1.jpg");
  painting2 = loadImage("quadre2.jpg");
  painting3 = loadImage("quadre3.jpg");
  painting4 = loadImage("quadre4.jpg");
  wall = loadImage("paret.jpg");
  //Declaració de tots els botons de tipus "Boto"
  exterior = new Boto(width/5,color(220,220,30),color(180,180,230),2,1,"Exterior");
  dins = new Boto();
  dinsEsc = new Boto(width/20,color(220,220,30),color(180,180,230),3,2,"Vestíbul");
  dinsPint = new Boto(width/20,color(220,220,30),color(180,180,230),4,2,"Vestíbul");
  dinsCien = new Boto(width/20,color(220,220,30),color(180,180,230),5,2,"Vestíbul");
  escultura = new Boto(width/2 - width/8,color(150,30,30),color(180,230,180),2,3,"Escultura");
  esculturaPint = new Boto(width/2 - width/8,color(150,30,30),color(180,230,180),4,3,"Escultura");
  esculturaCien = new Boto(width/2 - width/8,color(150,30,30),color(180,230,180),5,3,"Escultura");
  pintura = new Boto(width/2 + width/15,color(150,30,150),color(180,180,180),2,4,"Pintura");
  pinturaEsc = new Boto(width/2 + width/15,color(150,30,150),color(180,180,180),3,4,"Pintura");
  pinturaCien = new Boto(width/2 + width/15,color(150,30,150),color(180,180,180),5,4,"Pintura");
  ciencia = new Boto(width - width/4,color(150,80,30),color(180,180,30),2,5,"Ciència");
  cienciaEsc = new Boto(width - width/4,color(150,80,30),color(180,180,30),3,5,"Ciència");
  cienciaPint = new Boto(width - width/4,color(150,80,30),color(180,180,30),4,5,"Ciència");
  //Declaració de tots els botons de tipus "BotoQuad"
  anterior = new BotoQuad();
  seguent = new BotoQuad(480,"Següent",1);
  //Declaració de tots els botons de tipus "BotoEsc"
  construir = new BotoEsc();
  reiniciar = new BotoEsc(350,"Reiniciar",0);
  for (int j = 0; j < atoms.length; j++) {
    atoms[j] = new Atom();
  }
}

void draw() {
  //Amb aquest switch en funció de "selector" activem la funció corresponent per realitzar el canvi de pantalla
  switch (selector) {
    case 1: fora();break;
    case 2: vestibul();break;
    case 3: escult();break;
    case 4: pint();break;
    case 5: cien();break;
  }
}

void mousePressed() {
  //Totes aquestes funcions defineixen l'acció que ocorre després de polsar qualsevol botó del sketch
  exterior.click();
  dins.click();
  dinsEsc.click();
  dinsPint.click();
  dinsCien.click();
  escultura.click();
  esculturaPint.click();
  esculturaCien.click();
  pintura.click();
  pinturaEsc.click();
  pinturaCien.click(); 
  ciencia.click();
  cienciaEsc.click();
  cienciaPint.click();
  anterior.prem();
  seguent.prem();
  construir.polsar();
  reiniciar.polsar();
}

//El mouseDragged funciona perfectament pel scroll de la secció "Ciència" ja que permet clicar i arrossegar
void mouseDragged() {
  scroll();  
}
//Tipus de botons que ens permetran moure'ns per les diferents seccions del museu
class Boto {
  float x;
  float y;
  int llarg;
  int alt;
  int gruix;
  color gruixC;
  color fons;
  //Amb aquestes dues variables indicarem el lloc inicial on es troben i la secció a la que porten
  int pantAra;
  int pantSeg;
  color nomC;
  PFont estil;
  String nom;
  
  //Per defecte, aquest tipus de botó tindrà les següents característiques
  Boto() {
    x = width/20;
    y = height - height/8;
    llarg = width/7;
    alt = height/18;
    gruix = 4;
    gruixC = color(220,220,30);
    fons = color(180,180,230);
    pantAra = 1;
    pantSeg = 2;
    nomC = color(0,0,0);
    estil = createFont("Book Antiqua", 15);
    textFont(estil);
    nom = "Vestíbul";
  }
  //Podrem introduir dades com la posició horitzontal, els colors, les pantalles d'inici i destí, etc.
  Boto(float xx, color gC, color fonss, int actual, int despres, String escrit) {
    x = xx;
    y = height - height/8;
    llarg = width/7;
    alt = height/18;
    gruix = 4;
    gruixC = gC;
    fons = fonss;
    pantAra = actual;
    pantSeg = despres;
    nomC = color(0,0,0);
    nom = escrit;
  }
  //Funció que dibuixa aquest tipus de botons
  void dibuixa() {
    strokeWeight(gruix);
    stroke(gruixC);
    fill(fons);
    //Al botó li afegim un vorejament circular decoratiu que permet que sembli una càpsula
    rect(x,y,llarg,alt,alt/2);
    fill(nomC);
    text(nom,x + llarg/6,y + 2*(alt/3));
  }
  //Funció que concedeix als botons la capacitat de canviar de pantalla
  void click() {
    if ((x <= mouseX && mouseX <= x + llarg) && (y <= mouseY && mouseY <= y + alt) && selector == pantAra) {
      selector = pantSeg;
    }
  }
}

//Tipus de botons que es troben a la secció "Pintura" i que canvien el quadre exposat
class BotoQuad {
  float x1;
  float y1;
  int llarg1;
  int alt1;
  int gruix1;
  color gruixC1;
  color fons1;
  color nomC1;
  PFont estil1;
  String nom1;
  //Aquest enter fa canviar de quadre, ja que val 1 ("següent") o -1 (anterior)
  int funcio;
  
  //Per defecte, aquest botó tindrà les següents característiques
  BotoQuad(){
    x1 = 40;
    y1 = 240;
    llarg1 = 80;
    alt1 = 40;
    gruix1 = 2;
    gruixC1 = color(0,0,0);
    fons1 = color(180,180,180);
    nomC1 = color(0,0,0);
    estil1 = createFont("Verdana",12);
    textFont(estil1);
    nom1 = "Anterior";
    funcio = -1;
  }
  //Si volem introduir dades haurem de posar molt poques, ja que volem que els dos botons s'assemblin
  BotoQuad(float x01, String nom01, int funcio1) {
    x1 = x01;
    y1 = 240;
    llarg1 = 80;
    alt1 = 40;
    gruix1 = 2;
    gruixC1 = color(0,0,0);
    fons1 = color(180,180,180);
    nomC1 = color(0,0,0);
    estil1 = createFont("Verdana",12);
    textFont(estil1);
    nom1 = nom01;
    funcio = funcio1;
  }
  //Funció que dibuixa aquest tipus de botons
  void dibuixa1() {
    strokeWeight(gruix1);
    stroke(gruixC1);
    fill(fons1);
    //Aquest cop no volem vorejaments
    rect(x1,y1,llarg1,alt1);
    fill(nomC1);
    //Situem el text ben amunt del botó per col·locar-hi més avall una fletxa complementària
    text(nom1,x1 + llarg1/6,y1 + 2*alt1/5);
  }
  //Funció que permet que els botons canviïn el quadre exposat al ser polsats
  void prem() {
    if ((x1 <= mouseX && mouseX <= x1 + llarg1) && (y1 <= mouseY && mouseY <= y1 + alt1)) {
      quadres = quadres + funcio;
    }
  }
}

//Tipus de botons que afegeixen o esborren les parts de la figura a la secció "Escultura"
class BotoEsc {
  float x2;
  float y2;
  int llarg2;
  int alt2;
  int gruix2;
  color gruixC2;
  color fons2;
  color nomC2;
  String nom2;
  //Aquest enter indicarà si el botó treu o afegeix peces
  int peces;
  
  //Per defecte, els valors de BotoEsc seran els següents
  BotoEsc() {
    x2 = 150;
    y2 = 100;
    llarg2 = 100;
    alt2 = 40;
    gruix2 = 2;
    gruixC2 = color(230,20,20,200);
    fons2 = color(230,230,20,150);
    nomC2 = color(230,20,20,200);
    nom2 = "Construir";
    peces = 1;
  }
  //De forma manual podrem introduir la posició X, el text i la funció del botó
  BotoEsc(float x02, String nom02, int peces1) {
    x2 = x02;
    y2 = 100;
    llarg2 = 100;
    alt2 = 40;
    gruix2 = 2;
    gruixC2 = color(230,20,20,200);
    fons2 = color(230,230,20,150);
    nomC2 = color(230,20,20,200);
    nom2 = nom02;
    peces = peces1;
  }
  //Funció que dibuixa els botons de tipus BotoEsc
  void dibuixa2() {
    strokeWeight(gruix2);
    stroke(gruixC2);
    fill(fons2);
    rect(x2,y2,llarg2,alt2,alt2/4);
    fill(nomC2);
    textSize(16);
    text(nom2,x2 + alt2/3, y2 + (2*alt2)/3);
    //He hagut de posar això perquè sinó es canviava el tamany de tots els altres strings del sketch
    textSize(12);
  }
  void polsar() {
    if ((mouseX >= x2 && mouseX <= x2 + llarg2) && (mouseY >= y2 && mouseY <= y2 + alt2)) {
      if (peces == 1) {
        parts = parts + peces;
      }
      else if (peces == 0) {
        parts = 0;
      }
    }
    if (parts > 5) {
      parts = 5;
    }
  }
}

//Àtoms ficats dins la capsa en la secció "Ciència"
class Atom {
  float x;
  float y;
  int diametre;
  color to;
  float velocitat;
  //Els àtoms disposaran de 4 moviments diferents en diagonal
  int moviment;
  
  //Els àtoms sempre seran representats per defecte, perquè tenen valors aleatoris innecessaris
  //d'introduir manualment
  Atom() {
    x = random(215,375);
    y = random(245,405);
    diametre = 15;
    to = color(255,0,0);
    velocitat = vel;
    moviment = int(random(1,4));
  }
  //Funció que dibuixa els àtoms, que són iguals entre sí en apariència
  void dibuixaAtom() {
    for (int i = 0; i < 40; i++) {
      fill(to);
      stroke(0);
      strokeWeight(1);
      ellipse(x,y,diametre,diametre);
    }
  }
  //Funció que fa moure els àtoms de forma independent, ja que cada un té una posició inicial i un tipus
  //de moviment diferent
  void mouAtom() {
    if (moviment == 1) {
      x = x + vel;
      y = y + vel;
      if (y > random(385,400)) {
        moviment = 4;
      }
      else if(x > random(370,385)) {
        moviment = 2;
      }
    }
    else if (moviment == 2) {
      x = x - vel;
      y = y + vel;
      if (y > random(385,400)) {
        moviment = 3;
      }
      else if(x < random(220,235)) {
        moviment = 1;
      }
    }
    else if (moviment == 3) {
      x = x - vel;
      y = y - vel;
      if (y < random(250,265)) {
        moviment = 2;
      }
      else if(x < random(220,235)) {
        moviment = 4;
      }
    }
    else if (moviment == 4) {
      x = x + vel;
      y = y - vel;
      if (y < random(250,265)) {
        moviment = 1;
      }
      else if(x > random(370,385)) {
        moviment = 3;
      }
    }
  }
}
    
//Funció que dibuixa el que ha d'aparèixer quan ens trobem fora del museu
void fora() {
  image(outside, 0, 0);
  dins.dibuixa();
}
//Funció que dibuixa el que ha d'aparèixer quan ens trobem al vestíbul del museu
void vestibul() {
  image(hall, 0, 0);
  //Clar està que si ens trobem al vestíbul no té sentit que aparegui aquest botó. Això passarà a
  //tota la resta de seccions; prescindirem del botó de la ubicació actual
  exterior.dibuixa();
  escultura.dibuixa();
  pintura.dibuixa();
  ciencia.dibuixa();
}
//Funció que dibuixa el que ha d'aparèixer quan ens trobem a la secció "Escultura" del museu
void escult() {
  //Mosaic de fons de les seccions "Escultura", "Pintura" i "Ciència" que es repeteix verticalment per
  //aparentar ser la paret del museu
  for (int ubic = 0; ubic < 600; ubic = ubic + 138) {
    image(wall, 0, ubic);
  }
  //Anirem sobreposant parts de la figura segons el valor de "parts"
  if (parts == 1 || parts == 2 || parts == 3 || parts == 4 || parts == 5) {
    fill(#301565);
    stroke(0);
    beginShape();
      vertex(160,600);
      vertex(170,500);
      vertex(220,420);
      vertex(380,420);
      vertex(430,500);
      vertex(440,600);
    endShape();
  }
  if (parts == 2 || parts == 3 || parts == 4 || parts == 5) {
    line(220,460,190,600);
    line(270,470,255,600);
    line(330,470,345,600);
    line(380,460,410,600);
  }
  if (parts == 3 || parts == 4 || parts == 5) {
    int toCara = 0;
    int toOmbra = 0;
    int toNeutral = 0;
    for (int h = 350; h < 430; h = h + 3) {
      noStroke();
      fill(toCara,toOmbra,toNeutral);
      rect(260,h,80,3);
      toOmbra = toOmbra + 2;
      toCara = toCara + 3;
      toNeutral = toNeutral + 1;
    }
    beginShape();
      vertex(260,430);
      vertex(286,442);
      vertex(292,450);
      vertex(308,450);
      vertex(314,442);
      vertex(340,430);
    endShape();
  }
  if (parts == 4 || parts == 5) {
    stroke(0);
    curve(270,395,290,420,310,420,330,395);
    line(295,375,295,390);
    line(295,390,290,405);
    line(290,405,310,405);
    line(310,405,305,390);
    line(305,390,305,375);
  }
  if (parts == 5) {
    fill(#A33535);
    beginShape();
      vertex(300,140);
      vertex(250,360);
      vertex(240,520);
      vertex(250,525);
      vertex(270,350);
      vertex(330,350);
      vertex(350,525);
      vertex(360,520);
      vertex(350,360);
      vertex(300,140);
    endShape();
  }
  construir.dibuixa2();
  reiniciar.dibuixa2();  
  dinsEsc.dibuixa();
  pinturaEsc.dibuixa();
  cienciaEsc.dibuixa();
}
//Funció que dibuixa el que ha d'aparèixer quan ens trobem a la secció "Pintura" del museu
void pint() {
  for (int ubic = 0; ubic < 600; ubic = ubic + 138) {
    image(wall, 0, ubic);
  }
  //Marcs que envolten el quadre
  fill(#854020);
  stroke(0);
  strokeWeight(2);
  rect(160,80,280,340);
  rect(180,100,240,300);
  line(160,80,180,100);
  line(420,100,440,80);
  line(160,420,180,400);
  line(420,400,440,420);
  //Funcionament del canvi de quadres segons els valor de l'enter inicialment definit com a "quadres" i que és
  //modificat pel valor "funcio" dels botons "Anterior" i "Següent"
  switch (quadres) {
    case 1: image(painting1,181,101);break;
    case 2: image(painting2,181,101);break;
    case 3: image(painting3,181,101);break;
    case 4: image(painting4,181,101);break;
  }
  //Amb això definim que si cliquem "Anterior" quan hi és el primer quadre, aparegui l'últim i no un
  //inexistent quadre "0"
  if (quadres < 1) {
    quadres = 4;
  }
  //Amb això definim que si cliquem "Següent" quan hi és el quart quadre, aparegui el primer i no un
  //inexistent cinquè quadre
  else if (quadres > 4) {
    quadres = 1;
  }
  dinsPint.dibuixa();
  esculturaPint.dibuixa();
  cienciaPint.dibuixa();
  anterior.dibuixa1();
  seguent.dibuixa1();
  //Fletxes complementàries per entendre millor la funció dels "BotoQuad"
  line(50,268,110,268);
  line(50,268,65,274);
  line(50,268,65,262);
  line(550,268,490,268);
  line(550,268,535,274);
  line(550,268,535,262);
}
//Funció que dibuixa el que ha d'aparèixer quan ens trobem a la secció "Ciència" del museu
void cien() {
  for (int ubic = 0; ubic < 600; ubic = ubic + 138) {
    image(wall, 0, ubic);
  }
  //Taula on es troba la capsa d'àtoms
  stroke(0);
  fill(#663320);
  rect(100,450,20,150);
  rect(400,450,20,150);
  rect(200,400,15,200);
  rect(500,400,15,200);
  rect(60,430,400,20);
  fill(#332215);
  rect(120,450,10,150);
  rect(420,450,10,150);
  rect(215,450,8,150);
  rect(515,400,8,200);
  quad(460,430,460,450,540,392,540,380);
  fill(#CE7540);  
  quad(60,430,460,430,540,380,160,380);
  //Capsa d'àtoms
  fill(220,220,240,150);
  rect(250,230,160,160);
  quad(200,260,250,230,250,390,200,420);
  //Àtoms (queden darrere els vidres de la capsa però davant del vidre del fons perquè hi són dins)
  for (int z = 0; z < atoms.length; z++) {
    atoms[z].dibuixaAtom();
    atoms[z].mouAtom();
  }
  strokeWeight(2);
  fill(220,220,240,150);
  quad(360,260,410,230,410,390,360,420);
  quad(200,260,250,230,410,230,360,260);
  rect(200,260,160,160); 
  //Requadre i scroll per regular la temperatura (velocitat) dels àtoms
  fill(180);
  rect(200,100,200,80);
  textSize(20);
  fill(0);
  text("TEMPERATURA",225,128);
  textSize(12);
  rect(218,148,164,16);
  noStroke();
  //Degradat de blau a vermell que representa la diferència entre la temperatura freda i la calenta
  int variaReq = 10;
  int variaCol = 15;
  int blau = 250;
  int vermell = 10;
  for (int q = 220; q != 380; q = q + variaReq) {
    fill(vermell,0,blau);
    rect(q,150,variaReq,12);
    vermell = vermell + variaCol;
    blau = blau - variaCol;
  }
  stroke(0);
  strokeWeight(1);
  fill(240,240,0);
  rect(xPos,145,10,22);
  dinsCien.dibuixa();
  esculturaCien.dibuixa();
  pinturaCien.dibuixa();
}

//Funció que especifica el funcionament del scroll de temperatura de la secció "Ciència", fent que
//només es mogui horitzontalment seguint el ratolí dins d'uns límits i canviant la velocitat dels
//àtoms segons la seva coordenada "x"
void scroll() {
  //Només podrem moure el scroll si cliquem dins la seva àrea
  if ((mouseX >= (xPos - 10) && mouseX <= (xPos + 10)) && (mouseY >= 145 && mouseY <= 167)) {
    if (215 <= mouseX && mouseX <= 375) {
      xPos = mouseX;
    }
    //Aquestes dues últimes condicions fan que el scroll no es surti de la barra
    else if (mouseX < 215) {
      xPos = 215;
    }
    else if (mouseX > 375) {
      xPos = 375;
    }
    //Modificador de la velocitat dels àtoms, fent que comenci valent 1 (32/32) i arribant fins a un valor
    //proper a 5 quan la temperatura és alta
    vel = (xPos - 183) / 32;
  }
}


