

void setup(){
  size(400,400);
  background(0,0,170);
  smooth();
}

void draw(){
  background(0,0,0,170);
  noStroke();
  fill(0,0,255);
  
  if(mousePressed){
    ellipse(mouseX,mouseY,random(200), random(200));
  }
}
                
             
