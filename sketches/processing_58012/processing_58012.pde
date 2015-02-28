
void setup(){
  size(715, 300);
  background(0);
  smooth();
  stroke(0);
}
 
void draw(){ 
  float k = 0;
  for(int i = 60; i < 600; i=i+(600/6)){
    
    pushMatrix();
    
      fill(255);
      translate(i, height/2);
      rotate(-PI/2);
      
      arc(0, 0, 75, 75, 0, PI*4);
      fill(0);
      k=k+5;
      arc(k, k, 75, 75, 0, PI*4);
      
    popMatrix();
  }
  
  fill(255);
  translate(660, height/2);
  rotate(-PI/2);
  arc(0, 0, 75, 75, 0, PI*4);
}
