
int coordXinv[]= {
  int(random(600)), int(random(600)), int(random(600)), int(random(600)), int(random(600))
};
int coordYinv[]= {
  0, 0, 0, 0, 0
};
int diamInv=10, i=0, time=0, muertos=0, nivel=1;
 PFont tipo_letra;
 
void setup() {
  size(600, 600);
  background(0);
  tipo_letra=loadFont("DejaVuSans-Bold-48.vlw");
  
  frameRate(25);
  
  
}
void draw() {
  background(0);
   
   if(time<=60){
     time++;
     if(time<=30){
       textFont(tipo_letra, 36);
       fill(255);
       text("Apunta y mata con el mouse!", 0,height/2);
     }
     else{
        fill(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)));
       textFont(tipo_letra, 100);
       text("INICIA", width/4,height/2);
     } 
   }
   
   else{
   marcador();  
   arma();
  invasores();
  finjuego();
   }
}
 
void arma() {
  fill(0, 255, 0);
  stroke(color(0, 255, 0));
  triangle(mouseX-8, 580, mouseX, 565, mouseX+8, 580);
}
 
void marcador(){
 stroke(255,255,0);
 fill(0);
 rect(10,10,200,20);
 rect(height-160,10,150,20);
 fill(255,255,0);
 textFont(tipo_letra, 20); 
 text("muertos", 12,27);
 text(muertos, 130,27);
 text("Nivel", height-150,27);
 text(nivel, height-30,27);
} 
 
void invasores() {
  noStroke();
  for (int i=0;i<5;i++) {
    fill(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)));
    if (coordYinv[i]<600)coordYinv[i]+=nivel;
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
    muertos++;
    if((muertos)==0){
    nivel++;
    }
    line(mouseX, 565, mouseX, 0);
  }
  
}
 
void finjuego(){
   for (int i=0;i<5;i++) {
   if(coordYinv[i]==600){
   noLoop();
   textFont(tipo_letra, 50);
    text("Bye! mataste:", width/4,height/2);
    text(muertos, width/2,height/2+50);
   }
   }
}
