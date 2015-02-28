
PFont fuente;
String[] palabras = {"one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve","thirteen","fourteen","fiveteen","sixteen","seventeen","eighteen","nineteen","twenty",};
int[] posicion= new int[20];
int[] posicion2= new int[20];
float opacidad=0.0;
float tam = 0.0;
void setup(){
  size(900,500);
  fuente = loadFont("fuente.vlw");
  posiciones();
}

void posiciones(){
  for (int i=0;i<palabras.length;i++){
    posicion[i]=(int)random(10, 800);
    posicion2[i]=(int)random(10, 500);
  }
}

void draw(){
  fill(255);
  rect(0,0,width,height);
  opacidad +=0.7;
   for(int i =0; i<palabras.length; i++){
      tam +=0.001;  
      textFont(fuente);
      pushMatrix();
      translate(posicion[i],posicion2[i]);
      fill(posicion[i],posicion2[i],0,opacidad);
      scale(tam);
      text(palabras[i],0-40,0);
//      ranslate(posicion[i]-(200*i),posicion2[i]);
      popMatrix();
   }
   if(opacidad == 5){
   noLoop();}
}


