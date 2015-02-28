
void setup(){
size(400,400);
noStroke();
smooth();
}
void draw(){
   background (40,mouseY,mouseX);
  fill (255,150);
  ellipse (mouseX,height/2,50,50);
  ellipse (mouseX/.5,height/4,20,20);
  ellipse(200,mouseY,70,70);
  ellipse (mouseX,height/2,mouseX,mouseX);
}
