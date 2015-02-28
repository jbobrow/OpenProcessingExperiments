
float counter =4000;
void setup() {
  size(200,200);
}

void draw()
{
   background(0);
  translate(200,220);
  
  pushMatrix();
  translate(-log(counter)*15,-log(counter)*15); 
   fill(70,70,70);
  ellipse(0,0,40,40);
  popMatrix();
  
  counter -=15; 
}
