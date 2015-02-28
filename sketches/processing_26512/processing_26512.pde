
//libreria de fisica
import traer.physics.*;
//particulas 
ArrayList hi, treb, low;

// Para los controladores
//import controlP5.*;

//ControlP5  controlP5;
//ControlWindow controlWindow;



int m = 15; //numero de agentes "hi"
int n = 7; //numero de agentes "treb"
int o = 3; //numero de agentes "low"
int rhi = 10;  //radio de particulas hi
int rtreb = 20;  //radio de particulas treb
int rlow = 30;  //radio de particulas low
int mhi = 10;  //masas de las particulas
int mtreb = 20;
int mlow = 30;


//sistema fisico
ParticleSystem espacio;//nuestro sistema fisico se llama espacio

void setup()
{
  size( 640, 640 );
  frameRate( 24 );
  smooth();
  ellipseMode( CENTER );
  noStroke();
  noCursor();
  hi= new ArrayList();//agente mas pequenio y con comportamiento mas social
  treb= new ArrayList();//agente mediano y comportamiento medio social medio arisco
  low= new ArrayList();//agente mas grande y comportamiento mas independiente
    
  espacio = new ParticleSystem();

 
  //creamos "n" particulas del tipo hi
  for(int i=0; i < m; i++){
     Particle p =  espacio.makeParticle( 1.0, random( 0, width ), random( 0, height ), 0 );
     p.velocity().set( random(-0.1,0.1),random(-0.1,0.1),0);
     p.setMass(mhi);
     hi.add(p);   
  }
  
//creamos "o" particulas del tipo treb
    for(int i=0; i < n; i++){
     Particle p =  espacio.makeParticle( 1.0, random( 0, width ), random( 0, height ), 0 );
     p.velocity().set( random(-0.15,0.15),random(-0.15,0.15),0);
     p.setMass(mtreb);
     treb.add(p);   
  }

//creamos "p" particulas de tipo low
    for(int i=0; i < o; i++){
     Particle p =  espacio.makeParticle( 1.0, random( 0, width ), random( 0, height ), 0 );
     p.velocity().set( random(3, 4), random(3, 4), 0);
     p.setMass(mlow);
     low.add(p);   
  }

}

void draw()
{
 

  //esto sirve para calcular sus posiciones
  espacio.tick();
 //float n = noise(xoff)* 20;
  
  // With each cycle, increment xoff
 // xoff += xincrement;

  background( 255 );
  //dibujamos las particulas
  
//particulas hi
  noStroke();
  fill(0);
atracciones(hi, 0.1, 20);
atractores(hi, treb, 0.05, 30);
atractores(hi, low, 0.8, 50);
  for(int i=0; i < hi.size(); i++){
  Particle p= (Particle) hi.get(i);  
   handleBoundaryCollisions(p);
   ellipse( p.position().x(), p.position().y(),  rhi, rhi );
  }


//particulas treb
  noStroke();
  fill(100);
atracciones(treb, 0.3, 50);
atractores(treb, hi, -0.1, 20);
atractores(treb, low, 0.5, 30);
  for(int i=0; i < treb.size(); i++){
  Particle p= (Particle) treb.get(i);  
    handleBoundaryCollisions(p);
    
  ellipse( p.position().x(), p.position().y(), rtreb , rtreb );
  }


//particulas low
  noStroke();
  fill(150);
atracciones(low, -0.7, 5);
atractores(low, hi, -0.1, 30);
atractores(low, treb, -2, 40);
  for(int i=0; i < low.size(); i++){
  Particle p= (Particle) low.get(i);  
  handleBoundaryCollisions(p);
    
  ellipse( p.position().x(), p.position().y(), rlow , rlow );
  }
}

//Nuestra estrategia:
//Checar si la posicion es menor que el o o mayor que el ancho
//igual para el y
void handleBoundaryCollisions( Particle p )
{
  if ( p.position().x() < 0 + p.mass()/2 || p.position().x() > width - p.mass()/2 )
    p.velocity().set( -0.9 * p.velocity().x(), p.velocity().y(), 0 );
  if ( p.position().y() < 0 + p.mass()/2 || p.position().y() > height - p.mass()/2 )
    p.velocity().set( p.velocity().x(), -0.9 * p.velocity().y(), 0 );
  p.position().set( constrain( p.position().x(), 0 + p.mass()/2, width - p.mass()/2  ), constrain( p.position().y(), 0 + p.mass()/2, height - p.mass()/2 ), 0 );
}
//atracciones entre agentes del mismo gruo
void atracciones(ArrayList a, /*float mass,*/ float atrac, float minDist)
{
  for( int i=0; i< a.size(); i++){
    for(int j= i + 1; j< a.size(); j++){
        Particle p= (Particle) a.get(i);  
        Particle g= (Particle) a.get(j); 
        espacio.makeAttraction(p, g, atrac, minDist);    
    }
  }
}
//atracciones entre los grupos de particulas
void atractores(ArrayList a, ArrayList b, float atrac, float minDist)
{
  for( int i=0; i< a.size(); i++){
    for(int j= i + 1; j< b.size(); j++){
        Particle p= (Particle) a.get(i);  
        Particle g= (Particle) b.get(j); 
        espacio.makeAttraction(p, g, atrac, minDist);    
    }
  }
}


