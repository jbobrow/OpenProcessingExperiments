
/* Ejercicio: Simular el modelo de péndulo introducido. */
Bola b;
PVector gravity = new PVector(0,9.8);
PVector posicion = new PVector(219, 50);
float longitud = 220;
float delta_t = 0.1;

void setup(){
  size(438,380);
  b  = new Bola(posicion, 150);
}

void draw(){
  background(50);
  b.run();
}
class Bola {
  PVector origen;
  PVector aceleracion;
  PVector velocidad;
  PVector pos;
  float posX, posY;
  float longitud_p;
  float masa = 20;
  PVector pes;
  float angle;
  float delta_t = 0.1;
  
  Bola(PVector posicion, float longi){
    origen = posicion.get();
    longitud_p = longi;
    pos = new PVector();
    //angle = PI/4;
    aceleracion = new PVector();
    velocidad = new PVector();
    posX = origen.x + longitud_p*sin(radians(40));
    posY = origen.y + longitud_p*cos(radians(40));
    pos.set(posX,posY);
    pes = gravity.get();
    pes.mult(masa);
  }
    
  void calcularForce() {
    float centripeta;
    PVector tension;
    float mgcos;
    PVector dir_cuerda = new PVector();
    PVector dir_unitaria = new PVector();
    
    dir_cuerda.x = pos.x - origen.x;
    dir_cuerda.y = pos.y - origen.y;
    
    centripeta =(masa * pow(velocidad.mag(),2))/longitud_p;
    dir_unitaria.set(dir_cuerda);
    dir_unitaria.normalize();
    //dir_cuerda.normalize(dir_unitaria);
    mgcos = proyeccion(pes, dir_cuerda);
    tension = PVector.mult(dir_unitaria, (-(centripeta +mgcos)));
    
    applyForce(pes);
    applyForce(tension);
    
  }
  
  float proyeccion(PVector vector1, PVector vector2) 
  {
    float pr = 0;
    if( (vector1.mag() != 0) && (vector2.mag() != 0) ){
      pr = vector1.dot(vector2) / vector2.mag();
    }
    return pr;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force.get(), masa);
    aceleracion.add(f);
  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
    calcularForce();
    
    velocidad.sub(PVector.mult(aceleracion, delta_t));
    pos.sub(PVector.mult(velocidad,delta_t));
    
    aceleracion.set(0,0);
  }
    
  void display() {
    fill(255);
    line(origen.x,origen.y, pos.x,pos.y);
    ellipse(pos.x,pos.y, 30,30);
  }
}
    


