
int[] coordXinvasor = {int(random(515)),int(random(515)),int(random(515)),int(random(515)),int(random(515))};
int[] coordYinvasor = {0, 0, 0, 0, 0};
int diametroInvasor = 35, puntaje = 0, vidas = 5;

PImage fondo, nave, alien;
PFont myFont, fin;

void setup() {
   size(550, 413);
   fondo = loadImage("Fondo Espacio.jpg");
   nave = loadImage("Nave.png");
   alien = loadImage("Ufo.png");
   myFont = createFont("Gabriola", 25);
   textFont(myFont);
}

void draw() {
   background(fondo);
   arma();
   invasores();
   String puntos = "Puntaje: " + puntaje;
   String restantes = "Vidas: " + vidas;
   fill(255, 255, 0);
   text(puntos, 5, 20);
   text(restantes, 480, 20);
   for(int i=0; i<5; i++) {
       if(coordYinvasor[i] == 413)
           vidas--;
   }
   if(vidas==0) {
       fin = createFont("Gabriola", 80);
       textFont(fin);
       fill(255, 0, 0);
       text("Game Over", 150, 200);
       noLoop();
   }
}

void arma() {
   fill(0, 255, 0);
   stroke(color(0, 255, 0));
   image(nave, mouseX-20, 380, 40, 40);
}

void invasores() {
   stroke(255);
   fill(255);
   for(int i=0; i<5; i++) {
      image(alien, coordXinvasor[i], coordYinvasor[i]++, diametroInvasor, diametroInvasor);
   }
}

void mousePressed() {
   proyectil(mouseX);
}

void proyectil(int disparoX) {
   boolean acertar = false;
   for(int i=0; i<5; i++) {
      if((disparoX >= coordXinvasor[i]) && (disparoX <= (coordXinvasor[i] + diametroInvasor))) {
         acertar = false;
         line(mouseX, 380, mouseX, coordYinvasor[i]);
         fill(255, 0, 0);
         noStroke();
         ellipse(coordXinvasor[i] + (diametroInvasor/2), coordYinvasor[i]+20, diametroInvasor + 25, diametroInvasor + 25);
         puntaje++;
         coordXinvasor[i] = int(random(515));
         coordYinvasor[i] = -35;
      }
   }
   
   if(acertar == false) {
      line(mouseX, 380, mouseX, 0);
   }
}

