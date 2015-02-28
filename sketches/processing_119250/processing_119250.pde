
float phase; //phase of Earth's orbit
float scale; //display size of Earth (radius)

Planet earth;

Planet mercury;
Planet venus;
Planet mars;
Planet jupiter;
Planet saturn;
Planet uranus;
Planet neptune;

void setup() {
  size(720, 720);
  frameRate(40);
  background(0);
  
  ellipseMode(RADIUS);
  
  earth = new Planet(1,1,1); //(size,orbital radius,period)
  
  mercury = new Planet(0.38,0.39,0.24);
  venus = new Planet(0.95,0.72,0.62);
  mars = new Planet(0.53,1.52,1.9);
  jupiter = new Planet(11.2,5.2,11.9); 
  saturn = new Planet(9.1,9.5,29); 
  uranus = new Planet(4,20,84);
  neptune = new Planet(4,30,165);
}

void draw(){
 background(255);
 noStroke();
 phase = frameCount*PI/400;//sets speed of orbits relative to framerate
 scale = 1;//displayed size of Earth's radius.
  
 fill(255,200,0);
 ellipse(width/2,height/2,109*scale,109*scale);
  
 fill(1);
 mercury.display();
 venus.display();
 jupiter.display();
 earth.display();
 saturn.display();
 mars.display();
 uranus.display();
 neptune.display();
}

class Planet {
  
  float size;//size compared to Earth
  float r;//orbital radius in units of AU
  float period; //in Earth years
  
  Planet(float tempSize, float tempR, float tempPeriod){
    
    size = tempSize;
    r = tempR;
    period = tempPeriod;
    
  }
    
  void display() {
    fill(1);
    ellipse((width + r*scale*23*sin((2*PI*phase)/period))/2,(height + r*scale*23*cos((2*PI*phase)/period))/2,size*scale,size*scale);
//planetary sizes are 1000 times bigger scale than planetary distances, for visibility.
  }
}


