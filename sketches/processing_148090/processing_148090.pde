

void setup(){
  
  size(700,300);
  colorMode(HSB);
}


void draw(){
  
  noStroke();
  fill(200,0,200,5);
  rect(0,0,width,height);
  
  
for (int i=0; i < 2500; i++){
  
  
  
  
  strokeWeight(random(25*i/5000));
  stroke(random(90,180),random(100,150),random(150,230),100);
  point(sin(i/2)*random(width),sin(i/2)*random(height));
  

} 
  
  
}
