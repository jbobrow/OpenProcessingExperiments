
void setup(){
  size(480,240);
  smooth();
}

void draw(){
  //background(255,120); 
  if (mousePressed){
    ellipse(mouseX,mouseY,30,30);
    fill(random(0,255),random(0,255),random(0,255));
  }
  else{
    }
}
