
//MªLuisa Espinós,Grupo 2_2ndGEDI//
//Informática


float angle;
float distancia;
 
//Definiciones fenerales 
void setup()
{
 size(600,600);
 background(255);
 stroke(0);
 noStroke();
 noCursor();
}
 
//Fondo

void draw()
{
background(125,201,247);//definición del color del fondo



//elementos del fondo

//sol
fill(255,223,41);
ellipse(100,100,150,150);

//nubes
fill(255);
ellipse(300,100,90,40);
ellipse(330,120,90,40);
ellipse(330,90,90,40);
ellipse(380,120,90,40);
ellipse(380,80,90,40);
ellipse(410,100,90,40);

ellipse(100,220,90,40);
ellipse(130,240,90,40);
ellipse(130,210,90,40);
ellipse(180,240,90,40);
ellipse(180,200,90,40);
ellipse(210,220,90,40);

ellipse(390,180,90,40);
ellipse(420,200,90,40);
ellipse(420,170,90,40);
ellipse(470,200,90,40);
ellipse(470,160,90,40);
ellipse(490,180,90,40);

ellipse(600,90,90,40);
ellipse(630,110,90,40);
ellipse(630,80,90,40);


atan2(mouseX, mouseY); //definición del angulo


pushMatrix();//guardar el fondo hasta este momento para que solo se traslade el pájaro

translate(mouseX,mouseY);//comando del movimiento 

//elementos que se van a mover

//cuerpo

fill(255,170,60);
ellipse(50,120,40,50);
ellipse(-50,120,40,50);


fill(235,169,250);
ellipse(0,0,150,100); 
ellipse(0,-40,130,90); 
ellipse(0,30,200,200);
ellipse(100,15,100,50);
ellipse(100,50,100,50);
ellipse(-100,50,100,50);
ellipse(-100,15,100,50);



//ojos blancos
noStroke();
fill(255,255,255);
ellipse(-10,-40,30,40);
fill(255,255,255);
ellipse(10,-40,30,40);
fill(244,209,255);
ellipse(0,50,100,150);

//nariz
fill(139,76,66);
ellipse(0,-18,40,30);
fill(196,139,131);
ellipse(-6,-16,10,5);

//ojos negros
fill(0,0,0);
ellipse(-10,-40,10,15);
ellipse(8,-40,10,15);


popMatrix();//cierre de los elementos en movimiento y se recupera la imagen posterior

}



