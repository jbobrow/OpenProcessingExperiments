
void setup () {
size(300,300);
if(mousePressed) {
noFill(); 
stroke(0);
}else{
  fill(100);
  stroke(250);
}
ellipse(width/2, height/2, 250, 250);
}
void draw () {
  fill (0,2) ; 
  ellipse (mouseX, mouseY, 50, 50) ;
  ellipse(width/2, height/2, 150, 150);
  if(mousePressed) {
noFill(); 
stroke(0);
}else{
  fill(100);
  stroke(250);
}
}
