

class rabo{
  
int anchMax;
int anchMin;
int altura;
int posY; 
int radOffset;
float gira=0;
float gira2=0;
//String texto[]={"#rabodenube"};

String texto="#rabodenube";
String texto_momentaneo;
PFont fuente;

  rabo(int amx,int amn,int al){
    textMode(CENTER);
anchMax=amx;
anchMin=amn;
altura=al;
posY=int(random(0,height));
fuente=loadFont("BookmanOldStyle-32.vlw");
}

  rabo(int amx,int amn,int al,String el_texto){
anchMax=amx;
anchMin=amn;
altura=al;
posY=int(random(0,height));
//texto[0]=el_texto;
texto=el_texto;
fuente=loadFont("BookmanOldStyle-32.vlw");
}


void drawing(int arreglo){
//guarda la primera poscion que centra y rota  
pushMatrix();  
//esta envia el tornado a la mitad
translate(width/2,0,0);
//Este es el eje de rotacion
rotateY(radians(gira2));
//esta funcion mueve el centro
translate(radio(posY)*10,0,0);
//giro interior
rotateY(radians(gira));
int tamano=height/10-posY/10;
//ellipse(0,posY,tamano,tamano);
textFont(fuente,tamano);
//este debe de dibujar palabra por palabra
//text(texto[arreglo],0,posY);
text(texto,0,posY);

popMatrix();
gira+=random(0.001,1.9);
gira2+=random(0.1,1.9);
if(gira>=360.0){
gira=0.0;
}

}

//revisar a detalle

int myRad=0;
int radio(int poY){
poY=height-poY;
myRad=poY*5;
//int rad=constrain(myRad,anchMax,anchMin);
//el radio era demasiado grande
int rad= myRad/100;
return rad;

}

}

