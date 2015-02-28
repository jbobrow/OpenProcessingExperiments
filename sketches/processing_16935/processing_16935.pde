

Esfera[] sphere = new Esfera[1];
float angulo1 = 0;

void setup() {
size(800,600,P3D);
 
for (int i = 0; i < sphere.length; i++ ) {
sphere[i] = new Esfera(170 + i*100,i + 80);
  }
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2,height/2);
  rotateY(angulo1);
  lights ();
  fill(255);
  sphere(100);

  for (int i = 0; i < sphere.length; i++ ) {
    
    sphere[i].update();
    sphere[i].display();
  }
  popMatrix();
   angulo1 += 0.06;
}
class Esfera {

  float theta;      
  float diametro;   
  float distancia;   
  float velocidad; 
  
  Esfera(float distancia_, float diametro_) {
    distancia = distancia_;
    diametro = diametro_;
    theta = 0;
    velocidad = random(0.02,0.02);
  }
  
  void update() {
    theta += velocidad;
  }
  
  void display() {
    pushMatrix(); 
rotate(theta); 
 translate(distancia,50); 
    noStroke();
    fill(57,142,175);
    sphere(60);
  popMatrix(); 
  }
}


