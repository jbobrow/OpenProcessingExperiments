
void setup() {
  size(600,600);
  background(0);
  stroke(225);

}
 
 
void draw(){
  if (mousePressed){
   rectMode(CENTER);
    fill(5,236,242);
    rect(mouseX,mouseY,mouseX*0.5,150,30);
  } else {
   
    fill(100,mouseY*0.3,150,30);
  }
  ellipse(mouseX,mouseY,mouseX*0.5,100);
  
}



