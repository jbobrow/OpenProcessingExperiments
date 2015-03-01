
// Muelle / Alina Honhala //

//Gravedad, masa de las bolas, diferencial de tiempo, longitud muelle, interaccion
float g=9.8;
float m=1.0;
float dt=0.15;
float lon=200;
boolean modelo = true;

//Constantes
float ks=0.4; //C.elástica
float kd=0.05; //C.amortiguación

//EULER
PVector v_eu=new PVector(45,-90);
PVector p_eu=new PVector(0,600);
PVector a_eu=new PVector(45,-90);

//Fuerzas
PVector Fk=new PVector(0,0);
PVector ftotal=new PVector(0,0);

void setup(){
  size(800,800);
  smooth();
}

float calcFuerzas(float pos, float v){
  //F = m*g -> Fuerza tangencial
  float modulo_ftang=m*g;
  float a=0.0;
  //Fk = ks*(Lactual − Lreposo) − kd*vmuelle
  Fk.y= -ks*(pos-lon)-(kd*v);
  ftotal.y=modulo_ftang+Fk.y;
  
  //F = m * a | Devolvemos la aceleración:
  a=ftotal.y/m;
  return a;
}

void draw(){
  background(0);
  
  fill(186,18,136);
  textSize(20);
  if(modelo)
     text("-Con amortiguación (Euler)-", 20, 260);
  else
     text("-Sin amortiguación (Euler)-", 20, 260);
     
  text("Leyenda teclado:", 20, 100);
  text("Con amortiguación: 'a'", 50, 130);
  text("Sin amortiguación: 's'", 50, 160);
  

  //Muelle utilizando Euler
  a_eu.y=calcFuerzas(p_eu.y, v_eu.y);
  v_eu.y=v_eu.y+a_eu.y*dt;
  p_eu.y=p_eu.y+v_eu.y*dt; //Euler semi-implicito
  
  //Pintamos la cuerda y la bola
  pushMatrix();
  translate(width/2,0);
  fill(186,18,136);
  stroke(255,255,255);
  line(0,0,0,p_eu.y);
  
  translate(0,p_eu.y);
  ellipse(0,0,50,50);
  popMatrix();
   
}

void keyPressed(){
  if(key=='a'){
    modelo = true;
    v_eu=new PVector(45,-90);
    p_eu=new PVector(0,600);
    a_eu=new PVector(45,-90);

    Fk=new PVector(0,0);
    ftotal=new PVector(0,0);

    kd=0.05;
    setup();
  }
  
  if(key=='s'){
    modelo = false;
    v_eu=new PVector(45,-90);
    p_eu=new PVector(0,600);
    a_eu=new PVector(45,-90);

    Fk=new PVector(0,0);
    ftotal=new PVector(0,0);
    
    kd=0.00;
    setup();
  }
}


