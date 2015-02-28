
void setup(){
  size(500,500);
  smooth();  
}

void draw(){
 strokeWeight (random(2,10)); 
  ellipse(mouseX, mouseY, 100, 100);
}

