
/*Ejercicio: Implementar la detección y respuestas a las
colisones con planos.*/

/*
 * ALINA HONHALA
 * 3º GIM
 */
 
Tablero pim;
ArrayList<Particle> bolas;
float dt = 0.4;
float radio = 18;
int i=0;
float puntos = 0;
PVector velIni = new PVector();
 

void setup() {
  size(800,600);
  
  // Campo: Extremos de la pantalla
  pim = new Tablero();
  
  // Bolas
  bolas = new ArrayList<Particle>(); 
  
}

void draw() {
  background(193,207,252);
  fill(255);
  
  // Actualiza las partículas: colisiones y dibujado
  for (int i=0;i<bolas.size();i++){
    Particle p = bolas.get(i);
    p.update();
    for (int j=i+1;j<bolas.size();j++){
      Particle q = bolas.get(j);
      //p.collision(q);
    }
    p.display();
  }
  
  fill(135,7,37);
  text("Puntos: " + puntos, (width/2)-50, 110);
 
 // Calcula Colisiones y dibuja el Pimball 
  pim.update();
  pim.display(); 
}

void mousePressed()
{
  PVector pos = new PVector(mouseX, mouseY);
  Particle p = new Particle(pos, radio);
  bolas.add(p);
}
class Particle
{
  float masa = 1.0;
  PVector place;
  PVector vel;
  PVector a; //aceleracion
  float radio;
  PVector gravedad = new PVector(0,0);
  
  
  Particle(PVector local, float radio_)
  {
    place = local.get();
    vel = new PVector( random(-20,20), random(-20,20) );
    a = new PVector();
    radio = radio_;
  }
  
  void applyForce(PVector force)
  {
    PVector fuerza = PVector.div(force.get(),masa);
    a.add(fuerza);
  }
  
  void display()
  {
    fill(95,217,247);
    ellipse(place.x, place.y, radio*2, radio*2);
  }
  
  void update() //Metodo Euler(semi)
  {
    applyForce(gravedad);
    vel.add(PVector.mult(a,dt));
    place.add(PVector.mult(vel,dt));
    a.set(0,0);
  }
  
  void run()
  {
    update();
    display();
  }
  
}

class Plano{
  PVector pto1;
  PVector pto2;
  PVector plano;  
  PVector normal;
  float Kr= 0.9;
  boolean plano_puntos = false;
  //Plano que suma puntos: true
  //Plano que no suma: false
  
  PVector dif1, dif2, VecP1Project, VecP2Project ;
  float escalar_p1Norm;
  float escalar_p1Plano, escalar_p2Plano, modulo_plano, magP1, magP2;
  float p1Project, p2Project;
  PVector perpend, unitario;
  
  Plano(float x1, float y1, float x2, float y2, boolean plano_p)
  {
    pto1 = new PVector(x1,y1);
    pto2 = new PVector(x2,y2);
    plano = PVector.sub(pto2, pto1);
    normal =  new PVector(-plano.y, plano.x);
    normal.normalize();
    plano_puntos = plano_p;
  }
  
  // Colisiones con el plano (pto1, pto2)
  void checkCollisions(Particle b)
  {
    //dif = place - pto
    dif1 = PVector.sub(pto1,b.place); //vectores plano-partícula
    dif2 =PVector.sub(pto2,b.place);
    
    unitario = new PVector(0,0);//Vector unitario del plano
    modulo_plano = plano.mag();//Modulo del plano

    /*
    Calculamos las proyecciones de los vectores plano-partícula en el plano.
    v * w = |v| * |w| *  cos (ang), por lo que podemos obtener la proyección
    como (v*w) / |w|
    */
    escalar_p1Plano = dif1.dot(plano);
    p1Project = escalar_p1Plano/modulo_plano;
    
    escalar_p2Plano = dif2.dot(plano);
    p2Project = escalar_p2Plano/modulo_plano;

    //Calculamos el vector unitario del plano, obteniendo su dirección
    unitario.set(plano);
    unitario.normalize();
    //plano.normalize(unitario);
    
    //Vector perpendicular de distancia entre la partícula y el plano
    perpend = PVector.add(dif1,PVector.mult(unitario, p1Project*(-1)));
    
    
    //DETECCIÓN DE COLISIONES PARTÍCULA-PLANO
    
    //Si las proyecciones son menos que la longitud del plano:
    if(abs(p1Project) < modulo_plano && abs(p2Project) < modulo_plano)
    {
      //Si la partícula atraviesa el plano:
      if(perpend.mag() < radio){
    
        //Invertimos la normal del plano si...
        PVector direc_n = normal.get();
        if(direc_n.dot(b.vel)>0)
           direc_n.mult(-1);
        
        float angle = PVector.angleBetween(b.vel, plano);
        
        //Delta_s = ( radio + ( dir perpendicular · normal) ) / sin(ang)
        //var deltaS:Number = (_ball.radius+dist.dotProduct(normal))/Math.sin(angle);
        float d_s = ( radio+perpend.dot(direc_n) ) / sin(angle);
        
        //Vector desplazamiento para reposicionar la partícula
        PVector desplazamiento = PVector.mult(direc_n, d_s);
        b.place.add(desplazamiento);
        
        if(plano_puntos)
        {
          puntos += 5;
          Kr = 1.0;
        }
        
        //Comprobación: b.vel.set(0,0);
       
        //La velocidad se descompone en normal y tangencial al plano
        float nv = normal.dot(b.vel);
        PVector vN = PVector.mult(normal,nv);
        PVector vT = PVector.sub(b.vel,vN); 
        b.vel = PVector.sub(vT,PVector.mult(vN,Kr));
      }
    }
     
  }

}



class Tablero {
  
  ArrayList<Plano> planos;

  Tablero()
  {
    int maxPlanos = 6;
    planos = new ArrayList<Plano>();
    
    Plano arriba = new Plano(15, 15, width-15, 15, false);
    Plano derecha = new Plano(width-15, 15, width-15, height, false);
    Plano tunel = new Plano(width-70, 15+110, width-70, height, false);
    Plano izquierda = new Plano(15, 15, 15, height-35, false);
    Plano diagonal = new Plano(width-80,15, width-15,70, true);
    
    //Triángulo
    Plano t = new Plano((width/2)-100,80, (width/2)+80,80, false);
    Plano t1 = new Plano((width/2)-100,80, width/2-15, 160, true);
    Plano t2 = new Plano((width/2)+80,80, width/2-15, 160, true);
    
    //Planos inclinados
    Plano inclinadoIzq = new Plano((width-55)/2-250,height-250,(width-55)/2-100,height-150, true);
    Plano inclinadoDer = new Plano((width-55)/2+100,height-150,(width-55)/2+250,height-250, true);
    
    Plano baseIzq = new Plano((width/2)-90,height-35,15, height-35, false);
    Plano baseDer = new Plano((width/2)+40,height-35,width-70,height-35, false);
    
    //Palancas
    Plano palancaIzq = new Plano((width/2)-90,height-35, (width/2)-30, height-10, true);
    Plano palancaDer = new Plano((width/2)+40,height-35, (width/2)-20, height-10, true);
    
    //Añadir planos al Array 
    planos.add(arriba);
    planos.add(derecha);
    planos.add(tunel);
    planos.add(izquierda);
    planos.add(diagonal);
    
    planos.add(t);
    //planos.add(t1);
    //planos.add(t2);
    
    planos.add(inclinadoIzq); //diagIzq
    planos.add(inclinadoDer); //diagDer
    
    planos.add(baseIzq); 
    planos.add(baseDer);
    
    planos.add(palancaIzq);
    planos.add(palancaDer);
    

    

     
  }
    
  void update()
  {
    for (int i = planos.size()-1; i >= 0; i--) {
       Plano p = planos.get(i);
       for (int j=0;j<bolas.size();j++){
          Particle b = bolas.get(j);
          p.checkCollisions(b); 
          } 
       }
    }
  
  
  void display()
  {
      stroke(15,92,111);
      fill(95,217,247);
      strokeWeight(2);
      for (int i=0;i<planos.size();i++){
        Plano p = planos.get(i);
        
        if(p.plano_puntos)
        {
          stroke(135,7,37);
          strokeWeight(2);
        }
        
        line(p.pto1.x, p.pto1.y, p.pto2.x, p.pto2.y);
      }
  }
  
}
  
    


