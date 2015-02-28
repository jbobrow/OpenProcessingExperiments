
//Chun Yi Wu

//Due to Read the "Getting Started with Processing" / manage lots of objects 
//My concept is using array of objects to control random position . 
//Using all the position to grow up grass .

GrowupGrass[] grass = new GrowupGrass[100];

void setup() {
  frameRate(2);
  size (1100, 250);
  background(255);
  smooth();
  for (int i = 1 ; i < grass.length; i ++) {
    float x = random(width);
    float y = random(height);
    float c1 =random(width);
    float c2 = random(height);
    
    grass[i]= new GrowupGrass (x, y, c1, c2);
   
  }
}
void draw() {
  
  for (int i = 1 ; i < grass.length; i ++) { 
    grass[i].move();
    grass[i].shadow();
    grass[i].display();
    
  }
}

class GrowupGrass {

  float x ;
  float y;
  float c1;
  float c2;
  float speed = 5;
  float speed2 = 50;
  GrowupGrass(float Fx, float Fy, float endpoint1, float endpoint2) {
    x = Fx;
    y = Fy;  
    c1 = endpoint1 ; 
    c2 = endpoint2 ;
  }
  // all of grass's position 
  void move() {
    x +=random(-speed, speed);
    y +=random(-speed, speed);
  }
  // Shadow on the ground
  void shadow() {
    stroke ( 0, random(200, 250), 0, 5);
    line(x, y, c1, c2);
  }
  // the shape of grass
  void display() {
    float n=6 ;
    for(int s =1 ;s < 60; s +=25 ){
    stroke (0, random(100, 200), 10,5);
    noFill();
    beginShape();
    curveVertex(c1, c2); 
    curveVertex(c1, c2);  
    curveVertex(c1+random(4-n, 4+n), c2-12-s); 
    curveVertex(c1+random(10-n, 10+n), c2-37-s);
    curveVertex(c1+random(8-n, 8+n), c2-50-s);
    curveVertex(c1+random(8-n, 8+n), c2-50-s);
    endShape();
    }
  }
  
  
}





