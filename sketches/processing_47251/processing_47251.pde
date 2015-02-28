
float posX;
float posY;
float posX1;
float posY1;
float s;
float z;




void setup(){
 size(800,600);
 background(0);
smooth(); 
frameRate(5);
  
  
  
}

void draw(){
  
  posX = random(width);
  posY = random(height);
  posX1 = random(width);
  posY1 = random(height);
  s = random (50);
  z = random (50);
 
  
 fill(random(127),random(127), random(127));
  ellipse (posX, posY, s,s);
 
  strokeWeight(random(10));
  stroke(random(127),random(127),random(127));
  line (posX, posY, posX1, posY1);
  
  fill(random(127),random(127), random(127));
  ellipse (posX1, posY1, z,z);
  
  
  
  
}

