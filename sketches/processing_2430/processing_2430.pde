
/*gradient canvas
june 2009
cittavritti@shaw.ca
*/

boolean isDrawing = false;

void setup(){
  
  size(500,500);
  background(0,50,50);
  smooth();
  
  
};

void draw(){
  
  if (isDrawing){
  
    noStroke();
    
    float x = 250;
    float y = 250;
    float d = dist (x, y, mouseX, mouseY);
    color c = color(d);
  
    fill (c);
    ellipse (mouseX, mouseY,10,10);
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


