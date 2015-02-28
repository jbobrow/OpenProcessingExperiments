
//variable utilitzada para modificar la medida de los ojos
float mida =1;
//variable utilizada para la medida de la boca
float mida2 =2;
//variables utilizadas para mover las manos
int posicionX =0;
int posicionY=0;
int velocidad =0;
int colorCara= color(234,190,144);
//variable utilizada para abrir y cerrar la boca
void setup(){
  size(600,600);
  posicionX = 220;
  posicionY= 380;
  //determinamos una variable para la velocidad de las manos (se pone en el setup)
  velocidad = 3; 
}
void draw(){
//color del fondo
background(0,200,0);
//cuerpo
fill(180, 140, 104);
ellipse(300,550,450,350);

//orejas
//oreja derecha
fill(106, 53, 11);
ellipse(100,170,100,150);
fill(234, 190, 144);
ellipse(100,170,70,110);
//oreja izquierda
fill(106, 53, 11);
ellipse(500,170,100,150);
fill(234, 190, 144);
ellipse(500,170,70,110);

//forma de la cara
fill(106, 53, 11);
noStroke();
ellipse(300,150,370,300);
ellipse(300,340,450,350);
fill(234, 190, 144);
ellipse(300,340,400,310);
ellipse(250,170,200,220);
ellipse(350,170,200,220);  
//ojos
//forma
fill(255,255,255);
ellipse(250,170,100,100);
ellipse(350,170,100,100);

//relleno de los ojos
fill(0,0,0);
ellipse(250,170,75,75);
ellipse(350,170,75,75);
fill(255,255,255);
ellipse(260,150,mida,mida);
ellipse(360,150,mida,mida);
if(mida < 30){
mida = mida + 0.5;
}
if(mida == 30) {
  mida = 3;
}
//boca
fill(255,0,0);
ellipse(300,350,mida2,mida2);
if (mida2 <210) {
  mida2 =mida2 +0.5;
}
if(mida2>=210) {
  mida2=100;
}
//pajarita
fill(0, 34, 62);
ellipse(300,555,85,85);
triangle(100,500,100,600,320,550);
triangle(280,550,500,600,500,500);
fill(255,255,255);
ellipse(200,550,20,20);
ellipse(150,535,20,20);
ellipse(135,560,20,20);
ellipse(115,530,20,20);
ellipse(290,570,20,20);
ellipse(285,540,20,20);
ellipse(320,545,20,20);
ellipse(400,550,20,20);
ellipse(440,560,20,20);
ellipse(480,530,20,20);
ellipse(485,570,20,20);

//brazos
//brazo izquierdo
fill(106, 53, 11);
triangle(0,360,240,350,0,420);
triangle(80,550,0,400,0,450);
//brazo derecho
triangle(600,360,360,350,600,420);
triangle(595,400,640,400,520,550);

//moviment de les mans
//per tal de que es moguin les nostres mans
//manos
posicionX = posicionX +velocidad;
posicionY= posicionY+velocidad;
fill(255,255,255);
//height (altura) se refiere a la altura del cuadro entero (600 alto)
//width (anchura) se refiere a la anchura del cuadro entero (600 ancho)
ellipse(posicionX,340,75,75);
ellipse(posicionY,340,75,75);
if((posicionX<0)||(posicionX>width)){
} 
if((posicionY<0)||(posicionY>width)){
}
velocidad = -velocidad;
}










  
  
  
  
  
  
  
  



