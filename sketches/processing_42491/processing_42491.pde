
int value = 150;
 
void setup (){
  size (400,400);
  noStroke ();
  smooth ();
}
    
void draw() {
  background( 2, 2, 100);
  fill(200, 160, 19);
  ellipse(value, value, value, value);
  
  if(mousePressed) {
    value = value + 6;
  } else {
    value = 3;
  }
  
  fill(value, value + 60, value -100);
  ellipse(mouseX, mouseY, value, value);
}
 
