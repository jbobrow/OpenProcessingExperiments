
void setup(){
 size(400,400);

}

void draw(){
  background(255,255,255);
  fill(113);
  ellipse(200,200,mouseX,mouseX); //this is an ellipse fixed at a point that can be manipulated
  fill(113);
  ellipse(mouseX,mouseY,50,50);
  
}


