
Sphere[] spheres;

void setup(){
 // frameRate(60);
  size(1280,720);
 // smooth();
  spheres = new Sphere[50];
  for (int i=0;i< spheres.length ; i++){
  spheres[i] = new Sphere();
  }
}



void draw(){
  background(255);
  PVector gravity = new PVector(0,0.2);
  PVector wind = new PVector(0.3,0);
  
  for(Sphere s:spheres){
 // gravity.mult(s.mass);
  
 s.applyForce(PVector.mult(gravity, s.mass));
  
  if(mousePressed){
  s.applyForce(wind);
  }
  

  s.update();
  s.collider();
  s.display();
  s.checkEdges();
  
  }  
}


class Sphere {
 PVector location ;
 PVector velocity ;
 PVector acceleration ;
 PVector friction;
 float mass ;
 color c ;
 float topSpeed ;
 float radius ;
 float f ; // Coeff of Friction


Sphere (){
 location = new PVector (random(width), random(height/2));
 velocity = new PVector (0,0);
 acceleration = new PVector (0,0);
 friction = velocity.get();
 mass = random (1.5 , 3);
 c = color (random(255),random(240,255));
 topSpeed = 3 ;
 radius = mass*30 ;
 f = 0.4;
} 
  
  void update(){
  velocity.add(acceleration);
  location.add(velocity); 
//  velocity.limit(topSpeed);   
  acceleration.mult(0);
  }
  
  void display(){
   fill(c);
   strokeWeight(mass);
      ellipse(location.x,location.y,radius,radius);
  }
  
  void applyForce(PVector force){
   PVector  f = PVector.div(force,mass);
   acceleration.add(f);
  }
  
  void collider(){
    friction = velocity.get();
    friction.normalize();
    friction.mult(-1);
    friction.mult(f);
    
   // float xBorder = width/4;
    float xBorder = mouseX;
   // float yBorder = 2*height/3;
    float yBorder = mouseY;
    float colliderLength = 500 ;
    
    fill(250,20,20);
    rect(xBorder , yBorder , 500 , 1000);

  if (  location.x > xBorder && location.x < xBorder+ colliderLength  ){
    
    if (location.y > yBorder - (radius/2) && location.y < yBorder+ 50 ){
           
      velocity.y *= -1;
      location.y = yBorder - (radius/2);

    }

    applyForce(friction);
    
  }
  
  }
  
  
    void checkEdges() {

    if (location.x > width-(radius/2)) {
      location.x = width-(radius/2);
      velocity.x *= -1;
    } else if (location.x < 0+(radius/2)) {
      velocity.x *= -1;
      location.x = 0+(radius/2);
    }
    if (location.y > height -(radius/2)) {
      velocity.y *= -1;
      location.y = height -(radius/2);
    }
  }
  
  
  
}
