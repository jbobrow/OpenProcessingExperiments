
void setup(){
  
 size(400,400);
 background(0);
 
}

void draw(){
}

void mousePressed(){
  background(0);
  noStroke();
  fill(255,0,0);
  rect(0, 0, mouseX, mouseY);
}



