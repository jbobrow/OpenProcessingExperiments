
/*
PROYECTO 01 SESION 3 : Controlando nuestro codigo
 
 IDEP 2010 - Alba Corral
 Título: titulo del sketch
 Nombre: Gabriela Lopes
 Fecha:  03/06/210
 Lugar: Barcelona
 */

// Imagenes
PImage c;
PImage d;
PImage e;

// Ramdom Rastro_colores
float r; 
float g;
float p;
float a;

void setup() {
  c = loadImage("aviao.png");
  d = loadImage("mapa.jpg");
  size(666,515);
  background(d);
  smooth();
  //frameRate(30);
 cursor(c);
}
void draw() {
  //desenhar
  stroke(100,30);//color
  strokeWeight(5);//espesura
  //line(pmouseX,pmouseY,mouseX,mouseY);\
  imageMode(CENTER);
  //image(c,mouseX,mouseY);
  
  ellipse(mouseX,mouseY, 7,7);

  r = random(100);
  g = random(100);
  p = random(100);
  a = random(100);
 // diam = random(20);
 // x = random(width);
 // y = random(height);
 // render(int(random(100,255)));
  //move();
   //ellipse(mouseX,mouseY,20,20);
      fill(r,g,p,a);
     
}
//clicar mouse aparece imagem
void mousePressed() {
  if(mouseX > 0)//para começar sem ser no 0.0
  stroke(255,80);
  strokeWeight(5);
  fill(239,76,19);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,20,20);

}


