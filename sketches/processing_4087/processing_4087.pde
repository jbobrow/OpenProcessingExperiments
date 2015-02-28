
//_GhostBusters_
//__ectoplasm__


// El proyecto consiste en crear objetos que producen de forma aleotoria su trayectoria, tamaño y color, sin la necesidad de un extenso codigo que defina los objetos y su movimiento y vida.
//Ademas presenta una funcion grafica que deja una estela luego de la creacion del objeto.
//Incorpora funciones como la creacion de texto y la carga de imagenes.
//Finalmente al presionar cualquiera de los dos botos del mouse el programa se reinicia mostrando una conocida imagen q tambien se funde con el fondo al igual que el rastro producido por los ectoplasmas. 






int i,j;

void setup(){
  size(300,300);
background(255);
}



void draw(){
frameRate(100);
  PFont font;// declara la existencia de la función fuente

font = loadFont("CopperplateGothic-Light-14.vlw");// fuente sellecionada 
textFont(font); 
stroke(255);
fill(0);
text("Press the mouse to see a secret ", 18, 292);// ubicación y contenido de la frase
  
  
  
colorMode(3,250);// cambia la forma en que processing interpreta la información o data del de color
filter(11);// filtra la imagen segun uno de los filtros preestablecidos como en este caso una version del BLUR
smooth();
for(j=0;
j<25;
j++)
{

noStroke();
  fill(n(5),250,250);
ellipse(n(0),n(9),n(40)/6,n(40)/6);//gracias alas coordenadas introducidas se define el movimiento oscilante del obj sin necesidad de definirlo como obj

}i++;
}
float n(int k){
 return noise(j+mouseX,k+mouseY,i*0.007)*350-15;//la funcion return expecifica el valor de retorno de la funcion escrita
}//la funcion noise es un generador aleatorio de sucesiones numericas que es más armonico que la funci+on random()

void mousePressed(){
  
  PImage b;// carga de una imagen
b = loadImage("ghostbuster.jpg");
image(b, 0, 0);



}



