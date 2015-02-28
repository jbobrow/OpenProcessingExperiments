
//Kristina Tatyanenko, physics project
//combine sketches MotionLibAngularMotion and _5_3_physics_02

import seltar.motion.*;
import traer.physics.*;
ParticleSystem mundo;// Mundo de las particulas

Particle p[];

Motion m;
float Angle = random(TWO_PI), Strokeweight = 1;

void setup()
{
  size(400,400);  
  m = new Motion(width/2,height/2);
  smooth();
  background(0);  
    mundo = new ParticleSystem(0.1, 0.1);// gravedad y drag
  p = new Particle[200]; //array de particulas, como máximo 200
  for (int i = 0; i < 200; i++) {
    //Particle makeParticle( float mass, float x, float y, float z )
    p[i] = mundo.makeParticle(random(0.1, 5), random(400), random(-500, 100), 0);
  }
}

void draw()
{
  if(mousePressed) background(0);  
  Angle += radians(random(-5,5));
  Strokeweight += random(-0.5,0.5);
  m.moveDir(Angle,random(1,6));
  m.wrap(0,0,width,height);
  m.move();
  stroke(random(255));
  smooth();
  strokeWeight(abs(Strokeweight));
  
   for (int i = 0; i < 200; i++) {
    // dibujamos una elipse en vez de una partícula
    ellipse(p[i].position().x(), p[i].position().y(), 5, 5);
    if (p[i].position().y() > height) { // si llegamos al final de la pantalla
      p[i].position().set( random(400), random(-500, 0), 0);
      
  
    }
  }
  // calcula todas as forcas, velocidades e posicoes novas
  mundo.tick();
}

