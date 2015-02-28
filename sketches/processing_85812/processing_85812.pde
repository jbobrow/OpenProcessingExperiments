
Mover mover;

int ptCount = 500;
Mover[] movers = new Mover[ptCount];

float maxDist = 0;

void setup(){
  
  colorMode(HSB, 100);
  size(800,800);
  smooth();
  noStroke();
  
  maxDist = sqrt(width*width+height*height);
  
  for( int i=0; i < ptCount; i++ )
  {
    float mass = map(pow(noise(i*3),7), 0, 1, 1, 2);
    movers[i] = new Mover(i, mass);
  }
  
}

void draw()
{
   background(0, 0, 10);
   
  for( int i=0; i < ptCount; i++ )
  {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
    
    /*
    if( i > 0 ){
      stroke(100);
      strokeWeight(.05);
    line(movers[i].location.x, movers[i].location.y, movers[i-1].location.x, movers[i-1].location.y);
    noStroke();
    }*/
  }
  
  
}



class Mover{
  
  int ID;
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  float mass;
  
  Mover(int pID, float mass)
  {
      ID = pID;
    
      location = new PVector(random(width-94,width), random(height-94,height));      
      velocity = new PVector( 0, 0 );
      acceleration = new PVector( 0.0, 0.0);
      
      topspeed = 4;
      
      
      this.mass = mass;
      
      if( this.mass == 0 )
        this.mass = 1;
  }
  
  void update()
  {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult( map(noise(ID), 0, 1, .05, .08 ) );
    acceleration = PVector.div(dir,mass);
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
    
    //println(acceleration);
    
  }
  
  void display()
  {
    
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    
    
    //stroke(map(ID,0, ptCount, 50, 100));
    //strokeWeight(.1);

    float size = map(pow(noise(ID*3),3), 0, 1, 2, 81);
    
    //float hue = map( noise(ID), 0, 1, 0, 50 );
    float locNorm = map(location.x, 0, width, 0, 1);
    float hue = map(pow(locNorm, 2 ), 0, 1, (int)(ID/90), map(ID, 0, ptCount, 50, 100) );
   
    float dirNorm = map(dir.mag(),0,maxDist,0,1);
    
    float saturation = map( pow(dirNorm,.09), 0, 1, 500, 50);
    float brightness = map( pow(dirNorm,.09), 0, 1, 500, 5 );
    
    fill(hue, saturation, brightness);
    ellipse(location.x, location.y, size, size);
    
    
  }
  
  void checkEdges()
  {
      if (location.x > width) {
        location.x = 0;
      } 
      else if (location.x < 0) {
        location.x = width;
      }
      if (location.y > height) {
        location.y = 0;
      } 
      else if (location.y < 0) {
        location.y = height;
      }
  }
  

  
}


