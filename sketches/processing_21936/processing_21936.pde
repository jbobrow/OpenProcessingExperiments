
import traer.physics.*;

ParticleSystem physics;

final int N = 16;

float sqrt2 = 1.414213562;

Particle[] ps = new Particle[N*2];
ArrayList sps = new ArrayList();
Particle target = null;
Particle p;
Particle anchor1, anchor2,anchor3,anchor4;
Spring s;

void setup()
{
  size( 500, 400 );
  smooth();
  fill( 0 );
  ellipseMode( CENTER );
  
  float strn = 1;
  float damp = 0.01;
  
  int L = 20;
  
  int cx = width/8;
  int cy = height/2;
        
  physics = new ParticleSystem( 0 , 0.05 );
       
  for(int i=0; i<N; i++){
    ps[i] = physics.makeParticle( 1.0, cx+(i+1)*L, cy, 0 );
    ps[i+N] = physics.makeParticle( 1.0, cx+(i+1)*L, cy+L, 0 );
    
    sps.add(physics.makeSpring(ps[i], ps[i+N], 0.1, 0.1, L));
    
    if(i>0){
      sps.add(physics.makeSpring(ps[i], ps[i-1], strn, damp, L));
      sps.add(physics.makeSpring(ps[i+N], ps[i-1+N], strn, damp, L));
      sps.add(physics.makeSpring(ps[i], ps[i-1+N], strn, damp, L*sqrt2));
      sps.add(physics.makeSpring(ps[i-1], ps[i+N], strn, damp, L*sqrt2));
    }
  }
  
  anchor1 = physics.makeParticle( 1.0, cx, cy, 0 );
  anchor1.makeFixed(); 
  sps.add(physics.makeSpring( ps[0], anchor1, strn, damp, L ));
  
  anchor2 = physics.makeParticle( 1.0, cx, cy+L, 0 );
  anchor2.makeFixed(); 
  sps.add(physics.makeSpring( ps[N], anchor2, strn, damp, L ));
  
  sps.add(physics.makeSpring(anchor1, anchor2, strn, damp, L));
  sps.add(physics.makeSpring(ps[0], anchor2, strn, damp, L*sqrt2));
  sps.add(physics.makeSpring(ps[N], anchor1, strn, damp, L*sqrt2));
  
  anchor3 = physics.makeParticle( 1.0, cx+(N+2)*L, cy, 0 );
  anchor4= physics.makeParticle( 1.0, cx+(N+2)*L, cy+L, 0 );
  anchor3.makeFixed();
  anchor4.makeFixed();
  
  sps.add(physics.makeSpring( ps[N-1], anchor3, strn, damp, L ));
  sps.add(physics.makeSpring( ps[N*2-1], anchor4, strn, damp, L ));
  sps.add(physics.makeSpring(anchor3, anchor4, strn, damp, L));
  sps.add(physics.makeSpring(ps[N-1], anchor4, strn, damp, L*sqrt2));
  sps.add(physics.makeSpring(ps[N*2-1], anchor3, strn, damp, L*sqrt2));
}

void mousePressed()
{ 
  for(int i=0;i<2*N;i++){
    float x = ps[i].position().x();
    float y =  ps[i].position().y();
    if(mouseX>x-10 && mouseX < x+10 &&
        mouseY>y-10 && mouseY < y+10){
      target = ps[i];
    break;  
    }
  }
  
  if(target==null) return;
  
   target.makeFixed(); 
   target.position().set( mouseX, mouseY, 0 );
}

void mouseDragged()
{
  if(target==null) return;
  target.position().set( mouseX, mouseY, 0 );
}

void mouseReleased()
{
  if(target==null) return;
   target.makeFree(); 
}

void draw()
{
  physics.tick();
    
  background( 255 );
  
  ellipse( anchor1.position().x(), anchor1.position().y(), 5, 5 );
  ellipse( anchor2.position().x(), anchor2.position().y(), 5, 5 );
  ellipse( anchor3.position().x(), anchor1.position().y(), 5, 5 );
  ellipse( anchor4.position().x(), anchor2.position().y(), 5, 5 );
  
  for(int i=0; i<2*N; i++){
    float x = ps[i].position().x();
    float y = ps[i].position().y();
    
    if(ps[i]==target) fill(255,0,0);
    else fill(0);
    
    ellipse( x, y, 10, 10 );
  }
  
  for(int i=0; i<sps.size(); i++){
      Spring sp = (Spring)sps.get(i);
      Particle p1 = sp.getOneEnd();
      Particle p2 = sp.getTheOtherEnd();
      
      float x1 = p1.position().x();
      float y1 = p1.position().y();
      float x2 = p2.position().x();
      float y2 = p2.position().y();
      
      line( x1, y1, x2, y2 );
  }
}




