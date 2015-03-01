
void setup(){
 size(600, 600);
 smooth();
 noCursor();
}
 
void draw(){

  float a = random(20, 150);
  float b = random(30,70);
 float c = random(60,100);
 
  if(mousePressed){
    background(a, b, c);
  }
  else{
  fill(a, b, c);
  ellipse(mouseX, mouseY, mouseX-150, mouseX-150);
  ellipse(width-mouseX, height-mouseY, mouseX-150, mouseX-150);
  }
}
