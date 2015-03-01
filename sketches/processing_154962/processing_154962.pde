
void setup(){
  size(500,400);
  background(200,50,0);
  
}


void draw(){
  stroke(200,50,0);
  line(0, 0, 500, 0);
  line(0, 0, 0, 400);
  stroke(0);
  if(mousePressed){
    fill(0,0,0);
    ellipse(mouseX,mouseY,15,15);{
    strokeWeight(2);
    line(mouseX,0,0,0);
    line(0,mouseY,0,0);
   }
   
   
  }
  if (keyPressed)
   {
    background(200,50,0);
  }
}
