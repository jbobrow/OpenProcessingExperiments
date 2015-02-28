
void setup(){
  size(500, 500);
  smooth();
  background(255);
}
   
void draw(){
   
  if(mousePressed){
  stroke(80, 80, 80, 20);
  line (width/2, 50, mouseX, mouseY);
  line(width/2, height-80, mouseX, mouseY);
  }
   
  else{
    noStroke();
    fill(0);
    triangle(160, 290, 250, 140, 340, 290);
  }
 
}

