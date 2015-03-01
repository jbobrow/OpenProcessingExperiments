
void setup() {
  size(1000, 20) ;
  background(255);
  smooth() ;
}
 
void draw() {
  if (mousePressed) {
  
    fill(0) ;
    stroke(0);
  } else {
    fill (0) ;
    stroke(255);
  }
    
    float carro=random(1000);
  ellipse(mouseX,mouseY,carro,carro);
   
}

