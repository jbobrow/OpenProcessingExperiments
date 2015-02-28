
// Based on Ball Draw Tool by A. Stauffer, 2014

void setup(){
  size(1000, 500);
  background(0);
  noStroke();
}

void draw(){
  if(mousePressed){
    float size=random(1,15);
    fill(random(200,255),random(0,250),0);
    
    ellipse(mouseX+random(-25,25),mouseY+random(-25,25),size,size);
  }
}
