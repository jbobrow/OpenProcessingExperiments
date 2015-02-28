
int v1;
circulo[] forma;
boolean dos=true;
PFont myfont;
void setup() {
  size(500,400);
  ellipseMode(CENTER);
  forma =new circulo[2];
  smooth();
  for (int i=0;i<=1;i++) {
    forma[i]=new circulo((int)random(20, 50), new PVector(random(0, 400), random(0, 400)), (int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  }
}

void draw() {
  background(50);
  print(dos);
  if(((forma[0].verificar()) && (forma[1].verificar()==false)) || ((forma[0].verificar()==false) && (forma[1].verificar()))){
   dos=false;
  }else{
    dos=true;
  }
  
  for (int i=0;i<=1;i++) {
    v1=(int)random(-1100,1100);
    forma[i].rebotar(v1);
    forma[i].mostrar(dos);
  }
  if((forma[0].verificar()) && (forma[1].verificar())){
    //textMode(CENTER);
    background(245,109,134);
    int i=0;
    if(i<255){
      fill(0,0,0,i);
     i=i+1; 
    }
  }
 
}


class circulo {

  PVector gravedad;
  private PVector direccion;
  operar linea;
  float v= 0;
  int x, y, z;
  PVector Velocidad;
  PVector Aceleracion;
  float diametro;//masa
  PVector pos=new PVector();
  boolean dos;
  circulo(int diametro, PVector pos, int x, int y, int z) {
    this.x=x;
    this.y=y;
    this.z=z;
    this.diametro=diametro;
    this.pos=pos;
    Aceleracion=new PVector(0, 0);
    Velocidad=new PVector(0, 0);
    linea=new operar();
    direccion=new PVector();
  }


  void mostrar(boolean dos) {
    this.dos=dos;
    noStroke();
    float viento= map(noise(v),0,1,-8,8);
    fill(x, y, z, 102);
    ellipse(pos.x, pos.y, diametro, diametro);
    linea.mostrar(dos);
    gravedad=new PVector(0, 0.4*diametro);
    PVector resistencia=Velocidad.get();
    float perder = 5.7;
    resistencia.mult(-1);
    resistencia.normalize();
    resistencia.mult(perder);//
    aplicarFuerza(new PVector(viento,0));
    aplicarFuerza(gravedad);
    aplicarFuerza(resistencia);
    Actualizar();
    v+=0.03;
  }
  void Actualizar() {//velocidad
    Velocidad.add(Aceleracion);
    Velocidad.limit(11);
    pos.add(Velocidad);
    Aceleracion.mult(0);
  }
  //fuerza
  void aplicarFuerza(PVector f) {
    PVector M=PVector.div(f, diametro);
        Aceleracion.add(M);
  }
  boolean verificar(){
    if(pos.y>height-diametro/2){
        return true;
      }else{
        return false;
       }
  }
  void rebotar(int v) {
    if (pos.y<0+diametro/2) {
      Velocidad.y=Velocidad.y*-1;
      if(pos.y>diametro/2){
        pos.y=diametro/2;
      }
    }
    
    if(pos.y>(height-10)-diametro/2 && pos.y<(height-10)+diametro/2 && pos.x>mouseX-60 && pos.x<mouseX+60){
       Velocidad.y=(Velocidad.y+30)*-1;
       direccion.x=v;
       aplicarFuerza(direccion);
      }
    
    if (pos.x<0+diametro/2 || pos.x>width-diametro/2) {
      Velocidad.x=Velocidad.x*-1;
      if(pos.x<0+diametro/2){
        pos.x=diametro/2;
      }if(pos.x>width-diametro/2){
        pos.x=width-diametro/2;
      }
    }
  }
 
}


 class operar{

  void mostrar(boolean dos){
    stroke(0);
    strokeWeight(7);
    fill(0);
    if(dos){
    line(mouseX-60,height-10,mouseX+60,height-10);
    }else{
    line(mouseX-30,height-10,mouseX+30,height-10);
    }
  }
  
  
}


