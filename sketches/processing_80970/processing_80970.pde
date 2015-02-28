
int[] coordXinvasor = {int(random(600)),int(random(600)),int(random(600)),int(random(600)),int(random(600))};
int[] coordYinvasor = {0, 0, 0, 0, 0};
int diametroInvasor = 10;

void setup() {
   size(600, 600);
}

void draw() {
   background(0);
   arma();
   invasores();
}

void arma() {
   fill(0, 255, 0);
   stroke(color(0, 255, 0));
   triangle(mouseX-8, 580, mouseX, 565, mouseX+8, 580);
}

void invasores() {
   stroke(255);
   fill(255);
   for(int i=0; i<5; i++) {
      ellipse(coordXinvasor[i], coordYinvasor[i]++, diametroInvasor, diametroInvasor);
   }
}

void mousePressed() {
   proyectil(mouseX);
}

void proyectil(int disparoX) {
   boolean acertar = false;
   for(int i=0; i<5; i++) {
      if((disparoX >= (coordXinvasor[i] - diametroInvasor / 2)) && (disparoX <= (coordXinvasor[i] + diametroInvasor / 2))) {
         acertar = false;
         line(mouseX, 565, mouseX, coordYinvasor[i]);
         ellipse(coordXinvasor[i], coordYinvasor[i], diametroInvasor + 25, diametroInvasor + 25);
         coordXinvasor[i] = int(random(600));
         coordYinvasor[i] = 0;
      }
   }
   
   if(acertar == false) {
      line(mouseX, 565, mouseX, 0);
   }
}

