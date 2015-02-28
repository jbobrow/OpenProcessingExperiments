
void setup(){
  size(500,500);
  background(#9186FA);  
  smooth();
    }

void draw(){
  fill(#D9B8FA,noise(0+500));
  ellipse(mouseX,mouseY,random(100),random(100));
  strokeWeight(2);
  stroke(255);
  rectMode(CENTER);
  rect(mouseX,mouseY,random(100,200),random(100,200));
}
  
  
void mousePressed(){
  background(#9186FA);
}

