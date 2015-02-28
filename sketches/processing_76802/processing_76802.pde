
int coordXinv[]= {
  int(random(600)), int(random(600)), int(random(600)), int(random(600)), int(random(600))
};
int coordYinv[]= {
  0, 0, 0, 0, 0
};
int diamInv=10;

void setup() {
  size(600, 600);
  background(0);
}
void draw() {
  background(0);
  arma();
  invasores();
  finjuego();
}

void arma() {
  fill(0, 255, 0);
  stroke(color(0, 255, 0));
  triangle(mouseX-8, 580, mouseX, 565, mouseX+8, 580);
}

void invasores() {
  noStroke();
  for (int i=0;i<5;i++) {
    fill(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)));
    if (coordYinv[i]<600)coordYinv[i]++;
    ellipse(coordXinv[i], coordYinv[i], diamInv, diamInv);
  }
}

void mousePressed() {
  proyectil(mouseX);
}

void proyectil(int disparoX) {
  boolean acertar=false;
  for (int i=0;i<5;i++) {
    if ((disparoX>=(coordXinv[i]-diamInv/2)) && (disparoX<=(coordXinv[i]+diamInv/2))) {
      acertar=true;
      stroke(255);
      fill(255);
      line(mouseX, 565, mouseX, coordYinv[i]);
      coordXinv[i]=int(random(600));
      coordYinv[i]=0;
    }
  }
  if (acertar==true) {
    line(mouseX, 565, mouseX, 0);
  }
}

void finjuego(){
   for (int i=0;i<5;i++) {
   if(coordYinv[i]==600){
   noLoop();
   }
   }
}
