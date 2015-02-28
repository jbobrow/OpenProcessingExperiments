
void setup(){
  background(0);
  size(600, 600);
}
void draw(){
  
}


void mouseDragged(){ 
  stroke(random(200), random(125), random(54));
strokeWeight(5);
  for(int i=0; i<30; i++){
    
    point(mouseX + random(10), mouseY + random(10));
     point(mouseX - random(10), mouseY - random(10));
  }
  stroke(255);
  strokeWeight(2);
  line(pmouseX, pmouseY, mouseX, mouseY);
  


}







