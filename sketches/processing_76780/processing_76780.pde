
//creado por Oscar Martinez Ramos

//declaracion de variables
int color1 = 0;
int color2 = 0;
int color3 = 0;

int fondo1 = 231;
int fondo2 = 237;
int fondo3 = 72;

void setup(){
  smooth();
  size(400,470);
}
void draw(){
  background(fondo1,fondo2,fondo3);
  
  //cara
  fill(126,240,90);
  rect(60,50,280,320);
 
  //tronillo izquierdo
  fill(118,124,115);
  rect(75,410,45,25);
  rect(49,400,30,45);
  line(49,415,80,415);  
  line(49,430,80,430);
  line(90,435,97,410);
  //tornillo derecho
  rect(279,410,45,25);
  rect(305,400,30,45);
  line(305,415,336,415);
  line(305,430,336,430);
  line(298,435,290,410);
  
  //cuello
  fill(126,240,90);
  quad(85,470,135,371,260,371,305,470);
 
  //boca
  fill(0);
  ellipse(200,290,100+mouseX/8,80+mouseY/10);
  fill(255,0,0);
  ellipse(200,290,70+mouseX/8,50+mouseY/10);
  
  //ojos
  fill(color1,color2,color3);
  ellipse(140,130,140,110);
  ellipse(265,130,70,60);
  fill(0);
  ellipse(160,130,30,30);
  ellipse(265,130,30,30);
  fill(color2,color3,color3);
  ellipse(160,130,15,15);
  ellipse(265,130,15,15);
}

//apretar el boton del raton
void mousePressed(){
    color1 = int(random(0, 255));
    color2 = int(random(0, 255));
    color3 = int(random(0, 255));
    
    fondo1 = int(random(0, 255));
    fondo2 = int(random(0, 255));
    fondo3 = int(random(0, 255));
    
}
//soltar el boton del raton
void mouseReleased(){
    color1 = int(random(0, 255));
    color2 = int(random(0, 255));
    color3 = int(random(0, 255));
    
    fondo1 = int(random(0, 255));
    fondo2 = int(random(0, 255));
    fondo3 = int(random(0, 255));
}
  



