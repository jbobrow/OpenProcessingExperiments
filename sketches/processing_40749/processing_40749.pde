
void setup(){
  
  size(400,400);
  background(0);
  smooth();
}

void draw (){
  noStroke();
  
}

void mouseMoved() {

  fill (0,50);
  rect(0,0,width, height);
  
fill(200);
  
 stroke (0);
   stroke (255);
      fill(255);
  ellipse(mouseX,mouseY, mouseY,mouseY);

}

