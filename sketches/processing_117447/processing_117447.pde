
void setup()
{
  size(700, 700);
  background(255);
  smooth();


  
 
}

void draw() {
  if (mousePressed) {

    noFill();
    float r = random(5,70);
      bezier(5, mouseX, 50 , mouseY, mouseX, r, mouseX, 0);
      
  } else {
    
  }
  
}
