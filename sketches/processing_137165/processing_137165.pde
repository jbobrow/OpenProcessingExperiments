



void setup(){
  size(500,500);
  background(255);
}


void draw(){
  
  if(mousePressed){
    
    float pmousex = mouseX;
    float temp = abs(pmouseX-mouseX);
    fill(0,50);
    noStroke();
    ellipse(mouseX, mouseY, temp, temp);
  
  }
}


