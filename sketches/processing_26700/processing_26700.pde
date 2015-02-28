
//creature

void setup() {
  size(500,500);
 
}
void draw() {
   background(255);
  frameRate(10) ;
  smooth();
  //change colour of the head
  fill(mouseX,34,mouseY);
  ellipse(mouseX,mouseY,120,120);
  fill(255);
  ellipse(mouseX-20,mouseY,30,30);
  ellipse(mouseX+20,mouseY,30,30);
  fill(0);
  ellipse(mouseX-20,mouseY,10,10);
  ellipse(mouseX+20,mouseY,10,10);
  fill(20,130,20);
  //move body with the mouse

  fill(255,10,10);
  rect(mouseX-25,mouseY+20,50,20);
}
void mousePressed() {
println( "Hello");
}


