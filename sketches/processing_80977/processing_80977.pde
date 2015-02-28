
int[] coordenadasXinvasor={int(random(600)), int(random(600)), 
int(random(600)), int(random(600)), int(random(600))};
int[] coordenadasYinvasor={0,0,0,0,0};
int diametroInvasor=10;
PImage fondo;

void setup()
{
size (500,500);
fondo=loadImage("nevar.png");
}
void draw()
{

background(fondo);
smooth();
arma();
invasores();
finjuego();

}
 void arma(){
   fill(141,97,240);
   stroke(color(2,0,5));
   triangle (mouseX-8, 580, mouseX, 565, mouseX+8, 580);
 }

 void invasores(){
   stroke(255);
   fill(165,237,247);
   for (int i=0; i<5; i++){
     ellipse (coordenadasXinvasor[i], coordenadasYinvasor [i]++, 
     diametroInvasor, diametroInvasor);
   }
 }
//el disparo
void mousePressed(){
  proyectil(mouseX);//tomamos la posición X del disparo(de mouse)
  }
  
//proyectil
void proyectil(int disparoX){
  boolean acertar = false;
  for (int i=0; i<5; i++){
    if ((disparoX>=(coordenadasXinvasor[i]-diametroInvasor/2)) 
    && (disparoX<=(coordenadasXinvasor[i]+diametroInvasor/2))){
      acertar = true;
      line(mouseX,565,mouseX, coordenadasYinvasor[i]);

   ellipse (coordenadasXinvasor[i], coordenadasYinvasor [i], 
     diametroInvasor+25, diametroInvasor+25);

     
     coordenadasXinvasor[i]=int(random(600));
     coordenadasYinvasor[i]=0;
     }
    }
    if (acertar==false){
      line(mouseX, 565, mouseX,0); //falló el proyectil
    }
   }
   
void finjuego(){
  for (int i=0; i<5; i++){
    if (coordenadasYinvasor[i]==600){
      
      noLoop();
    }
  }
}


