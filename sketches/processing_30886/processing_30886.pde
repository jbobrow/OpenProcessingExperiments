
void setup (){
  size (400, 310);
  smooth();
}

void draw (){
  
  background (255);
  fill (0);
  if(mousePressed){
    background(0);
    fill(255);
    ellipse (mouseX + random (50, 150), mouseY + random (50, 150), random (width), random (width));
  }
  else {
   ellipse (mouseX + random(5), mouseY, 15, 15);
  }
  
} 

