
import traer.physics.*;

Particle a, b, c, d, a1, b1, c1, d1,e1;
ParticleSystem system, system1;

float sgn = 1;

void setup(){
  
  size(700,700);  
  background(80);
  smooth();  
  ellipseMode( CENTER );
  
  system = new ParticleSystem();
  system1 = new ParticleSystem();
  
  a = system.makeParticle(8.0, width/3,height/2,0);
  b = system.makeParticle(8.0, 2*width/3,height/2,0);  
  c = system.makeParticle(8.0, width/2,height/3,0);
  d = system.makeParticle(8.0, width/2,2*height/3,0);
  
  a1 = system1.makeParticle(4.0, width/3,height/2,0);
  b1 = system1.makeParticle(4.0, 2*width/3,height/2,0);  
  c1 = system1.makeParticle(4.0, width/2,height/3,0);
  e1 = system1.makeParticle(4.0, width/2, 2*height/3,0);
  
  d1 = system1.makeParticle(1500.0, width/2,height/2,0);
  
  system.makeAttraction( a, b, 500, 50 );
//  system.makeAttraction( a, c, 500, 100 );
//  system.makeAttraction( a, d, 500, 100 );
//  system.makeAttraction( b, c, 500, 100 );
//  system.makeAttraction( b, d, 500, 100 );
  system.makeAttraction( c, d, 500, 50 );
  
  system1.makeAttraction( a1, d1, 5, 100 );
  system1.makeAttraction( b1, d1, 5, 100 );
  system1.makeAttraction( c1, d1, 5, 100 );
  system1.makeAttraction( e1, d1, 5, 100 );
  
//  system1.makeAttraction( a1, b1, 15, 100 );  
//  system1.makeAttraction( b1, c1, 15, 100 );
//  system1.makeAttraction( c1, e1, 15, 100 );
//  system1.makeAttraction( e1, a1, 15, 100 );

  a1.velocity().set(4,4,0);
  b1.velocity().set(-4,-4,0);
  c1.velocity().set(-4,4,0);
  e1.velocity().set(4,-4,0);

}


void draw(){
  
  int size = width;
  
  fill(20,3);
  rect(0,0,width,height);
  
  noFill(); 
  system.tick();
  system1.tick();
  
  stroke(255);
  ellipse( a.position().x() ,a.position().y(),size,size);  
  ellipse( a1.position().x() ,a1.position().y(),size/8,size/8);  
  
  stroke(255,0,0);
  ellipse( b.position().x() ,b.position().y(),size,size);  
  ellipse( b1.position().x() ,b1.position().y(),size/8,size/8);  
  
  stroke(0,255,0);
  ellipse( c.position().x() ,c.position().y(),size,size);  
  ellipse( c1.position().x() ,c1.position().y(),size/8,size/8);  
  
  stroke(0,0,255);
  ellipse( d.position().x() ,d.position().y(),size,size);  
  ellipse( e1.position().x() ,e1.position().y(),size/8,size/8);    
} 

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

