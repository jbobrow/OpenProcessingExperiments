
void setup(){
  size(700,400);
  background(13,250,15);
  strokeWeight(5);
  smooth();
  noFill();

}


void draw(){
  randomSeed(mouseX);
 
  for( int y=0; y < 400; y+= 30){
    for(int x= 0;x< 700; x+= 30){
     
    
      fill(random (100), random (0), random(200));
      ellipseMode(CENTER);
    rect(x,y,30,30);
    
  }
}
}
                
                
