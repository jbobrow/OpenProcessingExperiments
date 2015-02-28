
int a = 10;
int colour = 0;
 
void setup(){
  size(500,500);
  background(255);
}
 
void draw(){
  noStroke();
  fill(colour);
  ellipse(mouseX, mouseY, a, a);
}
 
void mouseClicked() {
 if(colour == 255) {
   colour = 0;
 } else {
   colour = 255;
 }
}
   
//ellipse(20, mouseY, 80, mouseY);


