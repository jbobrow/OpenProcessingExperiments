
int pos=50,a=0,pos2=900;


void setup()
{
  
  size(900, 650);
  smooth();
  frameRate(6);
  background(246,250,255);

}

void draw(){
 background(246,250,255);
//Rectángulos de gradiente de ARRIBA/////////////////////////////
 PImage arriba; 
  arriba= createImage(900, 100, RGB);
  arriba.loadPixels();
  
  color c1 = color(141, 152, 255);
  color c2 = color(255, 255, 255);

  
   for (int i = 0; i < arriba.height; i++) {   
     for(int j = 0; j < arriba.width; j++) {
      int index = j + i * arriba.width;
      color sc = lerpColor(c1, c2, (float) j / (float) arriba.width);
      arriba.pixels[index] = sc;
     }
   }

  arriba.updatePixels();
  translate(0, 0);
  image(arriba, 0, 0);
  //QUE ES PE
 PFont tipo_letra;
 tipo_letra=loadFont("LucidaBright-48.vlw");
 textFont(tipo_letra, 48);
fill(0,19,140);

if (a==0){
    if (pos<=90)pos+=5;
    else a=1;
}
else{
    if (pos>=40)pos-=5;
    else a=0;
    }
text("¿Qué es Programación Estructurada?",pos,pos);
 
  //Rectángulos de gradiente de ABAJO/////////////////////////////
 PImage abajo; 
  abajo= createImage(900, 50, RGB);
  abajo.loadPixels();
  
  color c1 = color(141, 152, 255);
  color c2 = color(255, 255, 255);

  
   for (int i = 0; i < abajo.height; i++) {   
     for(int j = 0; j < abajo.width; j++) {
      int index = j + i * abajo.width;
      color sc = lerpColor(c1, c2, (float) j / (float) abajo.width);
      abajo.pixels[index] = sc;
     }
   }

  abajo.updatePixels();
  translate(0,600);
  image(abajo, 0, 0);
  
  if (pos2>=-900)pos2-=10;
    else pos2=900;
textFont(tipo_letra, 24);
text("Alui Alarid && Mariana Calderón && Yanahui Hernández && Armando Martínez && Joaquín Mendoza",pos2,40);
  
 
//botones

  
  
  
  
  
}
