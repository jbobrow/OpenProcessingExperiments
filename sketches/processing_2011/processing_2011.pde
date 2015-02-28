
boolean isDrawing=false;

void setup(){
  
  size(800,500);
  background(0);
  smooth();
  

}

void draw() {
  if(isDrawing){
    
    
    fill (random(200, 255), random(125,255), random(150));  
    stroke(random(150,255));  
    rect(mouseX, mouseY, random(5,30), random(5,30)); 
  }
  
}

void mousePressed() {
  isDrawing = !isDrawing;
  
};
void keyPressed() { 
  background(random(150,255)); 

};

