
int numParticles = 10;
ArrayList particles;
float G_CONST = .2;

void setup(){
  size(800,400);
  smooth();
  background(0);
  
  particles = new ArrayList();
  
  for( int i=0; i<numParticles; i++){
    Particle a =  new Particle();
    a.setPosition(random(0,width), random(0,height));
    float s = random(5, 20);
    a.setMass( s*s );
    a.setRadius( s );
    a.addFriction( 1/s );
    particles.add(a);
  }
  
  // add gravity between all particles
  for(int i=0; i<particles.size(); i++){
    Particle a = (Particle) particles.get(i);
    for(int j=0; j<particles.size(); j++){
      Particle b = (Particle) particles.get(j);
      if(i!=j)
        a.addGravity(b);
    }
  }
  
  // add center planet, to be dragged
    Particle a =  new Particle();
    a.setPosition(width/2, height/2);
    float s = 50;
    a.setMass( s*10 );
    a.setRadius( s );
    a.addFriction( 1/s );
    a.setColor(color(0,51,51,25));
    a.setStatic(true);
    for(int i=0; i<particles.size(); i++){
      Particle b = (Particle) particles.get(i);
      b.addGravity(a);
    }
    particles.add(a);
}

void draw(){
   fill(0,0,0,5);
   rect(0,0,width,height);
    
   for(int i=0; i<particles.size(); i++){
     Particle a = (Particle) particles.get(i);
     a.update();
     a.display();
   }
}

float distance( vec2D a, vec2D b){
  float d;
  d = sqrt((a.x - b.x)*(a.x - b.x) + (a.y - b.y)*(a.y - b.y));
  
  return d;
}

void mousePressed(){
  dragParticles();
}

void mouseReleased(){
  for(int i=0; i<particles.size(); i++){
    Particle a = (Particle) particles.get(i);
    a.isDragged = false;
  }
}

void dragParticles(){
  for(int i=0; i<particles.size(); i++){
    Particle a = (Particle) particles.get(i);
    if( distance(a.position, new vec2D(mouseX,mouseY)) < a.rad *2 )
      a.isDragged = true;
  }
}

