
import traer.physics.*; 
ParticleSystem physics; 
Particle mouse; 
Particle[] p; 
Spring[] s; 
 
void setup(){ 
  size(400,400); 
  smooth(); 
   
  physics=new ParticleSystem(1.0,0.05); 
  p=new Particle[12]; 
  s=new Spring[12]; 
   
  for(int i=0;i<p.length;i++){ 
    p[i]=physics.makeParticle(1.0,20,20,0); 
    if(i>0){ 
      s[i]=physics.makeSpring(p[i],p[i-1],0.15,0,40); 
    } 
  } 
   
  p[0].makeFixed(); 
  p[11].makeFixed(); 
} 
 
void draw(){ 
  background(255); 
  physics.tick(); 
  
  p[0].position().set(20,20,0); 
  fill(128); 
     
    beginShape(); 
    noFill(); 
    curveVertex(p[0].position().x(),p[0].position().y()); 
    curveVertex(p[0].position().x(),p[0].position().y()); 
    curveVertex(p[1].position().x(),p[1].position().y()); 
    curveVertex(p[2].position().x(),p[2].position().y()); 
    curveVertex(p[3].position().x(),p[3].position().y()); 
    curveVertex(p[4].position().x(),p[4].position().y()); 
    curveVertex(p[5].position().x(),p[5].position().y()); 
    curveVertex(p[6].position().x(),p[6].position().y()); 
    curveVertex(p[7].position().x(),p[7].position().y()); 
    curveVertex(p[8].position().x(),p[8].position().y()); 
    curveVertex(p[9].position().x(),p[9].position().y()); 
    curveVertex(p[10].position().x(),p[10].position().y()); 
    curveVertex(p[11].position().x(),p[11].position().y()); 
    curveVertex(p[11].position().x(),p[11].position().y()); 
    endShape(); 
     
if(mousePressed){ 
  p[11].position().set(mouseX,mouseY,0); 
  } 
   
} 
 
 


