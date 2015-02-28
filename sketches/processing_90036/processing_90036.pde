
particle [] p = new particle [1000];

float px, py;

void setup() {
  for (int i = 0; i<p.length; i++) {
    p[i] = new particle(new PVector(random(0,600), random(00,600)), random(10.0));
  }
  
  for (int i = 0; i<p.length; i++) {
    p[i].attractor = p[int(random(p.length))];
  }
  size (600, 600);
  background(0);
}

void draw() {

strokeWeight(1);

  for (int i = 0; i<p.length; i++) {
    p[i].cmove();
  }
}


class particle {
  float m;
  PVector location;
  PVector velocity;
  
  particle attractor;
  
  particle (PVector loc, float m) {
    location = loc;
    this.m = m;
    velocity = new PVector(random(-1,1),random(-1,1));
  }
  
  void cmove() {
    
    
//
    if(attractor != null){
      float distance1 = dist(location.x, location.y, attractor.location.x, attractor.location.y);
       for(int i = 0; i < p.length; i++){
         if(p[i] != this){
           float aDist = dist(location.x, location.y, p[i].location.x, p[i].location.y);
            if(aDist < distance1){
              attractor = p[i];
            }
         }
       }
    
      
    PVector aLoc = attractor.location;
    
    float angle = atan2(location.y-aLoc.y, location.x-aLoc.x)+(PI/2);
    
    location.x += cos(angle)*(abs(velocity.x)+abs(velocity.y));
    location.y += sin(angle)*(abs(velocity.x)+abs(velocity.y));
    
    
    float distX = aLoc.x - location.x;
    float distY = aLoc.y - location.y;
    
    float distance = sqrt(sq(distX) + sq(distY));
    if (distance < 50) {
      distance = 50;
    }
    
    float grav = (m * attractor.m) / sq(distance) * 0.01;
    
    float xGrav = grav * (distX/distance);
    float yGrav = grav * (distY/distance);

    PVector accel = new PVector(xGrav / m, yGrav / m);
    
    float d = dist(location.x, location.y, width/2, height/2);
   

   
    float a =  (1.0 / d);
    
    velocity.x += (accel.x * d);
    velocity.y += (accel.y * d);
    
  //  velocity.x -= (300 + sin(frameCount*0.1) * 1000 - location.x) * 0.01;
  //  velocity.y -= (300 + cos(frameCount*0.1) * 1000 - location.y) * 0.01;
    
  //  velocity.x -= (00 - location.x) * 0.06;
   // velocity.y -= (00 - location.y) * 0.06;
    
    
     if(d > 200 || d < 50){
    //     velocity.x = -velocity.x;
    //     velocity.y = -velocity.y;
     }
    
    location.x += velocity.x;
    location.y += velocity.y;
    
    float l = 10 - frameCount*0.005;
    if(l <= 2){
      l = 2;  
    }
 // if(frameCount % 3 == 0){
  //  ellipse(location.x, location.y, 2,2);
 // }
 
  stroke(0,d, d, 3);
  fill(0,d, d, 3);
  if(frameCount > 5){
    strokeWeight(200*a);
    line(location.x, location.y, attractor.location.x, attractor.location.y);
  }
  ellipse(location.x, location.y, 200*a,200*a);
 
}
  }
}
  

 




