
//mousePressed

void setup() {
  size(300,300);
}
void draw() {
  background(255);
  
  if(mousePressed == true)
  {
    if(mouseButton == LEFT){
     
    fill(255, 0,0);
    }
   
  }
  else
  {
    fill(255);
  }
  
  ellipse(width/2, height/2, 100, 100);
}

