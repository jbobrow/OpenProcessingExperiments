
void setup(){
  size (1500,1000);
  background (128,128,128);
  
  fill(0);
  ellipse(100,100,100,100);
  
  fill(0);
  ellipse(50,50,100,100);
  
  fill(0);
  ellipse(78,92,100,100);
}

void draw(){
  noStroke();
  fill(255);
  ellipse(1000,750, mouseX, mouseY);
  
  fill(0);
  ellipse(random(300),random(500),mouseX, mouseY);
}
