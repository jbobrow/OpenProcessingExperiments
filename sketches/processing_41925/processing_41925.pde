
float a = 0;

void setup(){
  size(400, 400);
  background(255);
}

void draw(){
  fill(mouseY, mouseY);
  ellipse(mouseX, mouseY, a, a);
  if(mousePressed){
    
    a =a + 0.5;
    stroke(0);
  }else{stroke(255);}
}
                
                
