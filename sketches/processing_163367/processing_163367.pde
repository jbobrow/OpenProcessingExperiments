
void setup() {
size(250,250)
}
 
void draw() {
fill(254,120,10)
rect(mouseX,mouseY,30,30)
line(mouseX, 20, pmouseX, 80); 
  println(mouseX + " : " + pmouseX);
line(mouseY, 20, pmouseY, 80);
  println(mouseY + " : " + pmouseY);
}
 
