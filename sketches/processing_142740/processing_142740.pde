
void setup(){
  size(600, 800);
}

void draw(){
  background(128);
  
  fill(mouseX, mouseY, 220);
  
  ellipse(mouseX, mouseY,
          mouseX * random(0.9, 1),
          mouseX * random(0.9, 1));
                    
  ellipse(mouseX*0.5, mouseY*0.5, 155, 155);
}
