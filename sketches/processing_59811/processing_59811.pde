
void setup() {
  size(400,400);
  smooth();
  background(255,0,0);
  noCursor();
}

void draw() {
  if(mousePressed){
        stroke(200,50);
    line(mouseX, mouseY,200,200);
 }else{
   stroke(0,40);
   line(mouseX,0,200,100);
   line(mouseX,400,200,300);
  }
}  
