
import traer.physics.*;

Particle mouse;
pp[] others;
ParticleSystem physics;

void setup(){
background(0);
size(250,250);

  physics = new ParticleSystem( 0, 0.1 );
  mouse = physics.makeParticle();
  mouse.makeFixed();
float x,y;
  others = new pp[500];
  for ( int i = 0; i < others.length; i++ )
  {
    x=random( 0, width );
    y=random( 0, height );
    physics.makeParticle( 1.0,x , y, 0 );
    others[i] = new pp(120,i,physics);
    physics.makeAttraction( mouse, others[i].p, 10, 50 ); 
  }


}

class pp{
  color c;
  int index,neighbors;
  Particle p;
  ParticleSystem PS;
  public pp(color col, int i, ParticleSystem phys){
    PS=phys;
  p=PS.getParticle(i);
  c=col;
  }
  
  public void update(){
  neighbors=howMany();
  p.setMass(map(neighbors,1,500,0.5,2));
    
    //set color
    if(neighbors<=5){c=color(255,245,245,200);}
    else if(5<neighbors && neighbors<=10){c=color(255,222,222,190);}
    else if(10<neighbors && neighbors<=15){c=color(255,180,180,180);}
    else if(15<neighbors && neighbors<=20){c=color(255,157,157,160);}
    else if(20<neighbors && neighbors<=25){c=color(255,137,137,130);}
    else if(25<neighbors && neighbors<=30){c=color(255,107,107,120);}
    else if(30<neighbors && neighbors<=35){c=color(255,77,77,100);}
    else if(35<neighbors && neighbors<=40){c=color(255,57,57,80);}
    else if(40<neighbors && neighbors<=45){c=color(255,17,17,60);}
    else{c=color(255,0,0,10);}
    
    
    
    
    fill(c);
    noStroke();
    ellipse(p.position().x(),p.position().y(),constrain(neighbors,1,150),constrain(neighbors,1,150));
  }
  
  private int howMany(){
  Particle current;
  int count=0;
for(int i=0;i<PS.numberOfParticles();i++){
current=PS.getParticle(i);
if(dist(p.position().x(),p.position().y(),current.position().x(),current.position().y())<=20){
count++;

}
}

return count;

}

}

void draw(){
  background(255);
  int radius=20;
  
  
mouse.moveTo( mouseX, mouseY, 0 );
noFill();
stroke(190);
ellipse(mouseX,mouseY,radius,radius);
  physics.tick();


 for ( int i = 0; i < others.length; i++ )
  {
    if(dist(mouseX,mouseY,others[i].p.position().x(),others[i].p.position().y())<=radius){
    physics.getAttraction(i).setStrength(5000);
    }
    else{
    physics.getAttraction(i).setStrength(500);
    }
     others[i].update();
  }

}

