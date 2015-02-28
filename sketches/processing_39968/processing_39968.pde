
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;

PImage a;  
VerletPhysics2D physics;

List<Equipo> equipos;
List<Equipo> equiposIn;
List<Node> nodes;

void setup() {

  colorMode(HSB, 100);
    smooth();
  physics=new VerletPhysics2D();

  equipos=new ArrayList<Equipo>();
  equiposIn=new ArrayList<Equipo>();
  nodes=new ArrayList<Node>();
  a = loadImage("peter_medium.png");  // Load the image into the program  
  // a = loadImage("peters_small.jpg");  // Load the image into the program  
//  size(a.width, a.height);
size(801, 520);
  println(a.width+" - "+a.height);
  equiposIn.add(new Equipo("bogota", 133, 145));
  equiposIn.add(new Equipo("bamako", 224, 122));
  equiposIn.add(new Equipo("evry", 238, 39));
    equiposIn.add(new Equipo("montreuil", 243, 43));
    equiposIn.add(new Equipo("palma", 241, 61 ));
   equiposIn.add(new Equipo("barcelona", 236, 55));
    equiposIn.add(new Equipo("sale", 224, 72));
   equiposIn.add(new Equipo("pikine", 210, 121));
    equiposIn.add(new Equipo("rio", 175, 221));
    equiposIn.add(new Equipo("elalto", 141, 174));

  physics.setWorldBounds(new Rect(10, 10, width-10, height-10));

}
int equipo=6;

float dameIncremento(float x, float y) {
  if (x>y) return y;
  return x;
}
public Node addParticle(float x, float y){
  Node n=new Node(new Vec2D(x, y));
  nodes.add(n);
  physics.addParticle(n);
  return n;
}
int contador;
void draw() {
    physics.update();
if (frameCount%45==0 && equipos.size()!=equiposIn.size()) {

  Equipo inE=equiposIn.get(contador);
   physics.addBehavior(new AttractionBehavior(new Vec2D(inE.x+random(-2,2), inE.y+random(-2,2)), 20, 0.05,0.5));

  Node centerP=new Node(new Vec2D(inE.x+random(-5,5), inE.y+random(-5,5)));
  centerP.lock();
  physics.addParticle(centerP);


  equipos.add(inE);
  for(int i=0; i<5;i++){

  Node aP = addParticle(inE.x+random(-5,5), inE.y+random(-5,5));
  if (random(0,2)>1) {
  comentarios.add(aP);
}

   VerletSpring2D spring=new VerletSpring2D(centerP,aP,500,-0.000001);
    physics.addSpring(spring);
  }
  contador++;
}
  float dameX1=dameX1();
  float dameX2=dameX2();
  float dameY1=dameY1();
  float dameY2=dameY2();
  println(dameX1+","+dameY1+" - "+dameX2+","+dameY2);
  float anchoRepresentar=dameX2-dameX1;
  float altoRepresentar=dameY2-dameY1;
  float escalaProvX=(width/anchoRepresentar);
  float escalaProvY=(height/altoRepresentar);
  println("escalaProvX:"+escalaProvX);
  println("escalaProvY:"+escalaProvY);
  if (equipos.size()>1) {
    // 

    float incremento=dameIncremento(escalaProvX, escalaProvY);
    println("incremento:"+incremento);
    scale(incremento);

    float posicionX;
    float posicionY;
    //desplazamiento inversamente proporcional a la escala
    float cantidadCentrado;
    if (incremento==escalaProvX) {
      posicionX=dameX1;
      posicionY=dameY1-(altoRepresentar/incremento);

    }     
    else {
            posicionX=dameX1-(anchoRepresentar/incremento);
     posicionY=dameY1;

    }
    cantidadCentrado=0;
    float origenX;
    float origenY;
    origenX=-posicionX+cantidadCentrado;
    origenY=-posicionY+cantidadCentrado;
    translate(origenX, origenY);
  }
  image(a, 0, 0); 
  for (Node e:nodes) {
    noStroke();
    fill(random(100), 100, random(50, 80));
    ellipse(e.x, e.y, 4, 4);
  }
for(int i=0; i<comentarios.size(); i++){
    Node inicio=comentarios.get(i);
  Node fin=comentarios.get(int(random(comentarios.size()-1)));
  if(inicio==fin) continue;
  stroke(0);
  noFill();
  strokeWeight(0.2);
  println("lineando");
    bezier(inicio.x, inicio.y,
    inicio.x+(fin.x-inicio.x)/4,
   inicio.y-(fin.y+inicio.y)/4,
 fin.x-(fin.x-inicio.x)/4,
  fin.y-(fin.y+inicio.y)/4,
    fin.x, fin.y);

}
  if(debug)
   pintaZoomCuadro(dameX1,dameX2, dameY1, dameY2 );
 }
  List<Node> comentarios=new ArrayList<Node>();

 void pintaZoomCuadro(float x1, float x2, float y1, float y2 ){
  noFill();
  stroke(0);
  strokeWeight(0.5);
  rect(x1, y1, x2-x1, y2-y1);

 }
boolean debug;


void mousePressed() {
  debug=true;
}
void mouseReleased() {
  debug=false;
}


float dameX1() {
  float resultado=width;
  for (Equipo e: equipos) {
    if (e.x<resultado)
      resultado=e.x;
  }
  return resultado;
}
float dameX2() {
  float resultado=0;
  for (Equipo e: equipos) {
    if (e.x>resultado)
      resultado=e.x;
  }
  return resultado;
}
float dameY1() {
  float resultado=height;
  for (Equipo e: equipos) {
    if (e.y<resultado)
      resultado=e.y;
  }
  return resultado;
}
float dameY2() {
  float resultado=0;
  for (Equipo e: equipos) {
    if (e.y>resultado)
      resultado=e.y;
  }
  return resultado;
}


class Equipo {
  //TODO: tener en cuenta los espacios
  int widthEscala=500;
  int heightEscala=319;

  String nombre;
  float x;
  float y;

  public Equipo(String _n, int _x, int _y) {
    this.nombre=_n;
    this.x=map(_x, 0, widthEscala, 0, width);
    this.y=map(_y, 0, heightEscala, 0, height);
  }
}
class Node extends VerletParticle2D {

  Node(Vec2D pos) {
    super(pos);
  }

  // All we're doing really is adding a display() function to a VerletParticle
  void display() {
    fill(0, 150);
    stroke(0);
    ellipse(x, y, 6, 6);
  }
}


