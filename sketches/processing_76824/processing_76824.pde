
//creat per Pau.A

//declaracion de variables
int color1 = 0;
int color2 = 0;
int color3 = 0;

int color4 = 0;
int color5 = 0;
int color6 = 0;

int posicion = 0;
int col = 0;
void setup(){
  smooth();
  size(500,500);
}

void draw(){
  background(255);
  fill(255,255,0);
  //cara
  ellipse(250,250,300,300);
  //ojos
  fill(color1,color2,color3);
  //ojo.iz
  ellipse(220,220,70,70);
  //ojo.d
  ellipse(280,220,70,70);
  //iris
  fill(255,255,255);
  //pupila.d
  ellipse(289,226,15,15);
  //pupila.iz
  ellipse(229,225,15,15);
  //fondo boca
  fill(0);
  arc(250,285,120,120,6.2,9.5);
  //diente
  fill(255,255,255);
  rect(190,281,120,10);
  //lengua
  fill(255,0,0);
  ellipse(250,425.5/1.3,75,35.5);
  arc(251,333.5,15,25,2.14,4.28);
  //mano.i
  fill(255,255,0);
  arc(145,290,40,mouseX/7,3.14,6.28);
  //mano.d
  fill(255,255,0);
  arc(350,290,40,mouseY/7,3.14,6.28);
  fill(0);
  //iris.d
  ellipse(289,226,10,10);
  //iris.iz
  ellipse(229,225,10,10);
  //Patin
  fill(color4,color5,color6);
  rect(posicion,400,340,10);
  //Ruedas.patin
  //Rueda.iz
  ellipse(posicion+115,425,30,30);
  //Rueda.d
  ellipse(posicion+230,425,30,30);
  posicion = (posicion+2)%500;
  //Boina
  fill(0);
  ellipse(250,115,250,120);
  arc(251,50,5,30,2.14,4.28);
}
//aprentar mouse
void mousePressed(){
    color1 = int(random(0, 255));
    color2 = int(random(0, 255));
    color3 = int(random(0, 255));
}

//soltar mouse
void mouseReleased(){
    color4 = int(random(0, 255));
    color5 = int(random(0, 255));
    color6 = int(random(0, 255));
 
}

