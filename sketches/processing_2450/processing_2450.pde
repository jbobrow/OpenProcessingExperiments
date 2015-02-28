

/*

squares and ellipses
Magali Jaume
June,2009
magali@magalijaume.com

*/

boolean isDrawing = false;

float rot = PI;
float rad = (random (30,180));
float speed = 0.05;
float squares = 10;

float seed = 0;
float seed2 = 0;

void setup(){
  size(500,500);
  background(255);
  smooth();
};

void draw(){
  
  if (isDrawing) {
    
    rad = noise(seed) * 100;
    seed = seed + 1;
    
    squares = noise(seed2)*8;
    seed2 = seed2 * 0.02;
    
    translate(mouseX,mouseY);
    rotate (rot + 90);
    rect(rad,10,squares + 10, squares);
    fill(random(255),random(255),random(255),80);
    noStroke();
  
    
    rot = rot + speed;
  }
    
  };
  
  void mousePressed(){ 
    isDrawing = !isDrawing; 
     
}; 


