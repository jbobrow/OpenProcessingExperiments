
//Variables Vermell
float x, y, vx, vy;
int sz = 20;

//Variables Rodona
float rodonaX, rodonaY;
int szRodona;

//Variables Linies
float liniaX, liniaY, liniaX2;

//Penjo Imatge
PImage termometre;
PImage sexydoctor;

void setup() {
  size(600, 400);

  //Posició Inicial linia vermella
  x = width/2;
  y = height;

  //Posició Inicial rodona
  rodonaX = width/2;
  rodonaY = height-57;
  szRodona = 70;

  //Posició Inicial linia
  liniaX = width/2-15;
  liniaY = height -115;
  liniaX2 = width/2 + 02;
 
  //Recarrega d'Imatges
  termometre = loadImage ("termometre.jpg");
  sexydoctor = loadImage ("sexydoctor.png");
  
 }

void draw() {
  background (255);
  textSize (30);
  fill (random (255), random (255), random (255)); 
  image (termometre, width/2-75, 50, 153, 344);
  image (sexydoctor, 0, 0);
  text ("Can I help you?", width/2+ 50, height/2);
  dibuixaVermell ();
  dibuixaRodona ();
  dibuixaLinies ();
}

///////////////////////////////////////////////
////////////////// FUNCIONS ///////////////////

//Funció Dibuix

void dibuixaVermell() {
  stroke(255, 0, 0);
  strokeWeight(15);
  float vermell = map(minute(), 0, 59, 290, 70);
  line(width/2, 290, width/2, vermell);
}

void dibuixaRodona () {
  float rodona = map (second (), 0, 59, 255, 0);
  stroke (0);
  strokeWeight (3);
  fill (255, rodona, rodona);
  ellipse (rodonaX, rodonaY, szRodona, szRodona);
}

void dibuixaLinies () {
  
  stroke (0);
  strokeWeight (3);

  if (((hour()>=1) && (hour()<13)) || ((hour()>=13) && (hour()<24))) {
    line (liniaX, liniaY,  liniaX2, liniaY);
  }

  if (((hour()>=2) && (hour()<13)) || ((hour()>=14) && (hour()<24))) {
    line (liniaX, liniaY-20,  liniaX2, liniaY-20);
  }

  if (((hour()>=3) && (hour()<13)) || ((hour()>=15) && (hour()<24))) {
    line (liniaX, liniaY-40,  liniaX2, liniaY-40);
  }

  if (((hour()>=4) && (hour()<13)) || ((hour()>=16) && (hour()<24))) {
    line (liniaX, liniaY-60,  liniaX2, liniaY-60);
  }

  if (((hour()>=5) && (hour()<13)) || ((hour()>=17) && (hour()<24))) {
    line (liniaX, liniaY-80,  liniaX2, liniaY-80);
  }

  if (((hour()>=6) && (hour()<13)) || ((hour()>=18) && (hour()<24))) {
    line (liniaX, liniaY-100,  liniaX2, liniaY-100);
  }

  if (((hour()>=7) && (hour()<13)) || ((hour()>=19) && (hour()<24))) {
    line (liniaX, liniaY-120,  liniaX2, liniaY-120);
  }

  if (((hour()>=8) && (hour()<13)) || ((hour()>=20) && (hour()<24))) {
    line (liniaX, liniaY-140,  liniaX2, liniaY-140);
  }

  if (((hour()>=9) && (hour()<13)) || ((hour()>=21) && (hour()<24))) {
    line (liniaX, liniaY-160,  liniaX2, liniaY-160);
  }

  if (((hour()>=10) && (hour()<13)) || ((hour()>=22) && (hour()<24))) {
    line (liniaX, liniaY-180,  liniaX2, liniaY-180);
  }

  if (((hour()>=11) && (hour()<13)) || ((hour()>=23) && (hour()<24))) {
    line (liniaX, liniaY-200,  liniaX2, liniaY-200);
  }

  if (((hour()>=12) && (hour()<13)) || ((hour()>=24) && (hour()<1))) {
    line (liniaX, liniaY-220,  liniaX2, liniaY-220);
  }
}





