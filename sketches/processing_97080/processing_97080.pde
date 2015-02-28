
/* Maite Iriondo Lozano
   Práctica 3-Informática-Grupo 2
*/

//Definir variables
PImage img;
int posX, posY, velX, velY;
int an = 80;
int al = 55;
int by = 10;
int bx = 15;
int oj = 8;
int value = 250;

void setup()

{
size(450,512);
//Imagen de fondo,mediante enlace
img=loadImage("http://4.bp.blogspot.com/-7OL61_D1rsQ/TnmgGgJC6tI/AAAAAAAAVlY/wcMB9kZrxsY/s1600/dibujosdeelmarparaimprimir2.jpg");

//Definir posición y velocidad
posX = width/2;
posY = height/2;
velX = 1;
velY = 3 ;
}

void draw(){
image(img,0,0,500,600);

//Burbujas mar - Condicional para cambiar de color mediante el ratón
if(mousePressed==true){
  fill(mouseX,mouseY,mouseX,mouseY);
} else{
  fill(68,194,250);
}

ellipse(400,200,42,44);
ellipse(300,400,40,42);
ellipse(50,300,40,38);
ellipse(180,250,40,42);
ellipse(450,50,40,42);
ellipse(50,150,40,42);
ellipse(150,50,40,42);



//Actualización de posiciones
posX = posX+velX;
posY = posY+velY;
  
//Dibujo pez
//cola 
fill(170,29,178);
noStroke();
triangle(posX-52,posY+15,posX-52,posY-15,posX-37,posY);
//boca
fill(170,29,178);
ellipse(posX+41,posY+4,bx,by);
//cuerpo
fill(240,156,245);
stroke(247,32,237);
strokeWeight(1.5);
ellipse(posX,posY,an,al);
//aleta
fill(170,29,178);
ellipse(posX-5,posY+2,by*2,by);
//ojo1
fill(255);
stroke(0);
strokeWeight(0.75);
ellipse(posX+22,posY-10,by,by);
//ojo2
fill(0);
ellipse(posX+22,posY-8,oj/2,by/2);
//burbujas
fill(68,194,250);
stroke(51,9,224);
ellipse(posX+52,posY-15,oj,oj);
fill(68,194,250);
stroke(51,9,224);
ellipse(posX+40,posY-30,by,by);
fill(68,194,250);
stroke(51,9,224);
ellipse(posX+43,posY-50,oj,oj);


  
//Condicional para que la figura rebote en las paredes,dentro de unos límites en X
if((posX-55<0)||(posX+52>width)){
velX = -velX;

} 
  
//Condicional para que la figura rebote en las paredes,dentro de unos límites en Y
if((posY-48<0)||(posY+20>height)){
velY = -velY;
  } 
}





