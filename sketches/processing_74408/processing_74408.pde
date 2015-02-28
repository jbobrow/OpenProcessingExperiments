
void setup(){
size(500, 200, P2D); 
background(255);
fill(255);
}

void draw(){
  if(mousePressed) {
  background(21, 129, 76);
  }
  
  if(pmouseX > 0 && mousePressed) {
  line(pmouseX, pmouseY, mouseX, mouseY);
  }
  
  if(dist(width/2, height/2, mouseX, mouseY) < 50){
    fill(0);
  }else{
    fill(255);
  }
  ellipse(width/2, height/2, 100, 100);
}
