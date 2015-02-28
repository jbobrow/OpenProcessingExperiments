
void setup(){
  size(400,400); 
  smooth();
  background(255); 
 
}

void draw(){ 
  frameRate(40); 
  noFill(); 
  float a=random(510);
  float b=random(510); 
  fill(a/2,0,0,50); 
  stroke(200,0,a/2,50); 
  strokeWeight(10);
    rect(a*2,b*2,40,40); 
}  
