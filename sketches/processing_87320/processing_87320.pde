
Mover mover;
 
int maxCount = 10000000;
int curCount = 0;
Mover[] movers = new Mover[maxCount];

 
float maxDist = 0;

float birthRate = 3;

void setup(){
   
  colorMode(RGB, 255);
  size(1000,500);
  smooth();
   frameRate(30);
  maxDist = sqrt(width*width+height*height);
   
  //BIRTH PARTICLES 
  /*
  for( int i=0; i < maxCount; i++ )
  {
    float mass = map(pow(noise(i*3),7), 0, 1, 1, 2);
    movers[i] = new Mover(i, mass);
  }
   */
}
 
void draw()
{
   background(10);
  
  if( curCount < maxCount || maxCount == -1 )
  {
    
    for( int i=0; i < birthRate; i++ )
    {
     
      movers[curCount] = new Mover(curCount);
      
      curCount++;
    
    
    }
    

  }
  
    for( int i=0; i < curCount; i++ )
    {
     
      movers[i].update();
      movers[i].checkEdges();
      movers[i].display(); 
    }
  /*
  for( int i=0; i < birthRate; i++ )
  {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();     
  }
   */
   
}
 
 
 
class Mover{
   
  int ID;
   
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
   
  float mass;
   
  Mover(int pID)
  {
      ID = pID;
     
      location = new PVector(random(0,width), random(-10,-10));     
      velocity = new PVector( 0, 0 );
      acceleration = new PVector( 0.0, 0.0);
       
      topspeed = 9;
       
       
      mass = map( pow(random(1),3), 0, 1, .1, 1);

   
  }
   
  void update()
  {
    randomSeed(ID*200);
    //float y = map( pow(random(1),1), 0, 1, .1, .8);
   float y = mass;
    
    
    float amplitude = map( pow(random(1),2), 0, 1, .05, .1 ) * 0;
    float period = map( pow(random(1),3), 0, 1, .0001, .05 );
    
    PVector nse = new PVector(amplitude * noise(location.x*period), amplitude*noise(location.y*period) );
   
    acceleration =  new PVector(0, y );
    acceleration.add(nse);
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
     
     
  }
   
  void display()
  {
     
    float size = map(pow(noise(ID*3),3), 0, 1, 2, 81);
    size = map( mass, .1, 1, 5, 30);
    
    float locNorm = map(location.x, 0, width, 0, 1);
    
    randomSeed( ID * 200);
     
    char letter = String.fromCharCode((int)map( pow( random(1),1 ), 0,1, 65, 90 ));
    
    float RGB = map( mass, .1, 1, 255, 50);
    fill( RGB, RGB, RGB, RGB );
    
    pushMatrix();
    
    textSize( size );
    text(letter, location.x, location.y);
    rotate( random(radians(360)) );
     
     popMatrix();
  }
   
  void checkEdges()
  {/*
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
      }*/
  }
   
 
   
}



