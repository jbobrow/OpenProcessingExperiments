
import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// A reference to our box2d world
PBox2D box2d;

PFont f,f2;

//puntuació
int puntsIA=0;
int puntsJugador=0;

// declarem els discos
Box box;
Box box2;


Vec2 pos;

// An ArrayList of particles that will fall on the surface
ArrayList particles;
ArrayList boundaries;

// The Spring that will attach to the box from the mouse
Spring spring;
Spring spring2;

void setup() {
  size(400,600);
  smooth();

  
  f = createFont("Arial",50,true); 
  f2 = createFont("Arial",10,true); 
  // Initialize box2d physics and create the world
  box2d = new PBox2D(this);
  box2d.createWorld();
  box2d.setGravity(0,0);

  // creem els discos
  box = new Box(width/2,height*7/8);
  box2 = new Box(width/2,height*1/8);
  
  // creem la IA
  spring = new Spring();
  spring.bind(width/2,height*7/8,box,200,8,1); //x defecte 100,5,0.9
  //creem el Jugador 1
  spring2 = new Spring();
  spring2.bind(width/2,height*1/8,box2,10000,5,0.9);

  // creem la bola central
  particles = new ArrayList();

  // inicialitzem el mapa
  boundaries = new ArrayList();
  boundaries.add(new Boundary(0,height-5,width*3/4,10)); //barrera superior
  boundaries.add(new Boundary(width,height-5,width*3/4,10));
  
  boundaries.add(new Boundary(width/2,height+50,width*1/4,10)); // una xicoteta barrera darrere de la porteria
  /*boundaries.add(new Boundary(width/2-55,height+30,10,50)); 
  boundaries.add(new Boundary(width/2+55,height+30,10,50)); */
  
  boundaries.add(new Boundary(0,5,width*3/4,10));//barrera inferior
  boundaries.add(new Boundary(width,5,width*3/4,10));
  
  boundaries.add(new Boundary(width/2,-50,width*1/4,10));// una xicoteta barrera darrere de la porteria
  /*boundaries.add(new Boundary(width/2-55,-30,10,50)); 
  boundaries.add(new Boundary(width/2+55,-30,10,50)); */
  
  boundaries.add(new Boundary(width-5,height/2,10,height)); //barrera esq
  boundaries.add(new Boundary(5,height/2,10,height)); //barrera der
  
  //inicialitzem el disco central
  particles.add(new Particle(width/2,height/4,10));
}

void draw() {
  background(255);
  line(0,height/2,width,height/2);

  textFont(f);  
  fill(0,50); 
  textAlign(CENTER);
  text(puntsJugador,width/2,height/4); 
  text(puntsIA,width/2,height*3/4);

  

  // We must always step through time!
  box2d.step();


  // Dibuixa el mapa
  for (int i = 0; i < boundaries.size(); i++) {
    Boundary wall = (Boundary) boundaries.get(i);
    wall.display();
  }  
  
  box.body.setAngularVelocity(0);

  // Look at all particles

  Particle p = (Particle) particles.get(0);
  p.display();
  pos = box2d.getScreenPos(p.body);
  
  // Particles that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  if (p.goalIA()) {
    particles.remove(0);
    puntsIA++;
    //println("Jugador "+ puntsJugador+" - IA "+puntsIA);      
    particles.add(new Particle(width/2,height/4,10));
  }
  if (p.goalJugador()) {
    particles.remove(0);
    puntsJugador++;
    //println("Jugador "+ puntsJugador+" - IA "+puntsIA);
    particles.add(new Particle(width/2,height*3/4,10));
  }    
  
  //moviment de la IA
  if (pos.y<height/2) {
    spring.update(constrain(pos.x,50,width-50),max(pos.y,height-30));
  } else {
    spring.update(constrain(pos.x,50,width-50),constrain(max(pos.y,height/2),height/2,height));
  }
  
  //moviment del jugador
  spring2.update(mouseX,min(mouseY,height/2));
    
  // Pintem els discos
  box.display();
  box2.display();

  textFont(f2);
  fill(255); 
  textAlign(LEFT);
  text("Reset UP - Restart DOWN",10,10);
}
//key code
void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      particles.remove(0);
      //println("Jugador "+ puntsJugador+" - IA "+puntsIA);
      particles.add(new Particle(width/2,height/2,10));
    } 
    if (keyCode == DOWN){
      particles.remove(0);
      puntsJugador=0;
      puntsIA=0;
      particles.add(new Particle(width/2,height/4,10));
    }     
  }  
}










