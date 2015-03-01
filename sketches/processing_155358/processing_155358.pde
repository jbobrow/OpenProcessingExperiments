
void setup(){
  size(500,500);
}
void draw(){
  background(40,0,70);
  fill(255,83,80);
  noStroke();
  triangle(30,30,mouseX,200,random(width),450);
  noStroke();
  fill(255,211,139);
  triangle(450,450,random(height),mouseY,300,300);
  fill(214,255,134);
  noStroke();
  triangle(mouseY,mouseX,200,10,random(height),random(width));
}
