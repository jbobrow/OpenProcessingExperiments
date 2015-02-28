
float  x=2;
void setup(){
  size(800,800); 
  smooth();
}
 
void draw(){
 
  strokeWeight(x);
  if (x<=0.2){x=0.2;}
  if (mousePressed) { 
   line(mouseX,mouseY,pmouseX,pmouseY);
    }}
 void keyPressed() {
    if (keyCode == UP) {
   stroke(255,255,255);
    } else if (keyCode == DOWN) {
      stroke(1,1,1);}
      if (keyCode == LEFT){
      x=x-0.1;}
      else if (keyCode == RIGHT){
        x=x+0.1;}
 }
