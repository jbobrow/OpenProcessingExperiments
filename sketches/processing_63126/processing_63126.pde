


void setup()

{
  size(600,300);
  smooth();
}
void draw()
{
  background(255);
  
  if(mouseX <200){
   fill(255, 0, 0);
    rect(0,0,200,height);
  }
 else if( (mouseX >200) && (mouseX <400) ) {
   fill(0,255,0);
   rect(200,0,200,height);
 }
 else {
   
  fill(0,0,225);
  rect(400, 0, 200, height);
 }
}

