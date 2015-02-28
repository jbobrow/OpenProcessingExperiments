
void setup(){
  size(1200,400);
  background(255);
}

void draw(){
  if (keyPressed) {
    stroke(255);
    fill(225,75,20,10);
    }else{
    stroke(0);
    fill(100,200,255,10);
    }
  rectMode(CENTER);
  rect(600,200,mouseX,mouseY);
  
}

void mousePressed(){
 background(255);
}


