
void setup(){
  size (400,400);
    background (153,12,219*random(2));
}
  
  
  
  void draw(){
   
      
    fill (0,189,255*random(2),80);
    stroke(255,50);
    strokeWeight(2);
    smooth();
    float distancia = dist (mouseX, mouseY, width/2, height/2);
    ellipse (width/2, height/2, 2*distancia, 2*distancia);
    
  }
    

