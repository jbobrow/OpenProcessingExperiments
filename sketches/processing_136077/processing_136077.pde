
void setup(){
  size(1000, 500);
  background(0);
  noStroke();
}

void draw(){
  if(mousePressed){
    float size=random(1,15);
    fill(0,random(200,255),random(0,250));
    
    ellipse(mouseX+random(-25,25),mouseY+random(-25,25),size,size);
  }
}
