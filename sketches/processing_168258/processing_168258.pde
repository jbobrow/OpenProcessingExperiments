

int N = 30;
Mover[] movers = new Mover[N];
  
int M_MAX = 70;
int  M_MIN = 10;

void setup(){
  size(700,500);    
  
    for(int i = 0; i < N; i++){
    movers[i] = new Mover();
  }
   fill(random(0,255),random(0,255),random(0,255));
   
}
  

void draw(){
  background(255);    
  
   
  for(int i = 0; i < movers.length; i++){
    movers[i].update();     
    movers[i].checkEdges(); 
    movers[i].display();    
  }
}

class Mover{ 
  PVector location;   
  PVector velocity;     
  PVector acceleration; 
  float   topspeed;     
  float   mass;         
  float   hue;          
  
  Mover(){ 
    location = new PVector(random(width), random(height)); 
    velocity = new PVector(0,0);               
    mass = random(M_MIN,M_MAX);                       
    hue = (int)random(255);                      
    topspeed = 10;    }
  void update(){ 

    float n = 0.8 - mass/100;
    PVector mouse = new PVector(mouseX, mouseY); 
    PVector dir = PVector.sub(mouse,location);   
    dir.normalize();    
    dir.mult(n);       
    acceleration = dir;  
    velocity.add(acceleration); 
    velocity.limit(topspeed);   
    location.add(velocity);     
  }
   
  void display(){ 
      stroke(0);
    fill(hue,255,255);
    ellipse(location.x, location.y, mass, mass);
  }
   
  void checkEdges(){ 
    if(location.x > width){     
      location.x = 0;
    } else if(location.x < 0){  
      location.x = width;
    }
     
    if(location.y > height){    
      location.y = 0;
    } else if(location.y < 0){  
      location.y = height;
    }
  }
}
