
//Declarar mundo
World mundo;

int ancho=192;
int alto=125;
int temporizador=0;

//Declarar imagen
PImage hombre,mujer,corazon;

void setup() {
  //Configurar pantalla
  size(ancho, alto, P2D);
  //Generar mundo
  mundo=new World();

  //Añadir al mundo las particulas iniciales
  for(int i=0;i<10;i++){ 
    Particula par_tem=new Particula(random(0,width),random(0,height),new PVector(random(-10,10),random(-0.1,0.1)),random(5000,6000),20);
    mundo.addParticula(par_tem);
  }
  //carga desde fichero
  hombre=loadImage("hombre_alpha_small.png");
  mujer=loadImage("mujer_alpha_small.png");
  corazon=loadImage("corazones_alpha.png");
}

void draw() {
  background(0);
  mundo.render();
  mundo.update();
  
}  
void mousePressed() {  
  //Generar nueva particula en lugar pulsado
  PVector vel_ini_1=new PVector(0.,0.);  
  Particula temp=new Particula(mouseX,mouseY,vel_ini_1,random(1000,12000),random(19,20));
  mundo.addParticula(temp);
}


