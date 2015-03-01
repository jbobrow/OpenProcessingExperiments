
Planet[] planets = new Planet[200];

void setup(){
  size(800,800,P3D);
  smooth();
  
for (int i=0; i<planets.length; i++){
  planets[i] = new Planet(20+i*10,i+8);
}
}

void draw(){
  background(0);
  //sun
  pushMatrix();
  translate(width/2,height/2,0);
  stroke(255,0,0);
  fill(#E6EA1C);
  ellipse(0,0,100,100);
  //planets
  for (int i=0; i<planets.length; i++){
    planets[i].update();
    planets[i].display();
  }
  
  popMatrix();
}

class Planet{
  
  float theta;
  float diameter;
  float distance;
  float orbitspeed;
  
  Planet(float distance_, float diamiter_){
    distance = distance_;
    diameter = diamiter_;
    theta = 0;
    orbitspeed = random(0.01,0.03);
  }
  
  void update(){
    theta+=orbitspeed;
  }
  
  void display(){
    pushMatrix();
    rotate(theta);
    translate(distance,0);
    stroke(#A51CEA);
    fill(#2CBCA3);
    ellipse(0,0,diameter,diameter);
    
    popMatrix();
  }
}
  
