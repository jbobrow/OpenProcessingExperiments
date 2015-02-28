
// basado en The Nature of Code de Daniel Shiffman

Mover m;

void setup() {
  size(1920,1080);
  m = new Mover();
}

void draw() {
  

  PVector viento = new PVector(0.01,0);
  PVector gravedad = new PVector(0,0.1);
  m.applyFuerza(viento);
  m.applyFuerza(gravedad);
  
  m.actualizacion();
  m.dibujo();
  //m.bordes();
  m.attractToMouse();
  
}


   









class Mover {

  PVector ubicacion;
  PVector velocidad;
  PVector aceleracion;
  float masa;
  int sz = 10;

  float cSegundos = map(second(),0,59,0,255);
  float cMinutos = map(minute(),0,59,0,255);
  float cHoras = map(hour(),0,23,255,0);


  Mover() {
    ubicacion = new PVector(0, 0);
    velocidad = new PVector(0, 0);
    aceleracion = new PVector(0, 0);
    masa = random(20,30);
  }

  void applyFuerza(PVector fuerza) {
    PVector f = PVector.div(fuerza, masa);
    aceleracion.add(f);
  }

  void actualizacion() {
    velocidad.add(aceleracion);
    ubicacion.add(velocidad);
    aceleracion.mult(0);
    
  }


  void dibujo() {
    noStroke();
    //stroke(255,255,255);
    fill(cSegundos*0.000001,2);
     print(cSegundos*4);
    print(cSegundos*0.000001); 
    rect(0,0,width,height);
    //strokeWeight(1);
    fill(cSegundos*4, cSegundos*4,cSegundos*4, 80);
    ellipse(ubicacion.x, ubicacion.y, sz, sz);
  }

  void bordes() {

    if (ubicacion.x > width) {
      ubicacion.x = width;
      velocidad.x *= -1;
    } 
    else if (ubicacion.x < 0) {
      velocidad.x *= -1;
      ubicacion.x = 0;
    }

    if (ubicacion.y > height) {
      velocidad.y *= -1;
      ubicacion.y = height;
    }
  }

  void attractToMouse() {
    PVector mouseVector = new PVector(mouseX, mouseY);
    PVector dis = PVector.sub(mouseVector, ubicacion);
    dis.normalize();
    //dis.mult(0.9);
    //dis.div(50);
    applyFuerza(dis);
    
  }
 } 
  void mousePressed() {
   
   if (mousePressed==true) {
    m.ubicacion.x = mouseX;
    m.ubicacion.y = mouseY;
  }  
}
  //
  //}

  //  void KeyPressed() {
  //  
  //  if (mousePressed==true) {
  //      PVector gravedad = new PVector(0,0);
  //      
  //    }
  //  }
 






