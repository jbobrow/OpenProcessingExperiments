

String filename;

float margen = 14.0;
float inclinacion;

Dibujo dib;

void setup(){
  size(800, 500);
  dib = new Dibujo();
  smooth();

}

void draw(){
  background(255);
 
  dib.dibuja();
  flecha();
}

Achurado actual;
Linea ultimaLinea;

void mousePressed(){
  dib.nuevoAchurado(mouseX, mouseY, inclinacion);
  actual = (Achurado) dib.achurados.get(dib.achurados.size() - 1);
}

void mouseDragged(){
  ultimaLinea = (Linea) actual.lineas.get(actual.lineas.size() - 1);
  float separacion = dist(mouseX, mouseY, ultimaLinea.x, ultimaLinea.y);
  if(separacion >= actual.espaciador){
    actual.lineas.add(new Linea(mouseX, mouseY, inclinacion));
  }
}

void keyPressed(){
  if(key == ' '){
    dib.achurados.clear();
  }

  if(key == 'n'){
    dib.todasCrecen();
  }

  if(key == 'p'){
    exportPDF();
  }
  if(key == 'z'){
    inclinacion -= 0.1;
  }
  if(key == 'x'){
    inclinacion += 0.1;
  }
}

float inclinacion(){
  /*
  pushMatrix();
   translate(mouseX, mouseY);
   float incl = atan2(pmouseY - mouseX, pmouseX - mouseY);
   popMatrix();
   return incl;
   */
  return random(TWO_PI);
}

void exportPDF(){
  filename = "pdf/"+month()+"-"+day()+"-"+hour()+"-"+minute()+"-"+second()+".pdf";
  cartas = (PGraphicsPDF)createGraphics(width, height, PDF, filename);//(PGraphicsPDF)beginRecord(PDF, filename);
  println("voy a grabar el archivo "+filename);
  rec = true; 
}

void flecha(){
  pushMatrix();
  translate(30, height - 30);
  rotate(inclinacion);
  stroke(200, 0, 0);
  strokeWeight(1.5);
  line(-5, 0, 5, 0);
  line(0, -5, 5, 0);
  line(0, 5, 5, 0);
  popMatrix(); 
}
class Achurado{
  ArrayList lineas;
  float ang, espaciador;
  float x, y;
  boolean automata;
  int lineasMax;

  Achurado(float _x, float _y, float t){
    x = _x;
    y = _y;
    ang = t;
    lineas = new ArrayList();
    lineas.add(new Linea(x, y, ang));
    espaciador = random(2, 7);
    lineasMax = round(random(10, 50));
  }

  void nuevaLinea(){

    if(automata){

      int index = especial.puntos.size() - 1;
      if(index % 2 == 0){
        Punto p = (Punto)especial.puntos.get(index);
        lineas.add(new Linea(p.x, p.y, ang));
        Linea ant = (Linea)lineas.get(lineas.size()-1);
        ant.automata = true;
      }
    }
    else{
      float inc = espaciador + random(-1, 1);
      float incX = (cos(ang+PI) * inc) + random(inc);
      float incY = (sin(ang+PI) * inc) + random(inc);
      Linea anterior = (Linea)lineas.get(lineas.size()-1);
      lineas.add(new Linea(anterior.x + incX, anterior.y + incY, ang));
    }
  }

  void dibuja(){
    for(int i = lineas.size()-1; i>= 0; i--){
      Linea l = (Linea) lineas.get(i);
      l.dibuja();
    }

    if(automata && (lineas.size() < lineasMax)){
      nuevaLinea();
    }
  }

  void alargaLineas(){
    for(int i = lineas.size()-1; i>= 0; i--){
      Linea l = (Linea) lineas.get(i);
      l.nuevoPunto();
    }
  }

  Linea especial(){
    Linea esp = (Linea) lineas.get((int)random(lineas.size())); 
    return esp;
  }
}
class Dibujo{
  ArrayList achurados;

  Dibujo(){
    achurados = new ArrayList();
  } 

  void nuevoAchurado(float x, float y, float t){
    achurados.add(new Achurado(x, y, t));
  }

  void nuevoAchurado(){
    achurados.add(new Achurado(mouseX, mouseY, random(TWO_PI)));
  }

  void dibuja(){
    for(int i = achurados.size()-1; i>= 0; i--){
      Achurado a = (Achurado) achurados.get(i);
      a.dibuja();
    }
  }

  void todasCrecen(){
    for(int i = achurados.size()-1; i>= 0; i--){
      Achurado a = (Achurado) achurados.get(i);
      for(int j = a.lineas.size()-1; j>= 0; j--){
        Linea l = (Linea) a.lineas.get(i);
        l.nuevoPunto();
      }
    }
  }
}
Linea especial;
void mouseReleased(){
  for (int i = actual.lineas.size() - 1; i >= 0; i--){
    Linea lin = (Linea) actual.lineas.get(i); 
    lin.crece = false;
  }
  /*
  especial = actual.especial();
   especial.especial = true;
   dib.achurados.add(new Achurado(especial.anterior.x, especial.anterior.y, especial.ang - HALF_PI));
   Achurado nuevo = (Achurado)dib.achurados.get(dib.achurados.size() - 1);
   nuevo.automata = true;
   */
}

class Linea{
  ArrayList puntos;
  float x, y, ang, inc; // t = ángulo teta
  float grosor;
  boolean crece;
  Punto anterior;

  boolean especial;
  boolean automata;
  boolean fuera;
  int puntosMax;


  Linea(float _x, float _y, float _t){
    x = _x;
    y = _y;
    ang = _t;
    puntos = new ArrayList();
    inc = random(1,2);
    grosor = 1;
    puntos.add(new Punto(x, y));
    crece = true;

    ////// casos de lineas automatas //////
    puntosMax = (int)random(100, 300);
  }

  Linea(){
    x = margen + random(width  - margen);
    y = margen + random(height - margen);
    ang = inclinacion;
    puntos = new ArrayList();
    inc = random(2, 7);
    grosor = 0.25;
    puntos.add(new Punto(x, y));
  }

  void nuevoPunto(){

    float incX = (cos(ang) * inc) + random(-inc/3, inc/3);
    float incY = (sin(ang) * inc) + random(-inc/3, inc/3);

    anterior = (Punto)puntos.get(puntos.size()-1);
    puntos.add(new Punto(anterior.x + incX, anterior.y + incY));

    if(anterior.x + incX < margen || anterior.x + incX > width - margen ||
      anterior.y + incY < margen || anterior.y + incY > height - margen){
      fuera = true;
      crece = false;
      especial = false;
      automata = false;
    }
  }

  void dibuja(){    
    noFill();
    beginShape();
    strokeWeight(grosor);
    stroke(0);
    for(int i = puntos.size()-1; i>= 0; i--){
      Punto p = (Punto) puntos.get(i);
      vertex(p.x, p.y);
    }
    endShape();

    Punto ultimo = (Punto) puntos.get(puntos.size()-1);

    if(crece || especial || (automata && (puntos.size() < puntosMax))){
      nuevoPunto();
    }

    if(!especial && puntos.size() > puntosMax){
      crece = false;
    }

    if(puntos.size() > puntosMax * 2){
      especial = false;
    }
  }
}
class Punto{
  float x, y;

  Punto(float _x, float _y){
    x = _x;
    y = _y;
  }

  Punto(){
    x = margen + random(width  - margen);
    y = margen + random(height - margen);
  }
}


