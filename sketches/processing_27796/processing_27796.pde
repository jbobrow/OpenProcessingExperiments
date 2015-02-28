
void setup(){
  
  size(500,500);
  smooth();
  background(0);
}

void draw(){
  
  float radius;
  //float colour;
  
  radius = map(mouseY, 0, height, -100, 100);
  //colour = map(, 0, width, -255, 255);
  fill(0);
  stroke(255);
  
    if(mousePressed && mouseButton == LEFT){
      stroke(150);
    }
    
    else if(mousePressed && mouseButton == RIGHT){
      stroke(50);
    }
    
  ellipse(mouseX, mouseY, radius, radius);
}

