
void setup(){
size(400,400);
stroke(150);
smooth();
 background(227,158,46);

}
void draw(){
  filter(BLUR,1.0);
  fill(8,152,98);
triangle(mouseX,mouseY, 58, 20, 86, 175);
fill(217,46,227);
rect(mouseX,mouseY, 98, 90);



}







