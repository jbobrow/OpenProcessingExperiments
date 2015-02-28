
int [] towers ={-1,7,4,8,6,3};
float[] measurements = {6.08,2.24,3.16};

float maxerror=0;
float leftX = -2;
float rightX = 12;
float bottomY = 0;
float topY = 10;

int screenSize = 500;
int numberOfParticles = 300000;

Particle[] robots = new Particle[numberOfParticles];
 
void setup() 
{
  size(screenSize, screenSize);
   background(204);
  smooth();  
  for(int i = 0;i<numberOfParticles;i++){
    robots[i] = new Particle(random(rightX-leftX)+leftX,random(topY-bottomY)+bottomY,towers);
    robots[i].locate();
    robots[i].findError(measurements);
    
    if (robots[i].error>=maxerror){
      maxerror = robots[i].error;
    }
  }  
  for(int i = 0;i<towers.length;i=i+2){
    fill(255,0,0);
    ellipse((towers[i]-leftX)/(rightX-leftX)*screenSize,screenSize +(-1*(towers[i+1]-bottomY)/(topY-bottomY))*screenSize,10,10);
  }
  
}

void draw() { 
    int fillcolor = 0;
  for(int i = 0;i<robots.length;i++){
    if (robots[i].error<0.01){
      fillcolor = 255;
      fill(0,fillcolor,0);
      ellipse((robots[i].x-leftX)/(rightX-leftX)*screenSize,screenSize + -1*(robots[i].y - bottomY)/(topY-bottomY)*screenSize,3,3);
    }
        
  }
   
} 
 
class Particle { 
  float x, y,error;
  float[] distance = {0,0,0};
  int[] locations = new int[6] ;
  
  
  Particle (float xpos, float ypos, int[] tower_locations) {  
    x = xpos; 
    y = ypos; 
    locations = tower_locations;
    float error = 0;
  }
  
  void locate() { 
   for(int i=0;i<locations.length;i+=2){
     
     distance[i/2] = sqrt(pow((locations[i] - x),2) + pow((locations[i+1] - y),2));
   }   
   }
   
   void findError(float[] measurements){
     for(int i = 0;i<locations.length/2;i++){
       error += pow((measurements[i] - distance[i]),2);
     }
     
   } 
    
  }
