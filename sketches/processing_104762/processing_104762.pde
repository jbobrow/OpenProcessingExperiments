
int px;
int py;

void setup() {
  smooth();
  size(510, 510);
  background(#333333);
  noFill();
  stroke(#FFFFFF);
  fill(#E52A59);

noFill();
 px=0;
}


void draw() {
  fill(#E52A59);
  ellipse(mouseX, 100, 50,50);
  ellipse(mouseX, 400, 50,50);
   fill((color(random(0),random(150),random(170))));
 rect(mouseX, 200, 100, 100);
 fill(250,250,250);
 rect(mouseX,150,50,50);
 rect(mouseX,300,50,50);
 fill(#FEFF00);
 rect(mouseX,20,30,30); 
  px++;
  rect (px,480,10,10); 
  py++;
  rect (480,py,10,10); 
  

}
