

void setup (){
  background(255);
  size(800,600);
  smooth();
}
void draw (){
  //background(255);
  stroke(23,89,1);
  strokeWeight(0);
  fill(204, 102, 255,100);
 // ellipse (100,100,55,20);
 fill(mouseX, mouseY, 255,100);
  ellipse (width/2,height/2,mouseX,mouseY);
   fill(mouseX, mouseY, 255,100);
 ellipse (mouseX,mouseY,mouseX,mouseY); 
   fill(mouseX, mouseY, 255,100);
   ellipse (mouseX+300,mouseY+300,22,22);
   ellipse (mouseX+55,mouseY,55,55);
  //saveFrame("bild.png");

}



