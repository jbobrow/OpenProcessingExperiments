
import saito.objloader.*;
OBJModel model;
OBJModel tmpmodel;

float rotX;
float rotY;
PImage titulo;
PImage barraa;
PImage barrab;
float k = 0.0;
float angleWing1 = PI / 4.0f;
float angleWing2 = PI / 4.0f*3;
float dir = -1.0f;
float chave = 0;
float velocidade;
int ativar = 0;
color fundo = color(175, 238, 81);


void setup()
{
  size(600, 600, P3D);
  frameRate(50);
  model = new OBJModel(this);
  tmpmodel = new OBJModel(this);
model.enableDebug();
  noStroke();
model.enableMaterial ();
titulo = loadImage("titulo.png");
barraa = loadImage("barraa.png");
barrab = loadImage("barrab.png");
model.load("6.7.obj");
tmpmodel.load("6.7.obj");
  
}

void inicio() {

if (keyPressed == true)
{
ativar = 1;
}
else
{
// não fazer nada  
}

if (ativar==0) { 
background(fundo);
image(titulo, 0, 50);
} 

}



void velocimetro() {
  
 

  

}






void diminuir() { // desacelera a velocidade da asa do passaro até chegar a zero
if (velocidade > -0.001 & velocidade < 0.001 ) {

  velocidade = 0.01;
  
}
else
{

velocidade = velocidade-0.001-velocidade*0.003;

}  
}

void aumentar() { 
velocidade = velocidade+0.04;
}


void animation(){ 
  
  
  for(int i = 0; i < model.getVertexCount(); i++){
    PVector orgv = model.getVertex(i);
    PVector tmpv = new PVector();
    tmpv.x = orgv.x * (abs(sin(k+i*0.04)) * 0.3 + 1.0);
    tmpv.y = orgv.y * (abs(cos(k+i*0.04)) * 0.3 + 1.0);
    tmpv.z = orgv.z * (abs(cos(k/5.)) * 0.3 + 1.0);
    tmpmodel.setVertex(i, tmpv);
  }
  k+=0.1;

  
PVector orgv = model.getVertex(11);             // do modelo, somar i + 1
PVector tmpv = new PVector();
tmpv.x = orgv.x * (0.0 + 1.0);
tmpv.y = orgv.y + (sin(angleWing1)*40f);
tmpv.z = orgv.z + (40f * cos(angleWing1));
tmpmodel.setVertex(15, tmpv);
    
orgv = model.getVertex(18);             // do modelo, somar i + 1
tmpv = new PVector();
tmpv.x = orgv.x * (0.0 + 1.0);
tmpv.y = orgv.y + (sin(angleWing2)*40f);
tmpv.z = orgv.z + (40f * cos(angleWing2));
tmpmodel.setVertex(26, tmpv);
    

    
if(angleWing1 > PI / 4.0f || angleWing1 < -PI / 4.0f){
dir *= -1;
}
    


k+=0.1;
    
    

  
if (keyPressed) {
if (key == 'a' || key == 'A' || key == 's' || key == 'S') {

if (chave==0) {
  
aumentar();
chave = 1;
  
} else {

diminuir();

}
  
  
}
    
} else {
  
diminuir();
chave = 0;
  
}

    
angleWing1 += dir * velocidade*0.2;
angleWing2 -= dir * velocidade*0.2;

diminuir();
  
inicio();
  
  
// VELOCIMETRO

int convertido = int(velocidade*100/3);
print(convertido);



float vel = 0; 
float vel2 = 0; 
  
for (int i = 0; i < convertido; i++) {
 
if (i<=20){
image(barraa, 100, 500-vel);

}

if (i>20 & i<=41){
image(barrab, 100, 500-vel2);
vel2 = vel2+20;
}

vel = vel+20;


     
}

  
}





void mouseDragged()
{
  rotX += (mouseX - pmouseX) * 0.01;
  rotY -= (mouseY - pmouseY) * 0.01;
}



void draw()
{
  
  background(fundo);
  lights();
  pushMatrix();
  translate(200, 300, 0);
  rotateX(rotY);
  rotateY(rotX);
  scale(3);
  // renders the temporary model
  tmpmodel.draw();
  popMatrix();
  
  inicio();
  
  animation(); 
  
  velocimetro();
  


  

}






