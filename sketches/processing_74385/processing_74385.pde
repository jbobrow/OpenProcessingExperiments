
void setup() {
  size(400, 400);
  fill(255,255,255);
  background(400);

}

void draw() {
  background(255,255,255);
  
  if(dist(260, 200, mouseX, mouseY) > 30){
    fill(255,255,255);
    ellipse(260, 200, 30, 30);
  }else{
    fill(255,255,255);
    ellipse(width, height, 30, 30);
  }
  
  if(dist(70, 90, mouseX, mouseY) > 30){
    fill(255,255,255);
    ellipse(70, 90, 30, 30);
  }else{
    fill(255,255,255);
    ellipse(width, height, 30, 30);
  }
  
    if(dist(100, 250, mouseX, mouseY) > 30){
    fill(255,255,255);
    ellipse(100, 250, 30, 30);
  }else{
    fill(255,255,255);
    ellipse(width, height, 30, 30);
  }
  
   if(dist(260, 50, mouseX, mouseY) > 30){
    fill(255,255,255);
    ellipse(260, 50, 30, 30);
  }else{
    fill(255,255,255);
    ellipse(width, height, 30, 30);
  }
  
    if(dist(50, 350, mouseX, mouseY) > 30){
    fill(255,255,255);
    ellipse(50, 350, 30, 30);
  }else{
    fill(255,255,255);
    ellipse(width, height, 30, 30);
  }
  
  
  if(dist(350, 150, mouseX, mouseY) > 30){
    fill(255,255,255);
    ellipse(350, 150, 30, 30);
  }else{
    fill(255,255,255);
    ellipse(width, height, 30, 30);
  }
  
      if(dist(200, 300, mouseX, mouseY) > 30){
    fill(255,255,255);
    ellipse(200, 300, 30, 30);
  }else{
    fill(255,255,255);
    ellipse(width, height, 30, 30);
  }
  
    if(dist(300, 300, mouseX, mouseY) > 30){
    fill(255,255,255);
    ellipse(300, 300, 30, 30);
  }else{
    fill(255,255,255);
    ellipse(width, height, 30, 30);
  }
  
    if(dist(150, 150, mouseX, mouseY) > 30){
    fill(255,255,255);
    ellipse(150, 150, 30, 30);
  }else{
    fill(255,255,255);
    ellipse(width, height, 30, 30);
  }
  
  smooth();
    smooth();
  fill(0,0,0);
  ellipse(mouseX, mouseY, 50, 50);
  
  
}
