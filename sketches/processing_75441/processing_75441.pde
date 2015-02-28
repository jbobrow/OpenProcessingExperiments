
import processing.opengl.*;
import traer.physics.*;      //Statik
import peasy.*;

PeasyCam cam;


int PunkteAnzahl=50;
int StabAnzahl=PunkteAnzahl/2;
int DreieckeAnzahl=50;

PVector[] Punkte =new PVector[PunkteAnzahl] ;

ParticleSystem physics;
Particle[] particles;


float STRENGTH_Druck=5;
float STRENGTH_Zug=0.5;
float SPRING_DAMPING = 0;

void setup() {
 size(600, 400, P3D);

  cam = new PeasyCam(this, 350);
  physics = new ParticleSystem(2, 0.01);
  particles = new Particle[PunkteAnzahl];
  for (int i = 0; i < PunkteAnzahl; i++ ) {
    float x = random(100);
    float y = random(100);
    float z = random(100);
    // Punkte[i]= new PVector(x,y,z);
    particles[i] = physics.makeParticle(1, x, y, z);
  }

  for (int i = 0; i < StabAnzahl; i++ ) {
    PVector A=new PVector(particles[i].position().x(),particles[i].position().y(),particles[i].position().z());
    PVector B=new PVector(particles[i+StabAnzahl].position().x(),particles[i+StabAnzahl].position().y(),particles[i+StabAnzahl].position().z());
    float federLaenge = PVector.dist(A,B);
    physics.makeSpring(particles[i], particles[i+StabAnzahl], STRENGTH_Druck, SPRING_DAMPING,  federLaenge );
  }
  for (int i = 0; i < DreieckeAnzahl; i++ ) { 
    Spring Feder1 = physics.getSpring( i );
    Spring Feder2 = physics.getSpring( int (random(StabAnzahl)) );
    Spring Feder3 = physics.getSpring( int (random(StabAnzahl)) );

    Particle Punkt1 = Feder1.getOneEnd();
    Particle Punkt2 = Feder2.getTheOtherEnd();
    Particle Punkt3 = Feder3.getTheOtherEnd();

    PVector A=new PVector(Punkt1.position().x(),Punkt1.position().y(),Punkt1.position().z());
    PVector B=new PVector(Punkt2.position().x(),Punkt2.position().y(),Punkt2.position().z());
    PVector C=new PVector(Punkt3.position().x(),Punkt3.position().y(),Punkt3.position().z());
    float federLaengeAB = PVector.dist(A,B);
    float federLaengeBC = PVector.dist(B,C);
    float federLaengeCA = PVector.dist(C,A);
    physics.makeSpring(Punkt1,Punkt2, STRENGTH_Zug, SPRING_DAMPING,  federLaengeAB );
    physics.makeSpring(Punkt2,Punkt3, STRENGTH_Zug, SPRING_DAMPING,  federLaengeBC );
    physics.makeSpring(Punkt3,Punkt1, STRENGTH_Zug, SPRING_DAMPING,  federLaengeCA );
  }
  particles[1].makeFixed();
  particles[2].makeFixed();
  particles[3].makeFixed();
}

void draw() {
  background(255);
  physics.tick(0.1);
  for ( int i = 0; i < physics.numberOfSprings(); ++i )
  {
    Spring Feder = physics.getSpring( i );
    Particle AnfangsPunkt = Feder.getOneEnd();
    Particle EndPunkt = Feder.getTheOtherEnd();

    PVector A=new PVector(AnfangsPunkt.position().x(),AnfangsPunkt.position().y(),AnfangsPunkt.position().z());
    PVector B=new PVector(EndPunkt.position().x(),EndPunkt.position().y(),EndPunkt.position().z());
    if (i<StabAnzahl) {
      strokeWeight(5);
    }
    else
    {
      strokeWeight(1);
    } 
    line(A.x,A.y,A.z,B.x,B.y,B.z);
  }
}


