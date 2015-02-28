

void setup (){
  size(400,400);
  smooth ();
  background (255);
 
}
void draw(){

  if (mousePressed){
  fill (255);
  noStroke();
  ellipse (mouseX,mouseY,15,15);
  }
  if(mousePressed==false){
    background(0);
  
  }
}


