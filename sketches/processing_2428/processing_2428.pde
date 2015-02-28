
/*Drawing with shapes!
june 2009
cittavritti@shaw.ca
*/

boolean isDrawing = false;

PImage leaf;

void setup(){
  
  size(800,500);
  background(0,50,50);
  smooth();
  
  leaf = loadImage ("leaf.png");
  
};

void draw(){
  
  if (isDrawing){
  
  noStroke();
  
  image (leaf,mouseX,mouseY);
  translate (mouseX,mouseY);
  
  
  //fill (0,200,100);
  //ellipse (mouseX, mouseY,10,10);
  }
  
};

void mousePressed(){
  isDrawing = !isDrawing;
};
  

void mouseDragged() {
    isDrawing =!isDrawing; 
  };


void mouseReleased() {
  isDrawing = false;
  
};


