
/* 

mouse pressed function
sean_velasco@hotmail.com
june 2009


*/



void setup() {
  size(800, 600);
  fill(126);
  background(102);
  rectMode(CENTER);

  
}

void draw() {
  
  float a;
  a = (random(0,30));
  
  if(mousePressed) {
    
    stroke(255);
    fill(0, random(0,255), 0);
    rect(mouseX, mouseY, a, a);

  } else {
    
    stroke(0);
    ellipse(mouseX, mouseY, a, a); 
  }


}

