
void setup(){ 
  size(400,400);
  background(0);
  noFill();
  c(width/2,height/2);
}
 
void draw(){ 
  if(mousePressed){
    c(mouseX,mouseY);
  }
}
void c(float x, float y){
  background(0);
  for(int i=1; i<100; i+=4){
    strokeWeight(random(3,20));
    
    stroke(random(50,255),random(50,255),random(50,255),random(255));
    ellipse(x,y,i*2,i*2);
  }
}
