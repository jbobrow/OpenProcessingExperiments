
ArrayList asteroides = new ArrayList();
ArrayList n = new ArrayList();

//declaramos variables
PVector gravedad, posicionasteroide, posicionnave, pscompasteroide, pscompnav;
int numeronav = 1;
boolean navecreada = false;
int lastRecordedasteroide = 0;
int lastRecordedgrav = 0;
int intervalasteroide = 500;
int intervalgrav = 10000;
int damage = 50;
int score = 0;
int resultado = 0;
boolean finaljuego = false;


void setup() {
  size(600, 450);
  smooth(); 

  //inicializamos variables
  gravedad = new PVector(0.0001, 0.0005);
  posicionnave= new PVector(random(width), random(height));
  nave fol = new nave(posicionnave, random(0.01, 0.05), random(10, 20));
  n.add(fol);
}

void draw() {

  background(0);
  
  ///////////////////////// TEXT //////////////////////////////////
  
  if(damage>=0){
  fill(0,255,0);
  score=second()*10;
  text("SCORE ", width-120, 30);
  textAlign(RIGHT);
  text(score, width-15, 30);
  textAlign(LEFT);
  text("DAMAGE ", width-90, 60);
  text(damage, width-30, 60);
  noStroke();
  }
  
  
  
  posicionasteroide= new PVector(random(width), -10);
  posicionnave= new PVector(random(width), random(height));
  
  
   ///////////////// CONTROLADOR NIVEL ///////////////////////////
   
   if(millis()>20000){
     intervalasteroide = 250;
   }
   
     if(millis()>40000){
     intervalasteroide = 125;
   }
   
     if(millis()>60000){
     intervalasteroide = 75;
   }
   
    if(millis()>80000){
     intervalasteroide = 30;
   }
   
  
  ///////////////// CONTROLADOR TIEMPO ///////////////////////////
  
  if(millis()-lastRecordedasteroide>intervalasteroide){
   //creamos asteroides
asteroide c = new asteroide(posicionasteroide);
  asteroides.add(c);
   lastRecordedasteroide = millis();
  }
  
  
    if(millis()-lastRecordedgrav>intervalgrav){
       if (gravedad.x == 0.0001){
         gravedad.x = -0.0001;
         lastRecordedgrav = millis();
       }else{
         gravedad.x = 0.0001;
         lastRecordedgrav = millis();
       }
     }
  
  
  //////////////// INICIAR CLASES /////////////////////////////
  
  
  if (navecreada==false){
  for (int i=0; i<numeronav; i++){
     for (int e=0; e<n.size(); e++) {
     nave tempF = (nave) n.get(e);
    tempF.run();
    pscompnav=tempF.pos;
     }
  }
  }
  

  for (int i=0; i<asteroides.size(); i++) {
    asteroide c = (asteroide) asteroides.get(i);
    c.addForce(gravedad);
    c.run();
    pscompasteroide=c.posicion;
    
    
    if(((pscompnav.x)-(pscompasteroide.x)<7 && (pscompnav.x)-(pscompasteroide.x)>-7) && ((pscompnav.y)-(pscompasteroide.y)<7 && (pscompnav.y)-(pscompasteroide.y)>-7)){
    damage = damage-1;
    } 
  }
  
  
  if(damage<0){
    if(finaljuego==false){
    resultado=score;
    finaljuego=true;
    }
    
    textAlign(CENTER);
    fill(0,255,0);
   text("GAME OVER ", width/2, height/2);
   text("Your score is", width/2, height/2+20);
   text(resultado, width/2, height/2+40);
   textAlign(LEFT);
  }
}


class asteroide {

  PVector posicion, velocidad, acceleracion;
  float friccion, mySize, myMass;

  asteroide(PVector _posicion) {
    posicion = _posicion;
    velocidad = new PVector(0,0);
    acceleracion = new PVector(0,0);
    mySize = random(4,10);
    myMass = 25-mySize;
    myMass /=150;
    friccion = 0.3;
  }

  void run() {
    update();
    drawMe();
  }

  void update() {  
    //AÃ±adimos el valor de gravedad (aceleraciÃ³n) a la velocidad y velocidad a posiciÃ³n
    velocidad.add(acceleracion);
    posicion.add(velocidad);
    acceleracion.mult(0);

  }

  void drawMe() {

    fill(255);
    noStroke();
    ellipse(posicion.x,posicion.y,mySize,mySize);
  }

  void addForce(PVector _f) {

    PVector f = PVector.div(_f,myMass);
   
    acceleracion = f;
  }
}

class nave{
  //variables
  PVector pos;
  float vel;
  float sz; 
  //constructor
  nave(PVector _pos, float _v, float _sz){
    pos = _pos;
    vel = _v;
    sz = _sz;
  }
  void run(){
    actualizar();
    dibujar();
  }
  void actualizar(){
    PVector mouse = new PVector(mouseX,mouseY);
    mouse.sub(pos);
    mouse.mult(vel);
    pos.add(mouse);
    
  }

  void dibujar(){
    fill(255);
  pushMatrix();     
  float a = atan2(mouseY-pos.y, mouseX-pos.x);
  translate(pos.x,pos.y);
  rotate(a);
  triangle(0,0,-25,-8,-25,8);
  popMatrix(); 
  }
}
