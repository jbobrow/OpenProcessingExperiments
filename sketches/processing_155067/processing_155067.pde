
void setup() {
 size (500,400);
background(0,255,100); 
smooth();
}

void draw(){
  //background(25,96,99); 
  fill (53,0,255);
  if(mousePressed){
    ellipse(mouseX, mouseY,97,54);
  }
  
}
