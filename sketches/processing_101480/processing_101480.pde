
// defino el array
ball[] pelo =new ball[20];

void setup() {

  noStroke();
  size(700,350);
  smooth();

  // creo cada objeto
  for (int i=0; i<pelo.length; i++) {
    color c= color(random(255), random(255), random(255), random(80, 125));
    float d=random(20, 50);
    pelo[i] =new ball(c, d);
  }
}
//imprime en lla pantalla
void draw() {
  background(255);
text("Click the Screen",50,50 );
  for (int i=0;i<pelo.length;i++) {
    pelo[i].run();
  }
}

class ball {
  //variables global
  PVector location;
  PVector velocity;
  PVector aceleracion;
  PVector mouse;
  PVector dir;
  color c;
  float diametro;
  float mass;
  float scalar=0.3;
  
  //constructor 
  ball(color cl, float d) {
    c= cl;
    diametro=d;
    mass= d/2;
    location = new PVector(random(d,width-d), random(d,height-d));
    velocity = new PVector(random(-2,2), random(-2,2));
    aceleracion = new PVector(0,0);
    
  }

  //funcion
  void run() {
    PVector gravedad = new PVector(0,0.15*mass);
    
    float coef= 0.6;
    PVector friccion = velocity.get();
    friccion.mult(-1);
    friccion.normalize();
    friccion.mult(coef);
    
    fondo();
    applyForce(friccion);
    applyForce(gravedad);
    update();
    rebote();
  }
  
  void applyForce(PVector force){
  PVector f = PVector.div(force,mass);
  aceleracion.add(f);
  
  
  }
  
 void fondo() {
    fill(c);
    ellipse(location.x, location.y, diametro, diametro);
  }

   
  void update() {
    mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);
    dir.normalize();
  dir.mult(scalar);
  if(mousePressed){
    
    if (mouseButton == LEFT){
      aceleracion.add(dir);
    }
    
    if (mouseButton == RIGHT){
    PVector F = PVector.mult(dir,-1);
    aceleracion.add(F);
    }
      
  }
  velocity.add(aceleracion);
    velocity.limit(10);
    location.add(velocity);
    aceleracion.mult(0);
  }

  
  
   void rebote() {
    if (location.x<diametro/2){
      velocity.x*= -1;
      location.x=diametro/2;
    }
      if (location.x>width-diametro/2) {
      velocity.x*= -1;
      location.x=width-diametro/2;
    }
    
     if (/*location.y<diametro/2||*/location.y>height-diametro/2) {
      velocity.y*= -1;
      location.y= height-diametro/2;
    }
  }
   
}



