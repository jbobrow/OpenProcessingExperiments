
void setup(){
  size (900,600);
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
  ellipse(600,450, mouseX, mouseY);
  
  fill(0);
  ellipse(random(180),random(300),mouseX, mouseY);
 }
