
void setup(){
  size(500, 500);
  smooth();
  background(000);
}
    
void draw(){
    
  if(mousePressed){
  stroke(80, 80, 80, 20);
  line (width/2, 50, mouseX, mouseY);
  line(width/2, height-80, mouseX, mouseY);
  }
    
  else{
    noStroke();
    fill(255);
    ellipse (455, 455, 55, 55);
    ellipse (100, 100, 55, 55);
  }
  
}


