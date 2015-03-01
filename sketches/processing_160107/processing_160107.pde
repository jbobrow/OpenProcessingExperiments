
void setup() {
  size(600, 600);  
 
  
  stroke(0,0,255,30);  //low alpha - kinda cool
 background(0);  
  frameRate(3000);//really fast
}
void draw(){
  
  float x=random(width); 
  float y=random(height); 
   strokeWeight(2);
  line( x,0, y,height);
  if (mousePressed){
    background(0);
  }
 
  
}
