
class Grass {
  
  float x;
  float y;                  
  float speed = 1;
  float grassSize = 1;
  
  
  Grass() {                   
    
  };
  
  void walk() {
    
    x = x+random(-speed,speed);
    y = y+random(-speed,speed);
    
  
  fill(75,255,2,10);
  noStroke();
  ellipse(x,y,grassSize,grassSize);
  };
  
};

void mousePressed () {

save("grass.png");

}

