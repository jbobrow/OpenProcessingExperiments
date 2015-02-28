
void setup(){
  size(400,400);
  noStroke();
  noCursor();
  background(0,0,60);
  rectMode(CENTER);
}

void draw(){
  if(keyPressed==true){
    fill(255,255,30,30);
  }
  else
  {
    fill(30,255,255,200);
  }
 if(mouseY<=200){
    rect(mouseX,mouseY,20,20,mouseX/2,mouseY/2,50,50);
    rect(mouseX,400-mouseY,20,20,mouseX/2,mouseY/2,50,50);
 }
 else
 {
   rect(mouseX,mouseY,20,20,mouseX/2,mouseY/2,50,50);
   rect(mouseX,200-(mouseY-200),20,20,mouseX/2,mouseY/2,50,50);
 }

  if(mousePressed==true){
    fill(0,0,60);
    rect(0,0,800,800);
  }
  else
  {
    rect(0,0,0,0);
  }
}
