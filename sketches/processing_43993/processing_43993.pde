
void setup(){
  size(400,400);
  background(250,114,114);
  smooth();
}

int c;
float a = random (30);

void draw(){
  fill(114,250,114,100);
  noStroke();
  if(mousePressed){
    c = c+2;
    ellipse(mouseX, mouseY,c,c);
  }else{
  fill(250,114,114);
  ellipse(mouseX, mouseY,c,c);
}
}
    
                
                
