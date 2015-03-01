
// Declare a PImage variable type
PImage imatge;
float relacio_aspecte;
// String nom_arxiu = "Empuries_DSCF0111.png"; // 
String [] nom_arxiu = {"MNAC_DSCF0140.png",  "Empuries_DSCF0111.png" }; 
String arxiu_imatge;
int index_imatge;
int fragmentacio = 10;

// 
void setup() {
  size(800, 600);
  background(0);
  colorMode(RGB, 255);
 
  relacio_aspecte = float(width) / float(height);
  smooth();
  noFill();
  
  index_imatge = int(random(0,2));
  carregar_imatge();
 
}
//
void carregar_imatge() {
  arxiu_imatge = nom_arxiu[index_imatge];
  imatge = loadImage(arxiu_imatge);
 
  image(imatge, 0, 0);
}
//
void draw() {
  if(mousePressed) {
      // color_posicio = get(mouseX, mouseY);
       //dibuixar_ 
       dibuixar_imatge (mouseX, mouseY);
      }
  
}
//
// keyboard
void keyReleased(){
    if (key=='n' || key=='N') {   // toggle image
       if (index_imatge == 0 )index_imatge = 1;
       else index_imatge = 0;
       carregar_imatge();
     }
}

// Dibuixar  imatge
void dibuixar_imatge(float posX, float posY) {
float amplada, alsada;
float amplada_r, alsada_r;

  // Ajustar valor a 10
 posX =  ajust_posicio(posX, 10);
 // posY =  ajust_posicio(posY, 10);
  
  amplada = float(width) - posX;
  alsada =   amplada / relacio_aspecte ;
  posY = float(height) - alsada;
  
 image(imatge, posX, posY, amplada, alsada);

 // Dibuixar antagònic (rèplica)
 amplada_r = float(width)-amplada;
 alsada_r =   amplada_r / relacio_aspecte ;
 image(imatge, 0, 0, amplada_r, alsada_r);
 
 // 
  fragmentacio = int(random(4,8));
 // esquerra abaix
 
 dibuixar_repliques(0, alsada_r, amplada_r, float(height) - alsada_r);
 
 // a dalt dreta
 
dibuixar_repliques(amplada_r, 0, float(width) - amplada_r, alsada_r);
 
}
// Ajustar valor a factor
float ajust_posicio(float pos, int factor) {
float ajust;
  ajust = pos % factor;
  pos = pos + factor - ajust; 
  return pos;
  
}
 
//
void dibuixar_repliques (float posX, float posY, float amplada, float alsada) {
int nr_alsa, nr_ampla;
float alsa_cop, ampla_cop;
float posX_cop;
int r, g, b;
 
 if (posX == 0) {
   nr_ampla = fragmentacio;
   ampla_cop = amplada / nr_ampla;
   alsa_cop =   ampla_cop / relacio_aspecte ;
   nr_alsa = int(alsada / alsa_cop);
   if (alsada % alsa_cop != 0) nr_alsa = nr_alsa+1;
 }
 else {
   nr_alsa = fragmentacio;
   alsa_cop = alsada / nr_alsa;
   ampla_cop =   alsa_cop * relacio_aspecte ;
   nr_ampla = int(amplada / ampla_cop);
   if (amplada % ampla_cop != 0) nr_ampla = nr_ampla+1;
 }
 for (int j = 1; j <= nr_alsa; j++){
   posX_cop = posX;
   r = int(random(0,255)); g = int(random(0,255)); b = int(random(0,255));
   for (int i = 1; i<=nr_ampla; i++) {
     tint(r, g, b); // Tint gray
     image(imatge, posX_cop, posY, ampla_cop, alsa_cop);
     posX_cop = posX_cop + ampla_cop;
   }
   posY = posY + alsa_cop;
 }
  noTint(); // Disable tint

}
//
 


